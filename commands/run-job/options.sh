# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Wed Nov 14 12:10:30 PST 2012
#
#/ usage: rundeck:run-job  --uuid|-u <> [ --rundeck-url|-r <http://localhost:4440>] [ --password|-p <admin>] [ --username|-u <admin>] [ --api-version|-a <5>] 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {
    
    while [ "$#" -gt 0 ]; do
        OPT="$1"
        case "$OPT" in
            --uuid|-u) rerun_option_check $# ; UUID=$2 ; shift ;;
            --rundeck-url|-r) rerun_option_check $# ; RUNDECK_URL=$2 ; shift ;;
            --password|-p) rerun_option_check $# ; PASSWORD=$2 ; shift ;;
            --username|-u) rerun_option_check $# ; USERNAME=$2 ; shift ;;
            --api-version|-a) rerun_option_check $# ; API_VERSION=$2 ; shift ;;
            # help option
            -?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.
    [ -z "$RUNDECK_URL" ] && RUNDECK_URL="http://localhost:4440"
    [ -z "$PASSWORD" ] && PASSWORD="admin"
    [ -z "$USERNAME" ] && USERNAME="admin"
    [ -z "$API_VERSION" ] && API_VERSION="5"
    # Check required options are set
    [ -z "$UUID" ] && { echo >&2 "missing required option: --uuid" ; return 2 ; }
    # If option variables are declared exportable, export them.
    export UUID
    export RUNDECK_URL
    export PASSWORD
    export USERNAME
    export API_VERSION
    #
    return 0
}


# Initialize the options variables to null.
UUID=
RUNDECK_URL=
PASSWORD=
USERNAME=
API_VERSION=


