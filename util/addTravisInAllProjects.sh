#!/bin/bash

function addTravisFile() {
    shopt -s nullglob
    echo "Processing $1"

    # if [ -s ./$1/.travis.yml ]; then
    #     echo "   Travis file already created. Bypassing."
    #     return
    # fi

    find . -name "*.wtest" -type f | grep -E '.*'
    if [ $? -eq 0 ]; then
        echo "   Creating Travis file for tests"
        cp ./travisTests.yml ./$1/.travis.yml
    else
        echo "   Creating Travis file for programs"
        cp ./travisPrograms.yml ./$1/.travis.yml
    fi
}

function addBadgeInReadme() {
    README_file="./$1/README.md"
    TRAVIS_BADGE="[![Build_Status](https://travis-ci.org/wollok/$1.svg?branch=master)](https://travis-ci.org/wollok/$1)"

    if [ -s $README_file ]; then
        grep travis-ci $README_file -q
        if [ $? -eq 0 ]; then
            echo "   Badge existing."
            return
        fi
        echo "   Badge non-existing. Adding Travis badge."
        TRAVIS_BADGE_WITH_NEWLINE="\n$TRAVIS_BADGE\n"
        sed -i "1 a \ $TRAVIS_BADGE_WITH_NEWLINE" $README_file
        sed -i 's/Build_Status/Build Status/g' $README_file
        return
    fi

    echo "   Creating README.md"
    echo "# $1" > $README_file
    echo "" >> $README_file
    echo "$TRAVIS_BADGE" >> $README_file
}

for i in `find . -mindepth 1 -maxdepth 1 -type d -not -path "./.history*" | sed "s/\.\///g"`
    do
        addTravisFile $i
        # addBadgeInReadme $i
    done
