# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Tue Nov 13 16:35:12 PST 2012
#
#/ usage: rundeck:create-project  --create-project|-c <>  --name|-n <> 

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
            --name|-n) rerun_option_check $# ; NAME=$2 ; shift ;;
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

    # Check required options are set
    [ -z "$NAME" ] && { echo >&2 "missing required option: --name" ; return 2 ; }
    # If option variables are declared exportable, export them.
    export NAME
    #
    return 0
}


# Initialize the options variables to null.
NAME=


