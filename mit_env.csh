### #!/bin/csh

# A script to set up the proper ALEPH environment, based on the version
# specified by the calling script

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
   case 19:
     setenv MIT_SCRIPT_BASE /home/barton/v19
     source /exlibris/aleph/a19_1/alephm/.cshrc
     breaksw
   case 20:
     setenv MIT_SCRIPT_BASE /home/barton/v20
     source /exlibris/aleph/a20_1/alephm/.cshrc
     breaksw
   case 22:
     setenv MIT_SCRIPT_BASE /home/barton/v22
     source /exlibris/aleph/a22_1/alephm/.cshrc
     breaksw
   default:
     echo "Unknown version: $MIT_ALEPH_VERSION"
     exit 2
     breaksw
   endsw
