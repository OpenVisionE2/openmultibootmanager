#!/bin/sh

echo "Convert python 2 prints to python 3 prints by Persian Prince"
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

find -type f -name "*.py" | xargs -L1 sed -i '/^#!\/usr\/bin\/env/d' # Avoid "#!/usr/bin/env python" lines and remove them all.
find -type f -name "*.py" | xargs -L1 sed -i '/ coding:/d' # Avoid duplicate "# -*- coding: utf-8 -*-" lines and remove them all.
find -type f -name "*.py" | xargs -L1 sed -i '/print_function/d' # Avoid duplicate "from __future__ import print_function" lines and remove them all.
find -type f -name "*.py" | xargs -L1 sed -i '/^#!\/usr\/bin\/python/d' # Avoid duplicate "#!/usr/bin/python" lines and remove them all.
find -type f -name "*.py" | xargs -L1 sed -i '/print /s/$/)/' # Add ")" to the end of the print lines.
find -type f -name "*.py" | xargs -L1 sed -i 's|print |print(|g' # Change "print " to "print(".
find -type f -name "*.py" | xargs -L1 sed -i 's|print(\$|print $|g' # Revert changes when we have "print $" like in sed commands.
find -type f -name "*.py" | xargs -L1 sed -i '/print /s/.$//' # Remove ")" at the end of the print lines if they used sed commands like above.
find -type f -name "*.py" | xargs grep -l 'print(' | xargs -L1 sed -i '1ifrom __future__ import print_function' # Add "from __future__ import print_function" when we have "print(".
find -type f -name "*.py" | xargs -L1 sed -i '1i# -*- coding: utf-8 -*-' # Add "# -*- coding: utf-8 -*-" as the second line, always!
find -type f -name "*.py" | xargs -L1 sed -i '1i#!/usr/bin/python' # Add "#!/usr/bin/python" as the first line, always!

echo ""
echo "Push the changes." 

dirs=($(find -maxdepth 1 -type d))
for dir in "${dirs[@]}"; do (
  cd "$dir"
  git add -u
  git add *
  git commit -S -m "Use python 3 prints using Persian Prince's script"
  git push
)
done

echo ""
echo "Done!"
