$INSPATH = "$HOME\Dotconfig"

#######################################################################
#                            MAIN                                     #
#######################################################################

Copy-Item -Path "windows\src\*" -Destination "$INSPATH\" -Recurse

Copy-Item -Path "*" -Destination "$INSPATH" -Recurse

exit 0
