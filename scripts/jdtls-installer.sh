#!/bin/sh
set -e

## Detect if tools are installed
for cmd in git pup tar; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: Required command '$cmd' is missing." >&2
        exit 1
    fi
done

## Define env variables
INSTALL_FOLDER=${JDTLS_HOME:-$HOME/.jdtls}
TMP_FOLDER=${TMP_FOLDER:-/tmp}

mkdir -p $INSTALL_FOLDER

echo "Installation will be performed on $INSTALL_FOLDER ✓"
echo "Tmp folder has been defined on $TMP_FOLDER ✓"

printf "\n"

### fetch JDTLS repository to get latest tag
JDTLS_SOURCE_CODE_FOLDER=$TMP_FOLDER/jdtls-source-code

mkdir -p $JDTLS_SOURCE_CODE_FOLDER

if [ -d "$JDTLS_SOURCE_CODE_FOLDER" ];then
    echo "Source code already, fetching from 'main'"
    (cd $JDTLS_SOURCE_CODE_FOLDER && git fetch --all && git pull origin main > /dev/null 2>&1)
else
    echo "Source code not detected, cloning 'main' branch"
    git clone https://github.com/eclipse-jdtls/eclipse.jdt.ls.git $JDTLS_SOURCE_CODE_FOLDER > /dev/null 2>&1
fi

LATEST_TAG=$(cd $JDTLS_SOURCE_CODE_FOLDER && git describe --tags --abbrev=0)
echo "Latest relase detected: $LATEST_TAG"


VERSION_FILE="$INSTALL_FOLDER/version.txt"
CURRENT_VERSION='unknown'

if [ -f "$VERSION_FILE" ];then
    CURRENT_VERSION=$(cat $VERSION_FILE)
fi

case "$CURRENT_VERSION" in
    *"$LATEST_TAG"*)
        echo "Current version is up to date ✓"
        exit 0
        ;;
    *)

        if [ "$CURRENT_VERSION" != "unknown" ]; then
            printf "Current version is $CURRENT_VERSION. Do you wish to update (y/n): "
            read -r INPUT

            if [ "$INPUT" != "y" ]; then
                exit 0
            fi
        fi

        ## scrub the file version
        SANITIZED_TAG=$(echo $LATEST_TAG | awk '{sub(/^v/, ""); print}')
        PAGE="https://download.eclipse.org/jdtls/milestones/$SANITIZED_TAG/"
        FILE_NAME=$(curl $PAGE 2>/dev/null | pup 'div#dirlist > table > tbody   tr:nth-child(3) > td:nth-child(2) > a > text{}')
        URL="https://download.eclipse.org/jdtls/milestones/$SANITIZED_TAG/$FILE_NAME"

        curl --output-dir $TMP_FOLDER -O $URL

        echo "File downloaded ✓"

        tar -x -f $TMP_FOLDER/$FILE_NAME -C $INSTALL_FOLDER
        echo $LATEST_TAG > $VERSION_FILE

        echo "Add the statement 'export PATH=\"\$PATH:$INSTALL_FOLDER/bin\"' into your .bashrc, .zshrc, .bash_profile  or .zprofile"
        ;;
esac
