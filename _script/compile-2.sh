echo "Compile process started."

export CONFIG="$(cat $1)"
jq_config() {
    echo $(echo $CONFIG | jq -r $1)
}
export RESOURCE_VERSION=$(jq_config '.resourceVersion')
export FULL_VERSION=$(jq_config '.fullVersion')
export BUILD_VERSION=$(jq_config '.buildVersion')
export EXECUTABLE_NAME=$(jq_config '.executableName')
export COMPILE_PATH=$(jq_config '.compilePath')
export SUPPLY_TRANSLATION_README=$(jq_config '.supplyTranslationReadme')
export PYTHON_EXECUTABLE=$(jq_config '.pythonExecutable')

cd $COMPILE_PATH

echo "Preparing resource files..."

cat ../Dialog/* > Dialog.rc
cat ../Menu/* > Menu.rc
cat ../StringTable/* > StringTable.rc
cat ../VersionInfo/* > VersionInfo.rc
mkdir 240
cp ../240/_240.rc 240
for file in ../240/*.bin.txt; do
	f="$(basename -s .txt $file)"
	$PYTHON_EXECUTABLE "../parsecombo.py" pack $file 240/$f
done
sed -i '2s/.*/FILEVERSION '$RESOURCE_VERSION'/' VersionInfo.rc
sed -i '3s/.*/PRODUCTVERSION '$RESOURCE_VERSION'/' VersionInfo.rc
sed -i "12s/.*/		VALUE \"FileVersion\", \"$FULL_VERSION\"/" VersionInfo.rc
sed -i "17s/.*/		VALUE \"ProductVersion\", \"$FULL_VERSION\"/" VersionInfo.rc

echo "Compiling using Resource Hacker..."

echo "[FILENAMES]
Exe=    Domino.exe
SaveAs= $EXECUTABLE_NAME
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
echo '"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Dialog.rc -save Dialog.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Menu.rc -save Menu.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open StringTable.rc -save StringTable.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open VersionInfo.rc -save VersionInfo.res -action compile -log CON
cd 240
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open _240.rc -save ../240.res -action compile -log CON
cd..
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -script tmp.txt' > tmp.bat
cmd.exe /c tmp.bat
touch $EXECUTABLE_NAME

echo "Compilation done!"

echo "Copying other translated files..."
[ -d "Manual" ] && rm -rf Manual && cp -r ../Manual .
[ -d "Module" ] && cp -r ../Module .
[ -d "System" ] && cp -r ../System .
cp -r ../Other/* .

echo "Removing temporary files..."
rm -rf *.rc
rm -rf *.res
rm -rf tmp.*
rm -rf 240

if [[ $SUPPLY_TRANSLATION_README == "true" ]]; then
	echo "Creating translation readme..."
	cp -r ../readme-translation.txt ./
	sed -i "2s/.*/Build $BUILD_VERSION ($FULL_VERSION)/" readme-translation.txt
fi

echo "Compile process completed."