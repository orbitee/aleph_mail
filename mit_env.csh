#############  The MIT License #############################################
# 
# Copyright (c) 2006-2008 Christine Moulen, and Massachusetts Institute of Technoloy
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

# A script to set up the proper ALEPH environment, based on the version
# specified by the calling script

# Created by Christine Moulen, 2006.  Originally during the upgrade
# from Aleph 16 to Aleph 18.

# Version is normally set, and this script sourced, by 
# /home/barton/mit_opts.csh
# but could also be set/sourced by an individual script if needed.

######

# Check that a version was set.  If not, refer the user to mit_opts

if (! ${?MIT_ALEPH_VERSION}) then
    echo "MIT_ALEPH_VERSION must be set.  See mit_opts.csh." ; exit 1
endif

# Walk through the known versions, set our base script location,
# source the ALEPH environment
# Exit if version is not known

   switch($MIT_ALEPH_VERSION)
   case 16:
     setenv MIT_SCRIPT_BASE /home/barton/upgrade
     source /exlibris/aleph/a16_1/alephm/.cshrc
     breaksw
   case 18:
     setenv MIT_SCRIPT_BASE /home/barton/v18
     source /exlibris/aleph/a18_2/alephm/.cshrc
     breaksw
   default:
     echo "Unknown version: $MIT_ALEPH_VERSION"
     exit 2
     breaksw
   endsw
