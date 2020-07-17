#!/bin/sh

echo "Convert python 2 exception to python 3 exception by Persian Prince"
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

find -type f -name "*.py" | xargs -L1 sed -i 's|except Exception,|except Exception as|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|except RuntimeError,|except RuntimeError as|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|except IOError,|except IOError as|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|raise Exception, "|raise Exception("|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|except StandardError:|except Exception:|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|assertEquals|assertEqual|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|except ImportError:|except ImportError as e:|g'
find -type f -name "*.py" | xargs -L1 sed -i 's|print(e)|print(str(e))|g'

echo ""
echo "Push the changes." 

dirs=($(find -maxdepth 1 -type d))
for dir in "${dirs[@]}"; do (
  cd "$dir"
  git add -u
  git add *
  git commit -S -m "Use python 3 exception handling"
  git push
)
done

echo ""
echo "Done!"
