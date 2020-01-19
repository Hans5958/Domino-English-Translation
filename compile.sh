cd _compile
echo "[FILENAMES]
Exe=    Domino.exe
SaveAs= Domino_Translated_"$(date +'%Y%m%d%H%M%S')".exe
Log=    CON
[COMMANDS]
-delete  MENU,,
-delete  DIALOG,,
-delete  STRINGTABLE,,
-add     Menu.res, MENU,,
-add     Dialog.res, DIALOG,,
-add     StringTable.res, STRINGTABLE,,
" > tmp.txt
echo '"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Dialog.rc -save Dialog.res -action compile -log CON 
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open Menu.rc -save Menu.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -open StringTable.rc -save StringTable.res -action compile -log CON
"C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe" -script tmp.txt' > tmp.bat
cat ../Dialog/* > Dialog.rc
cat ../Menu/* > Menu.rc
cat ../StringTable/* > StringTable.rc
cmd.exe /c tmp.bat
touch Domino.exe
# read -n1 -r -p "Press any key to continue..." key
rm -rf *.rc
rm -rf *.res
rm -rf tmp.*
