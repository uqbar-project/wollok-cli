for i in `find . -mindepth 1 -maxdepth 1 -type d -not -path "./.history*"`
    do
        cd $i
        echo "Updating $i"
        # git pull
        rm .travis.yml
        cd ..
    done