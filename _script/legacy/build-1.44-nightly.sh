echo "Building 1.44 (nightly version)..."

echo "::group::Prepare for compilation"
echo "Preparing..."

echo "Removing temporary files..."
rm -rf temp
echo "Copying 1.43 translations and other required files..."
bash modules/copy-base.sh
echo "Copying 1.44-specific translations..."
bash modules/copy-1.44.sh
echo "Extracting 1.44 original files..."
7z x ../_deploy/Domino144.7z -otemp/_compile

echo "Creating compile config file..."
BUILD_DATE="$(date +%Y%m%d)"
VERSION_NUM="$(cat ../version.txt)"
echo "::set-output name=BUILD_DATE::$BUILD_DATE"
echo "::set-output name=BUILD_DATE_TIDY::$(date +'%Y/%m/%d')"
echo "::set-output name=BUILD_DATE_FULL::$(date +'%Y/%m/%d %H:%M:%S')"
echo "::set-output name=VERSION_NUM::$VERSION_NUM"
if [[ "$(python -V)" =~ "Python 3" ]]; then
	PYTHON_EXECUTABLE="python"
else
	PYTHON_EXECUTABLE="python3"
fi
cat >temp/compile-config.json <<EOL
{
	"resourceVersion": "1,44,$VERSION_NUM,0",
	"fullVersion": "1.44-en.$VERSION_NUM-nightly.$BUILD_DATE",
	"buildVersion": "$VERSION_NUM-nightly.$BUILD_DATE",
	"executableName": "Domino.exe",
	"compilePath": "temp/_compile",
	"supplyTranslationReadme": "true",
	"pythonExecutable": "$PYTHON_EXECUTABLE"
}
EOL
cat temp/compile-config.json

echo "Preparation done!"
echo "::endgroup::"

echo "::group::Compilation"
echo "Compiling..."
bash compile-2.sh temp/compile-config.json
echo "Compile done!"
echo "::endgroup::"

echo "::group::Pack distributable"
echo "Packing distributable..."
mkdir dist
cd temp/_compile/
7z a ../../dist/Domino144_Translated.zip *
cd ../../
mv -v temp/_compile/Domino.exe dist/Domino144_Translated.exe
echo "Packing done!"
echo "::endgroup::"

echo "Building done!"