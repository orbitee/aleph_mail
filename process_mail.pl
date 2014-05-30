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
# 14 Jan 2008 by Christine Moulen - hard-coded *_req print ID's to mail
#                                   to configured email address, rather
#                                   than one (not) found in the XML
#                                   For mailing hold slips to staff
#

require MIME::Lite;            # send email
require Email::Valid;          # validate email address format
require XML::LibXSLT;          # XSLT Tranformation Functions
require XML::LibXML;           # XML parsering functions
require English;               # convert some symbolic Perl vars to english
use Env;                       # import environmental variables

Env::import();                 # equate env variables with Perl variables of same name

# Debug Mode Settings
# DEBUG_MODE  - Used to set the application into debug mode
# DEBUG_EMAIL - Address used to send all notices to during a debug session
# DEBUG_FROM  - Address put on the FROM line to receive returned mail
# DEBUG_FILE  - File used for debug mode.
# DEBUG_LOG   - Debug Log file.
# DEBUG_DIR   - Directory to send debugging files.

#$DEBUG_MODE  = 1;
$DEBUG_EMAIL = "orbitee\@mit.edu";
$DEBUG_FROM  = "orbitee\@mit.edu";
#$DEBUG_FILE  = "ovdsum_01_00.circ_email";
$DEBUG_LOG   = "process.dbg";
$DEBUG_DIR   = "$MIT_SCRIPT_BASE/mail/log";

# Global Settings
# SMTP_RELAY   - SMTP relay for sending email, comment out to use local sendmail.
# ADMIN_ADDRESS- Address to send administrative messages to. (not in use)
# BATCH_DIR    - Location of the batch files. 
# BATCH_EXT    - Extention for batch files in this run
# EXT_OPTS     - Options based on extension
#              - email: Email address from which email is sent.
#              - print: File extension needed for client to pick up file.
#              - subject: Subject for the messages.
# LOG_DIR      - Directory for sending log files
# ERROR_EXT    - Extension to add at the end of error files.
# RESULT_EXT   - Extension to add to the results log file.
# XSLT_DIR     - Directory with the XSLT Transformation files. 

$SMTP_RELAY   = "outgoing.mit.edu";
#$ADMIN_ADDRESS = "orbitee\@mit.edu";
# Switch these back on production/test environment
$BATCH_DIR    = "$data_print";
$BATCH_EXT    = "circ_email";
%EXT_OPTS     = ("circ_email" => { 
                       "email"   => "circulation\@mit.edu",
		       "print"   => "circ_notic",
		       "stats"   => "courtesy_stats",
		       "admin"   => "circ_print\@mit.edu"
		       },
		 "circ_wait" => {
		       "email"   => "circulation\@mit.edu",
                       "print"   => "circ_notic",
                       "stats"   => "courtesy_stats",
                       "admin"   => "NONE"
                       },
                "eng_req" => { 
                      "email"   => "bookpage-barker\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
                "dew_req" => { 
                      "email"   => "bookpage-dewey\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
                "hay_req" => { 
                      "email"   => "bookpage-hayden\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
                "rtc_req" => { 
                      "email"   => "bookpage-rotch\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
                "aer_req" => { 
                      "email"   => "bookpage-aero\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
                "mus_req" => { 
                      "email"   => "bookpage-lewis\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
                "lin_req" => { 
                      "email"   => "bookpage-lindgren\@mit.edu",
                      "print"   => "req_print",
                      "stats"   => "req_stats",
                      "admin"   => "NONE"
                      },
		 "mono_email" => { 
		       "email"   => "monoacq\@mit.edu",
		       "print"   => "mono_acq",
                       "stats"   => "mono_stats",
		       "admin"   => "acq_print\@mit.edu"
		       }
		 );
$LOG_DIR      = "$MIT_SCRIPT_BASE/mail/log";
$ERROR_EXT    = "err";
$RESULT_EXT   = "log";
$XSLT_DIR     = "$MIT_SCRIPT_BASE/mail/transforms";

# Show Usage Information
if(defined $ARGV[0] && $ARGV[0] eq "usage"){
        print "$0 [usage|debug] [<extension>] [<debugfile>]\n";
	print "Available extentions: \n";
	foreach $mykeys (keys %EXT_OPTS) {
		print "\t $mykeys\n";
	}
	exit;
}

# Process Arguments
if((defined $ARGV[0] && $ARGV[0] eq "debug") || $DEBUG_MODE==1){
	$DEBUG_MODE=1;
	print "Entering Debug Mode.\n";
	if(defined $ARGV[1]) {
		$BATCH_EXT = $ARGV[1];
	}
	if(defined $ARGV[2]) {
		$DEBUG_FILE=$ARGV[2];
	}
	$FROM_ADDRESS = $DEBUG_FROM;
	open(DEBUG_LOG, "> $DEBUG_DIR\/$DEBUG_LOG") || 
	    die "Error opening debug file.\n";
	$ADMIN_ADDRESS = $DEBUG_FROM;
} else {
	if(defined $ARGV[0]) {
		$BATCH_EXT = $ARGV[0];
	}
	if($#ARGV == 1) {
		print "Ignoring debug file argument, not in debug mode.\n";
	}
	$FROM_ADDRESS = $EXT_OPTS{$BATCH_EXT}->{"email"};
	$ADMIN_ADDRESS = $EXT_OPTS{$BATCH_EXT}->{"admin"};
}

print "Using $BATCH_EXT as extension.\n" if $DEBUG_MODE==1;

# Build file list
if(defined $DEBUG_FILE){
	@BATCH_FILES = ($DEBUG_FILE);
} else {
	@BATCH_FILES = `ls $BATCH_DIR/*.$BATCH_EXT`; 
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
$stats_file = "$LOG_DIR\/".$EXT_OPTS{$BATCH_EXT}->{"stats"}."-$year-$mon";
open(STATS, ">> $stats_file") || die "Unable to open $stats_file for append.\n";

# Process the files
foreach $BATCH_FILE (@BATCH_FILES){
	# Set our output files
	$print_ext = $EXT_OPTS{$BATCH_EXT}->{"print"};
	@filetemp = split'/', $BATCH_FILE;
	$myfile = pop @filetemp;
	chomp $myfile;
	
	# My processing files.
	($basefile,$baseext) = split(/\./, $myfile);
	$print_output = "$BATCH_DIR\/$basefile.$print_ext";
	$error_log = "$LOG_DIR\/$basefile-$timestamp.$ERROR_EXT";
	$result_log = "$LOG_DIR\/$basefile-$timestamp.$RESULT_EXT";
	$drop_file  = "$BATCH_DIR\/$basefile-$timestamp-err.$BATCH_EXT";
        $working_file = "$BATCH_DIR\/$myfile";

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
	close(RESULTS);
	close(DROPFILE);
	
	# Unlink the drop file if we didn't have any failed mailings.
	if ( -z "$drop_file") {
		unlink "$drop_file";
	}
	
	# Move processed file to save directory.
	$save_dir = sprintf("%s/save-%04d-%02d-%02d",
			    $BATCH_DIR, $year, $mon, $mday);
	mkdir "$save_dir";
	eval{
	    rename ("$BATCH_DIR\/$myfile",
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
    &append_stats;
}

sub process_stream {
	my $parser = XML::LibXML->new();
	my $xslt = XML::LibXSLT->new();
	my $source = $parser->parse_string($xml_stream);
	my $root = $source->getDocumentElement;
	$transformation_file = $root->findvalue('form-name');
	my $plain_xslt = "$XSLT_DIR\/plain-$transformation_file.xsl";
        my $html_xslt = "$XSLT_DIR\/$transformation_file.xsl";
        if ($BATCH_EXT =~ m/_req/) {
            $to_address = $EXT_OPTS{$BATCH_EXT}->{"email"};
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

   if ($ADMIN_ADDRESS ne "NONE") {
   # Email File Stats to Administrators
       $email_body = "This message is to inform you that batch emails from Aleph have been sent.\n\n".
	   "If you are monitoring circulation emails, you should see this message every morning for courtesy, overdue, and lost notices.  Recall letters are sent 3 times each day, but sometimes there are no recalls.\n\n".
	   "If you are monitoring acquisitions emails, you should see this message Monday through Friday mornings only.\n\n".
	   "Contact Christine if you ever do not receive this message on schedule, as there could be a problem.\n\n".
	   "Processed file: $myfile\n".
	   "Sent $to_email_file email message(s)\n".
	   "Sent $to_print_file messages to printout file\n".
	   "Sent $to_drop_file messages to retry file\n";
       $my_message = MIME::Lite->new(
		From            => $ADMIN_ADDRESS,
                To              => $ADMIN_ADDRESS,
		Subject         => "$0 processing log.",
                Datestamp       => 'false',
                Date            => $maildate,
                Data            => $email_body
				  );
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
	if ($DEBUG_MODE == 1){
		&print_log;   # dump to print file
		$plain_body = "Email destined for: ". $to_address . "\n" . $plain_body;
		print DEBUG_LOG "Message destined for $to_address.\n";
		$to_address = $DEBUG_EMAIL;
	} 
	# Check for SMTP Relay setting.
	if (defined $SMTP_RELAY){
		MIME::Lite->send('smtp', $SMTP_RELAY, Timeout=>60);
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
		sleep 15;
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
	$to_drop_file++
}

