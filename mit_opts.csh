### #!/bin/csh

# This code should be included in or sourced from all of our shell
# scripts, in order to import the proper ALEPH environment.

# If you need some custom opts beyond version, test and silent, copy this code
# directly into your script and add to it.

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

