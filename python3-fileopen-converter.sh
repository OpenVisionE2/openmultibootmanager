#!/bin/sh

echo "Convert python 2 file to python 3 open by Persian Prince"
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

find -type f -name "*.py" | xargs -L1 sed -i 's|in file(|in open(|g'

echo ""
echo "Push the changes." 

dirs=($(find -maxdepth 1 -type d))
for dir in "${dirs[@]}"; do (
  cd "$dir"
  git add -u
  git add *
  git commit -S -m "Use python 3 open instead of file"
  git push
)
done

echo ""
echo "Done!"
