echo "Building 1.43 (development version)..."

echo "Preparing..."

echo "Removing temporary files..."
bash modules/clean.sh
echo "Copying translations and other required files..."
bash modules/copy-base.sh

echo "Creating compile config file..."
VERSION_NUM="$(cat ../version.txt)"
BUILD_DATE=$(date +'%Y%m%d%H%M%S')
if [[ "$(python -V)" =~ "Python 3" ]]; then
	PYTHON_EXECUTABLE="python"
else
	PYTHON_EXECUTABLE="python3"
fi
cat >temp/compile-config.json <<EOL
{
	"resourceVersion": "1,43,$VERSION_NUM,0",
	"fullVersion": "1.43-en.$VERSION_NUM-dev.$BUILD_DATE",
	"buildVersion": "$VERSION_NUM-dev.$BUILD_DATE",
	"executableName": "Domino_Translated_$BUILD_DATE.exe",
	"compilePath": "temp/_compile",
	"supplyTranslationReadme": "true",
	"pythonExecutable": "$PYTHON_EXECUTABLE"
}
EOL
cat temp/compile-config.json

echo "Preparation done!"

echo "Compiling..."
bash compile-2.sh temp/compile-config.json
echo "Compile done!"

echo "Copying compilation results..."
cp -r temp/_compile dist

echo "Building done!"