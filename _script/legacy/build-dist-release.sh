VERSION_NUM="$(cat version.txt)"
BUILD_DATE=$(date +'%Y%m%d%H%M%S')
rm -rf _compile
mkdir _compile
cp -r _deploy/Domino143/* _compile
cd _compile
echo "[FILENAMES]
Exe=    Domino.exe
SaveAs= Domino.exe
Log=    CON
[COMMANDS]
-delete  MENU,,
-delete  DIALOG,,
-delete  STRINGTABLE,,
-delete  VERSIONINFO,,
-delete  240,,
-add     Menu.res, MENU,,
-add     Dialog.res, DIALOG,,
-add     StringTable.res, STRINGTABLE,,
-add     VersionInfo.res, VERSIONINFO,,
-add     240.res, 240,,
" > tmp.txt
cat ../Dialog/* > Dialog.rc
cat ../Menu/* > Menu.rc
cat ../StringTable/* > StringTable.rc
cat ../VersionInfo/* > VersionInfo.rc
mkdir 240
cp ../240/_240.rc 240
for file in ../240/*.bin.txt; do
	f="$(basename -s .txt $file)"
	python3 "../_deploy/parsecombo.py" pack $file 240/$f
done
sed -i '2s/.*/FILEVERSION 1,43,'$VERSION_NUM',0/' VersionInfo.rc
sed -i '3s/.*/PRODUCTVERSION 1,43,'$VERSION_NUM',0/' VersionInfo.rc
sed -i '12s/.*/		VALUE "FileVersion", "1.43-en.'$VERSION_NUM'"/' VersionInfo.rc
sed -i '17s/.*/		VALUE "ProductVersion", "1.43-en.'$VERSION_NUM'"/' VersionInfo.rc
echo '"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Dialog.rc -save Dialog.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Menu.rc -save Menu.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open StringTable.rc -save StringTable.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open VersionInfo.rc -save VersionInfo.res -action compile -log CON
cd 240
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open _240.rc -save ../240.res -action compile -log CON
cd..
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -script tmp.txt' > tmp.bat
cmd.exe /c tmp.bat
touch Domino.exe
rm -rf Manual
cp -r ../Manual .
cp -r ../Module .
cp -r ../System .
cp -r ../Other/* .
rm -rf *.rc
rm -rf *.res
rm -rf tmp.*
rm -rf 240
cp ../_deploy/readme-translation.txt readme-translation.txt
sed -i '2s/.*/Build '$VERSION_NUM' (1.43-en.'$VERSION_NUM')/' readme-translation.txt
7z a Domino143_Translated.zip *
cp -v Domino.exe Domino_Translated.exe