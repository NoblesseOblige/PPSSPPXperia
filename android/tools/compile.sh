# Copyright (C) 2013 Lounge Katt

# This script is designed to compliment .bash_profile code to automate the build process by adding a typical shell command such as:
# function buildStar { cd /Users/TwistedZero/Dropbox/StarKissedMod; tools/./compile.sh $1; }
# This script is designed by Lounge Katt for use on MacOSX 10.7 but can be modified for other distributions of Mac and Linux

export HOSTSERVER=$DROPBOX_SERVER/TwistedServer/DevMarket/Applications
export APPREPOSI=$DROPBOX_SYSTEM/PPSSPPXperia/android
export RELEASED=bin/PPSSPP-release.apk
export FULLAPK=PPSSPPXperia.apk

rm -fR $(find . -type d -name crunch|xargs)

        ant clean release
        if [ -e $RELEASED ]; then
            tools/zipalign -v 4 $RELEASED $FULLAPK
        fi
        if [ -e $FULLAPK ]; then
            cp -R $FULLAPK $HOSTSERVER/$FULLAPK
            rm -R $RELEASED
            rm -R $FULLAPK
        fi