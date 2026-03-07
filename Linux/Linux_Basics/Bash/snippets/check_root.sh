#!/bin/sh

# Above you see the shebang '#!' followed by /bin/sh. This Is The Shell The Script Will Be Interpreted By.
# Other Options If You Know Bash Will Be Available Would Be '#!/bin/bash' or '#!/usr/bin/env bash'.
# Shell Scripting Can Have Some "Gotchas". This Is What A POSIX Script May Use To Check If Running As Root.

# This Checks If The Current User ID Is NOT EQUAL to 0 (Root). Exit Code 0 Is A Success, Anything Else Is Failure.
# Commented Out 'if' Can Be Used With '#!/bin/bash' Or '#!/usr/bin/env bash'
 
#if [[ $EUID -ne 0 ]]; then
if [ "$(id -u)" -ne 0 ]; then
    echo "You Must Run As Root."
    exit 1
else
    echo "You Are Root."
    exit 0
fi