for i in `find . -mindepth 1 -maxdepth 1 -type d -not -path "./.history*"`
    do
        cd $i
        git add .
        git commit -m "Adding travis file & badge"
        git push
        cd ..
    done