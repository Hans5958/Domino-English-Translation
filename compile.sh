VERSION_NUM="$(cat version.txt)"
BUILD_DATE=$(date +'%Y%m%d%H%M%S')
rm -rf _compile
7z x -r Domino143.7z -oc:\_compile
cd _compile
echo "[FILENAMES]
Exe=    Domino.exe
SaveAs= Domino_Translated_$BUILD_DATE.exe
Log=    CON
[COMMANDS]
-delete  MENU,,
-delete  DIALOG,,
-delete  STRINGTABLE,,
-delete  VERSIONINFO,,
-add     Menu.res, MENU,,
-add     Dialog.res, DIALOG,,
-add     StringTable.res, STRINGTABLE,,
-add     VersionInfo.res, VERSIONINFO,,
" > tmp.txt
echo '"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Dialog.rc -save Dialog.res -action compile -log CON 
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Menu.rc -save Menu.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open StringTable.rc -save StringTable.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open VersionInfo.rc -save VersionInfo.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -script tmp.txt' > tmp.bat
cat ../Dialog/* > Dialog.rc
cat ../Menu/* > Menu.rc
cat ../StringTable/* > StringTable.rc
cat ../VersionInfo/* > VersionInfo.rc
sed -i '2s/.*/FILEVERSION 1,43,'$VERSION_NUM',0/' VersionInfo.rc
sed -i '3s/.*/PRODUCTVERSION 1,43,'$VERSION_NUM',0/' VersionInfo.rc
sed -i '12s/.*/		VALUE "FileVersion", "1.43-en.'$VERSION_NUM'-nightly.'$BUILD_DATE'"/' VersionInfo.rc
sed -i '17s/.*/		VALUE "ProductVersion", "1.43-en.'$VERSION_NUM'-nightly.'$BUILD_DATE'"/' VersionInfo.rc
cmd.exe /c tmp.bat
touch Domino_Translated_$BUILD_DATE.exe
rm -rf Manual
cp -r ../Manual .
cp -r ../Module .
cp -r ../System .
cp -r ../Other/* .
rm -rf *.rc
rm -rf *.res
rm -rf tmp.*
read -n1 -r -p "Press any key to continue..." key