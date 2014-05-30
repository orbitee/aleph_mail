#############  The MIT License #############################################
# 
# Copyright (c) 2006-2008 Christine Moulen, and Massachusetts Institute of Technology
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

### #!/bin/csh

# Created by Christine Moulen, 2006.  Originally during the upgrade
# from Aleph 16 to Aleph 18.

# This code should be included in or sourced from all of our shell
# scripts, in order to import the proper ALEPH environment.

# If you need some custom opts beyond version, test, and silent, copy this 
# code directly into your script and add to it.

# -v arg sets the aleph version
# -t     sets a test environment (for running scripts on the test server)
# -s     sets a silent environemt (for running interactive scripts from cron)

set argv=(`getopt stv: $*`)
unsetenv MIT_ALEPH_VERSION
unsetenv MIT_TEST
unsetenv MIT_SILENT

if ($#argv == 0) then
echo "Usage: script -v version [-t] [-s] -- args" ; exit 1
endif

while ($#argv)
   switch($argv[1])
   case -s:
     echo "Option s set.  Environment will be set for non-interactive."
     setenv MIT_SILENT
     breaksw
   case -t:
     echo "Option t set.  Environment will be set for testing."
     setenv MIT_TEST
     breaksw
   case -v:
     shift
     echo "Option v set.  Environment will be set for version $argv[1]."
     setenv MIT_ALEPH_VERSION $argv[1]
     breaksw
   case --:
     shift
     break
     breaksw
   endsw
   shift
end

if (! ${?MIT_ALEPH_VERSION}) then
echo "Usage: script -v version [-t] [-s] -- args" ; exit 1
endif

echo "Remaining args: $argv"

source /home/barton/mit_env.csh

