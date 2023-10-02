BUILD_DATE=$(date +'%Y%m%d%H%M%S')
VERSION_NUM="$(cat ../version.txt)"
echo "::set-output name=BUILD_DATE::$BUILD_DATE"
echo "::set-output name=BUILD_DATE_FULL::$(date +'%Y/%m/%d %H:%M:%S')"
echo "::set-output name=VERSION_NUM::$VERSION_NUM"
if [[ "$(python -V)" =~ "Python 3" ]]; then
	PYTHON_EXECUTABLE="python"
else
	PYTHON_EXECUTABLE="python3"
fi

echo "Cleaning folders..."
bash modules/clean.sh
mkdir dist

# ----------------------------------------
# 1.43

echo "Building 1.43 (release version)..."

echo "::group::Prepare for compilation"
# Preparation
echo "Preparing..."

echo "Removing temporary files..."
rm -rf temp/
echo "Copying translations and other required files..."
bash modules/copy-base.sh
echo "Extracting 1.43 original files..."
7z x ../_deploy/Domino143.7z -otemp/_compile

echo "Creating compile config file..."
cat >temp/compile-config.json <<EOL
{
	"resourceVersion": "1,43,$VERSION_NUM,0",
	"fullVersion": "1.43-en.$VERSION_NUM",
	"buildVersion": "$VERSION_NUM",
	"executableName": "Domino.exe",
	"compilePath": "temp/_compile",
	"supplyTranslationReadme": "true",
	"pythonExecutable": "$PYTHON_EXECUTABLE"
}
EOL
cat temp/compile-config.json

echo "Preparation done!"
# End of preparation
echo "::endgroup::"

echo "::group::Compilation"
# Compilation
echo "Compiling..."
bash compile-2.sh temp/compile-config.json
echo "Compilation done!"
# End of compilation
echo "::endgroup::"

echo "::group::Pack distributable"
# Packing
echo "Packing distributable..."
cd temp/_compile/
7z a ../../dist/Domino143_Translated.zip *
cd ../../
mv -v temp/_compile/Domino.exe dist/Domino143_Translated.exe
echo "Packing done!"
# End of packing
echo "::endgroup::"

echo "Building done!"

# ----------------------------------------
# 1.44

echo "Building 1.44 (release version)..."

echo "::group::Prepare for compilation"
# Preparation
echo "Preparing..."

echo "Removing temporary files..."
rm -rf temp/
echo "Copying 1.44-specific translations..."
bash modules/copy-1.44.sh
echo "Extracting 1.44 original files..."
7z x ../_deploy/Domino144.7z -otemp/_compile

echo "Creating compile config file..."
cat >temp/compile-config.json <<EOL
{
	"resourceVersion": "1,44,$VERSION_NUM,0",
	"fullVersion": "1.44-en.$VERSION_NUM",
	"buildVersion": "$VERSION_NUM",
	"executableName": "Domino.exe",
	"compilePath": "temp/_compile",
	"supplyTranslationReadme": "true",
	"pythonExecutable": "$PYTHON_EXECUTABLE"
}
EOL
cat temp/compile-config.json

echo "Preparation done!"
# End of preparation
echo "::endgroup::"

echo "::group::Compilation"
# Compilation
echo "Compiling..."
bash compile-2.sh temp/compile-config.json
echo "Compilation done!"
# End of compilation
echo "::endgroup::"

echo "::group::Pack distributable"
# Packing
echo "Packing distributable..."
cd temp/_compile/
7z a ../../dist/Domino144_Translated.zip *
cd ../../
mv -v temp/_compile/Domino.exe dist/Domino144_Translated.exe
echo "Packing done!"
# End of packing
echo "::endgroup::"

# ----------------------------------------
# 1.45 dev003 (32-bit)

echo "Building 1.45 dev003 (32-bit) (release version)..."

echo "::group::Prepare for compilation"
# Preparation
echo "Preparing..."

echo "Removing temporary files..."
rm -rf temp/
echo "Copying 1.43 translations and other required files..."
bash modules/copy-base.sh
echo "Copying 1.45-specific translations..."
bash modules/copy-1.45.sh
echo "Extracting 1.45 original files..."
7z x ../_deploy/Domino145_dev003_x86.7z -otemp/_compile

echo "Creating compile config file..."
if [[ "$(python -V)" =~ "Python 3" ]]; then
	PYTHON_EXECUTABLE="python"
else
	PYTHON_EXECUTABLE="python3"
fi
cat >temp/compile-config.json <<EOL
{
	"resourceVersion": "1,45,$VERSION_NUM,0",
	"fullVersion": "1.45 dev003-en.$VERSION_NUM",
	"buildVersion": "$VERSION_NUM",
	"executableName": "Domino.exe",
	"compilePath": "temp/_compile",
	"supplyTranslationReadme": "true",
	"pythonExecutable": "$PYTHON_EXECUTABLE"
}
EOL
cat temp/compile-config.json

echo "Preparation done!"
# End of preparation
echo "::endgroup::"

echo "::group::Compilation"
# Compilation
echo "Compiling..."
bash compile-2.sh temp/compile-config.json
echo "Compilation done!"
# End of compilation
echo "::endgroup::"

echo "::group::Pack distributable"
# Packing
echo "Packing distributable..."
cd temp/_compile/
7z a ../../dist/Domino145_dev003_x86_Translated.zip *
cd ../../
mv -v temp/_compile/Domino.exe dist/Domino145_dev003_x86_Translated.exe
echo "Packing done!"
# End of packing
echo "::endgroup::"

# ----------------------------------------
# 1.45 dev003 (64-bit)

echo "Building 1.45 dev003 (64-bit) (release version)..."

echo "::group::Prepare for compilation"
# Preparation
echo "Preparing..."

echo "Removing temporary files..."
rm -rf temp/
echo "Copying 1.43 translations and other required files..."
bash modules/copy-base.sh
echo "Copying 1.45-specific translations..."
bash modules/copy-1.45.sh
echo "Extracting 1.45 original files..."
7z x ../_deploy/Domino145_dev003_x86.7z -otemp/_compile
7z x ../_deploy/Domino145_dev003_x64.7z -otemp/_compile -y

echo "Creating compile config file..."
cat >temp/compile-config.json <<EOL
{
	"resourceVersion": "1,45,$VERSION_NUM,0",
	"fullVersion": "1.45 dev003-en.$VERSION_NUM",
	"buildVersion": "$VERSION_NUM",
	"executableName": "Domino.exe",
	"compilePath": "temp/_compile",
	"supplyTranslationReadme": "true",
	"pythonExecutable": "$PYTHON_EXECUTABLE"
}
EOL
cat temp/compile-config.json

echo "Preparation done!"
# End of preparation
echo "::endgroup::"

echo "::group::Compilation"
# Compilation
echo "Compiling..."
bash compile-2.sh temp/compile-config.json
echo "Compilation done!"
# End of compilation
echo "::endgroup::"

echo "::group::Pack distributable"
# Packing
echo "Packing distributable..."
cd temp/_compile/
7z a ../../dist/Domino145_dev003_x64_Translated.zip *
cd ../../
mv -v temp/_compile/Domino.exe dist/Domino145_dev003_x64_Translated.exe
echo "Packing done!"
# End of packing
echo "::endgroup::"
