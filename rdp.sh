#!/bin/bash

USERNAME=""
PASSWORD=""
DEFAULT_RESOLUTION="1900x1000"
HOST=""
CUSTOM_RESOLUTION=""

cols=$(tput cols)

banner=(
"  ______                                   __                      __        _______                   __       __  _______   _______   "
" /      \                                 |  \                    |  \      |       \                 |  \     /  \|       \ |       \  "
"|  ######\  ______    ______    ______   _| ##_     ______    ____| ##      | #######\ __    __       | ##\   /  ##| #######\| #######\ "
"| ##   \## /      \  /      \  |      \ |   ## \   /      \  /      ##      | ##__/ ##|  \  |  \      | ###\ /  ###| ##__/ ##| ##  | ## "
"| ##      |  ######\|  ######\  \######\ \######  |  ######\|  #######      | ##    ##| ##  | ##      | ####\  ####| ##    ##| ##  | ## "
"| ##   __ | ##   \##| ##    ## /      ##  | ## __ | ##    ##| ##  | ##      | #######\| ##  | ##      | ##\## ## ##| #######\| ##  | ## "
"| ##__/  \| ##      | ########|  #######  | ##|  \| ########| ##__| ##      | ##__/ ##| ##__/ ##      | ## \###| ##| ##__/ ##| ##__/ ## "
" \##    ##| ##       \##       \##    ##   \##  ## \##       \##    ##      | ##    ## \##    ##      | ##  \# | ##| ##    ##| ##    ## "
"  \######  \##        \#######  \#######    \####   \#######  \#######       \#######  _\#######       \##      \## \#######  \#######  "
"                                                                                      |  \__| ##                                        "
"                                                                                       \##    ##                                        "
"                                                                                        \######                                         "
)

separator=$(printf '=%.0s' $(seq 1 $cols))

print_banner() {
    echo "$separator"
    for line in "${banner[@]}"; do
        padding=$(( (cols - ${#line}) / 2 ))
        printf "%*s%s\n" "$padding" "" "$line"
    done
    echo "$separator"
}

show_help() {
    print_banner
    echo -e "This script is designed to simplify the usage of the rdesktop command with customizable parameters."
    echo -e "\nAvailable options:"
    echo -e "  -u    Username"
    echo -e "  -p    Password"
    echo -e "  -r    Window resolution (e.g., 1280x720)"
    echo -e "  -h    Show this help message\n"
    echo -e "Example:\n  rdp -u <username> -p <password> -r <resolution> <host>:<port>\n"
    exit 1
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -u)
            USERNAME="$2"
            shift 2
            ;;
        -p)
            PASSWORD="$2"
            shift 2
            ;;
        -r)
            CUSTOM_RESOLUTION="$2"
            shift 2
            ;;
        -h)
            show_help
            ;;
        -*)
            echo "Unknown option: $1"
            show_help
            ;;
        *)
            HOST="$1"
            shift
            ;;
    esac
done

if [[ -z "$HOST" ]]; then
    echo "Error: Host not specified."
    show_help
fi

if [[ -n "$CUSTOM_RESOLUTION" ]]; then
    DEFAULT_RESOLUTION="$CUSTOM_RESOLUTION"
fi

CMD="rdesktop -g \"$DEFAULT_RESOLUTION\" -P -z -x l"

[[ -n "$USERNAME" ]] && CMD+=" -u \"$USERNAME\""
[[ -n "$PASSWORD" ]] && CMD+=" -p \"$PASSWORD\""

CMD+=" \"$HOST\""

print_banner
eval "$CMD"
