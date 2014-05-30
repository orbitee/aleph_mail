#!/usr/bin/perl


#############  The MIT License #############################################
# 
# Copyright (c) 1997-2008, Christine Moulen and Massachuestts Institute of Technology
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
############################################################################# 


# Process ALEPH Batch files.
# Written by: Anthony Moulen - ajmoulen@alum.mit.edu
#             Christine Moulen - orbitee@mit.edu
# Created on: 16 May 2005
# Last Modified: 23 May 2005
# Change Log:
# 16 May 2005 by Anthony Moulen - Finished Initial project
# 23 May 2005 by Anthony Moulen - Added better error logging and checks
# 23 May 2005 by Christine Moulen - setup for use on grammy
# 24 May 2005 by Anthony Moulen - Updated to send result statement, correct timestamp.
# 05 Jul 2005 by Anthony Moulen - Modified to work with XML files
# 18 Jul 2005 by Christine Moulen - Activating on Aleph server
# 11 Aug 2006 by Christine Moulen - Updates for version 18
# 7  Jul 2010 by Christine Moulen - Delete empty err logs.
# 8  Jul 2010 by Christine Moulen - Major rewrite, moving most vars
#        out to a config file.
# 15 May 1014 by Christine Moulen - Incorporating some changes from Hans 
#        Breitenlohner @ University of Maryland.  
#        - use of <form-format> to select templates
#        - modified parsing of filenames to handle multiple periods
#        - ability to send a Cc: based on a configuration value.

use MIME::Lite;            # send email
use Email::Valid;          # validate email address format
use XML::LibXSLT;          # XSLT Tranformation Functions
use XML::LibXML;           # XML parsering functions
use English;               # convert some symbolic Perl vars to english
use Getopt::Long qw(GetOptions);        # process command line options
use Env;                       # import environmental variables

Env::import();                 # equate env variables with Perl variables of same name

my $config;
my %config;
my @recipients = ();
my @myargs = @ARGV;  

# Process options or Show Usage Information
GetOptions( "config=s" => \$config)
        || die "ERROR: Couldn't process options\n";
if(! -r $config){
    die "\nusage: $0 --config=<config file>(required)\n\n";
}

my $vars                = readConfig($config);
my $home_dir            = $vars->{'homedir'};
my $bin_dir             = $vars->{'bindir'};
my $xslt_dir            = $vars->{'xsltdir'};
my $batch_dir           = $vars->{'batchdir'};
my $log_dir             = $vars->{'logdir'};
my $error_ext           = $vars->{'errorext'};
my $result_ext          = $vars->{'resultext'};

my $debug_mode          = $vars->{'debugmode'} || 0;
my $debug_email         = $vars->{'debugemail'};
my $debug_from          = $vars->{'debugfrom'};
my $debug_file          = $vars->{'debugfile'};
my $debug_log           = $vars->{'debuglog'};
my $debug_dir           = $vars->{'debugdir'};

my $smtp_relay          = $vars->{'smtprelay'};
my $interval            = $vars->{'sleepsec'};

my $batch_ext           = $vars->{'batchext'};
my $log_save_days       = $vars->{'savedlogdays'};
my $ext_email           = $vars->{'extemail'};
my $ext_cc              = $vars->{'extcc'};
my $ext_print           = $vars->{'extprint'};
my $ext_stats           = $vars->{'extstats'};
my $ext_extra           = $vars->{'extextra'};
my $ext_admin           = $vars->{'extadmin'};


# Process Arguments
if($debug_mode==1){
	print "Entering Debug Mode.\n";
	print "Using $batch_ext as extension.\n";
	$FROM_ADDRESS = $debug_from;
	open(DEBUG_LOG, "> $debug_dir\/$debug_log") || 
	    die "Error opening debug file.\n";
	$admin_address = $debug_from;
} else {
	$FROM_ADDRESS = $ext_email;
	$admin_address = $ext_admin;
}

# Build file list
if(defined $debug_file){
	@BATCH_FILES = ($debug_file);
} else {
	@BATCH_FILES = `ls $batch_dir/*.$batch_ext`; 
}
# A bunch of wierd time stuff.
@temp = split ' ', `date`;
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = 
    localtime(time);
$mon++;
$year+=1900;
$maildate = join ' ', $temp[0].',', $temp[2], $temp[1], $temp[5], $temp[3], $temp[4];
# Format like 20050524-134350
$timestamp= sprintf("%04d%02d%02d-%02d%02d%02d",$year,$mon,$mday,$hour,$min,$sec);
$stats_file = "$log_dir\/$ext_stats-$year-$mon";
open(STATS, ">> $stats_file") || die "Unable to open $stats_file for append.\n";

# Process the files
foreach $BATCH_FILE (@BATCH_FILES){
	# Set our output files
	$print_ext = $ext_print;
	@filetemp = split'/', $BATCH_FILE;
	$myfile = pop @filetemp;
	chomp $myfile;
	
	# My processing files.
#	($basefile,$baseext) = split(/\./, $myfile);
	$basefile = $myfile;
	$basefile =~ s/\.[^.]*$// ;
	$print_output = "$batch_dir\/$basefile.$print_ext";
	$error_log = "$log_dir\/$basefile-$timestamp.$error_ext";
	$result_log = "$log_dir\/$basefile-$timestamp.$result_ext";
	$drop_file  = "$batch_dir\/$basefile-$timestamp-err.$batch_ext";
        $working_file = "$batch_dir\/$myfile";

	# Open our files	
	next unless -s $working_file;  # Don't bother processing file of zero size
	open(IN, "< $working_file") 
	    || die "No Input File $working_file available.\n";
	open(ERRORS,">  $error_log") 
	    || die "Error opening error log $error_log.\n";
	open(PRINTOUT,"> $print_output.tmp") 
	    || die "Error opening print output $print_output.\n";
	open(RESULTS, "> $result_log") 
	    || die "Error opening results log $result_log.\n";
	open(DROPFILE, "> $drop_file") 
	    || die "Error opening drop file $drop_file.\n";

	# Global use variables.
	$to_address = "";
	$plain_body = "";
        $html_body  = "";
        $xml_stream = "";
        $subject_line = "";
	# Call the processing loop.
	&processing_loop;
	
	# Close our files.
	close(IN);
	close(PRINTOUT);
	close(DROPFILE);
	
	# Unlink the drop file if we didn't have any failed mailings.
	if ( -z "$drop_file") {
		unlink "$drop_file";
	}
	
	# Move processed file to save directory.
	$save_dir = sprintf("%s/save-%04d-%02d-%02d",
			    $batch_dir, $year, $mon, $mday);
	mkdir "$save_dir";
	eval{
	    rename ("$batch_dir\/$myfile",
		    "$save_dir\/$myfile.$timestamp" );
	} ;
	print ERRORS "Unable to move file $myfile - $EVAL_ERROR.\n"
	    if $EVAL_ERROR;
	if ( -z "$print_output.tmp") {
	    unlink "$print_output.tmp";
	} else {
	    eval{
		rename ("$print_output.tmp",
			"$print_output" );
	    } ;
	    print ERRORS "Unable to move $print_output tmp file - $EVAL_ERROR.\n" 
		if $EVAL_ERROR;
	}
	# Finally close the errors file.
	close(ERRORS);

		# Unlink the errors file if we didn't have any errors.
	if ( -z "$error_log") {
		unlink "$error_log";
	}

}

# Hurrah we reached the end!
exit;

# Process the current input file.
sub processing_loop
{
    $to_email_file = 0;
    $to_print_file = 0;
    $to_drop_file = 0;
    while (<IN>) {
    	if( $_=~m/^## - XML_XSL/){
            if($xml_stream ne ""){
                &process_stream;
	    }
            $xml_stream = "";
	    $fileheader = $_;
	} elsif ($_=~m/^## -/) {
		 $fileheader .= $_;
	} else {
		 $xml_stream .= $_;
	}
    }
    &process_stream;
    close(RESULTS);
    &append_stats;
}

sub process_stream {
	my $parser = XML::LibXML->new();
	my $xslt = XML::LibXSLT->new();
	my $source = $parser->parse_string($xml_stream);
	my $root = $source->getDocumentElement;
	$transformation_file = $root->findvalue('form-name');
	$transformation_file_2 = "${transformation_file}-" . $root->findvalue('form-format');
	my ($plain_xslt, $html_xslt);
	if (-e "$xslt_dir/plain-${transformation_file_2}.xsl" ) {
	    $plain_xslt = "$xslt_dir\/plain-$transformation_file_2.xsl";
	} else {
	    $plain_xslt = "$xslt_dir\/plain-$transformation_file.xsl";
	}
	if (-e "$xslt_dir/${transformation_file_2}.xsl" ) {
	    $html_xslt = "$xslt_dir\/$transformation_file_2.xsl";
	} else {
	    $html_xslt = "$xslt_dir\/$transformation_file.xsl";
	}
	print "$plain_xslt\n$html_xslt\n";
        if ($batch_ext =~ m/_req/) {
            $to_address = $ext_email;
        } else {
	    $to_address = $root->findvalue('email-address');
	}
        $subject_line = $root->findvalue('subject');
	if(defined($to_address) && Email::Valid->address($to_address)){
           my $style_doc = $parser->parse_file($plain_xslt);
           my $stylesheet = $xslt->parse_stylesheet($style_doc);
           my $results = $stylesheet->transform($source);
   	   $plain_body = $results->toString;
           $plain_body =~s/\<\?xml version\=\"1\.0\"\?\>//g;
           my $style_doc = $parser->parse_file($html_xslt);
           my $stylesheet = $xslt->parse_stylesheet($style_doc);
           my $results = $stylesheet->transform($source);
           @myresults = split("\n", $stylesheet->output_string($results));
#           @myresults = split("\n", $results->toString);
           $html_body = "<HTML><HEAD></HEAD><BODY>\n";
           foreach $line (@myresults){
              if($line=~m/xml version/){
	         next;
	      }
              if( $line=~m/^\<META HTTP-EQUIV/){
	         $line=~s/.*TABLE/<TABLE/;
              }
              $line=~s/<TABLE/\n<TABLE/g;
              $html_body .= $line . "\n";
           }
           $html_body .= "</BODY></HTML>\n";
           &send_message;
	 } else {
		print "No Email Address\n";
		&print_log;
         }
}

# Append to stats and send report.
sub append_stats{
   # Append stats to stat file.
   print STATS "$timestamp $myfile $to_email_file $to_print_file $to_drop_file.\n";

   if ($admin_address ne "NONE") {
   # Email File Stats to Administrators
       $email_body = "This message is to inform you that batch emails from Aleph have been sent.\n\n".
	   "If you are monitoring circulation emails, you should see this message every morning for courtesy, overdue, and lost notices.  Recall letters are sent 3 times each day, but sometimes there are no recalls.\n\n".
	   "If you are monitoring acquisitions emails, you should see this message Monday through Friday mornings only.\n\n".
	   "Contact Christine if you ever do not receive this message on schedule, as there could be a problem.\n\n".
	   "Processed file: $myfile\n\n".
	   "Sent $to_email_file email message(s)\n\n".
	   "Sent $to_print_file messages to printout file\n\n".
	   "Sent $to_drop_file messages to retry file\n\n";
       $my_message = MIME::Lite->new(
		From            => $admin_address,
                To              => $admin_address,
		Subject         => "$0 processing log.",
                Datestamp       => 'false',
                Date            => $maildate,
		Data		=> $email_body,
                Type            => 'TEXT'
                );
       if ($ext_extra eq 'Y') {
	   $my_message->attach(
                Type            => 'TEXT',
		Path		=> $result_log,
		);
       }
       # Attempt to send message
       eval{
	   $my_message->send;
       } ;
       print ERRORS "Unable to send processing log - $EVAL_ERROR\n" 
	   if $EVAL_ERROR;
   }
}

# Attempt to send message to the SMTP service.
sub send_message 
{
	# Check for Debug Mode
	if ($debug_mode == 1){
		&print_log;   # dump to print file
		$plain_body = "Email destined for: ". $to_address . "\n" . $plain_body;
		print DEBUG_LOG "Message destined for $to_address.\n";
		$to_address = $debug_email;
	} 
	# Check for SMTP Relay setting.
	if (defined $smtp_relay){
		MIME::Lite->send('smtp', $smtp_relay, Timeout=>60);
	}
	# Build email message.
	$my_message = MIME::Lite->new(
		From		=> $FROM_ADDRESS,
		To		=> $to_address,
		Subject		=> $subject_line,
		Datestamp	=> 'false',
		Date		=> $maildate,
                Type            => 'multipart/alternative',
                Encoding        => '7bit'
                );
	if (defined $ext_cc) {
	    $my_message->add(
                Cc              => $ext_cc
		);
	}
        $my_message->attach(
                Type            => 'TEXT',
		Data		=> $plain_body,
                Encoding        => '7bit'
		);
        $my_message->attach(
                Type            => 'text/html',
                Data            => $html_body,
                Encoding        => '7bit'
                );
	# Attempt to send message
	eval{
		$my_message->send;
	} ;
	if ($EVAL_ERROR) {
		sleep $interval;
		eval {
			print ERRORS "Missed send attempt, retrying.\n";
			$my_message->send;
		};
		if ($EVAL_ERROR) {
			print ERRORS "An error occured: $EVAL_ERROR\n";
			&drop_error_log
		} else {
			print RESULTS "Message emailed on second attempt to $to_address.\n";
		}
	} else {
		print RESULTS "Message emailed to $to_address.\n";
	}
	$to_email_file++;
}

# Send to the hard copy print file for later processing.
sub print_log
{
	print PRINTOUT $fileheader;
	print PRINTOUT $xml_stream;
	print RESULTS "Message added to print file for hardcopy.\n";
	$to_print_file++;
}

# Send to error message file for later retry.
sub drop_error_log
{
	print DROPFILE $fileheader;
	print DROPFILE $xml_stream;
	print RESULTS "Message for $to_address added to error drop file for retry later.\n";
	$to_drop_file++;
}

sub readConfig{
#------------------------------------------------------
# returns hashref
#------------------------------------------------------
    my ($file) = @_;

    if(! -r $file){
        sendmail('error', "can't read $0 config file");
        exit;
    }
    my $field;

    open(FH, $file) or die "\nCan't read config file $file: $!";
    while(<FH>){
        next if(/^\s*$/ || /^\s*\#/);
        if(/\s*\[(.+)\]/){
            $field = $1;
#	    print "$field ";
             next;
             }
        if($field eq 'emailto'){
            chomp $_;
            $recipients[$#recipients+1] = $_;
            next;
            }
        if(substr($_,0,1) eq '$'){
                chomp;
                $string = join '', '"', $_, '"';
                $config{$field} = eval $string;
#		print "$config{$field}\n";
                next;
                }
        if(substr($_,0,1) eq "\'"){
                $config{$field} = eval $_;
#		print "$config{$field}\n";
                next;
                }
        # clean data
        s/\s//g;
        $config{$field} = $_;
#	print "$config{$field}\n";
	    }
    close(FH);

    return \%config;
}
