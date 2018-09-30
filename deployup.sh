rm -rf output
git pull origin master
git clone -b gh-pages git@github.com:logithm/wiki.git output
git add . --all
git commit -am "$1"
git pull origin master
git push origin master

simiki g
cd output
git add . --all
git commit -am "$1"
git pull origin gh-pages
git push origin gh-pages
cd ..