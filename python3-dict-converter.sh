#!/bin/sh

echo "Convert python 2 dict to python 3 dict by Persian Prince"
echo ""

echo "First git pull to avoid merge conflicts."
echo ""

dirs=($(find -maxdepth 1 -type d))
for dir in "${dirs[@]}"; do (
  cd "$dir"
  git pull
)
done

echo ""
echo "Changing py files, please wait ..." 

find -type f -name "*.py" | xargs -L1 sed -i 's|in request.args.keys()|in list(request.args.keys())|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|in mounts.keys()|in list(mounts.keys())|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|in map.keys()|in list(map.keys())|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|in top.items()|in list(top.items())|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|in rargs.keys()|in list(rargs.keys())|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|in session.keys()|in list(session.keys())|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|in oldsession.keys()|in list(oldsession.keys())|g'

echo ""
echo "Push the changes." 

dirs=($(find -maxdepth 1 -type d))
for dir in "${dirs[@]}"; do (
  cd "$dir"
  git add -u
  git add *
  git commit -S -m "Use python 3 dict"
  git push
)
done

echo ""
echo "Done!"
