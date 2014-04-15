#!/usr/bin/env bash

## The Script will compile the required c++/qt plugin.

# Directory to hold compiled plugin
PLUGIN_DIRECTORY='./plugin'
OBJECT_CODE_DIRECTORY='src/plugins/tmp'

## Function to run qmake-qt4
run_qmake_qt4() {
    qmake-qt4
    make
}

## Exit in case no qmake utility found on system
quit() {
    echo "qmake-qt4 doesn't exist. You don't have any qmake utility. Kindly install Qt on your device. Aborting..."
    exit
}

## Check whether the directory "plugin" ( which will have the compiled plugin library ) exists.
## If not then create it
if [ -d $PLUGIN_DIRECTORY ]; then
    echo "Directory $PLUGIN_DIRECTORY already exists. So no need to create one. Proceeding..."
else
    mkdir $PLUGIN_DIRECTORY
    echo "created plugin directory"
fi

## Directory "plugin/tmp" to hold Qt meta-object code
if [ -d $OBJECT_CODE_DIRECTORY ]; then
    echo "Directory $OBJECT_CODE_DIRECTORY already exists. So, no need to create one. Proceeding...\n"
else
    mkdir $OBJECT_CODE_DIRECTORY
    echo -e "Created $OBJECT_CODE_DIRECTORY to obect code\n"
fi

## Change directory to source to compile the plugins and running qmake
cd src

## Check whether qmake utility exists or not. If it does run qmake otherwise throw an error message
command -v qmake-qt4 >/dev/null && run_qmake_qt4 || quit

echo -e "\n\nNow you can run the text editor by loading it in qmlviewer: qmlviewer Editor.qml\nEnjoy :)"

