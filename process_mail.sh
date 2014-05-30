#!/bin/csh -f

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


# A script for sending ALEPH batch emails from the server, rather than
# the client-mailer, which is less reliable.

# History
# 060811 (orbitee) Updating for version 18

#################

# Setup environment and connect to mit50 
source /home/barton/mit_opts.csh
if ( $status != 0 ) then
    exit 1
endif

dlib mit50

# Are we in the test environment?
if ( $?MIT_TEST ) then
    set DEBUG = debug
else
    set DEBUG = ""
endif

# Insert a line for each print ID you want to handle

$MIT_SCRIPT_BASE/mail/process_mail.pl $DEBUG circ_email
$MIT_SCRIPT_BASE/mail/process_mail.pl $DEBUG circ_wait
$MIT_SCRIPT_BASE/mail/process_mail.pl $DEBUG mono_email

exit

