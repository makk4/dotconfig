$INSPATH = "$HOME\dotconfig"

#######################################################################
#                            MAIN                                     #
#######################################################################

Copy-Item -Path "*" -Destination "$INSPATH" -Recurse

exit 0
