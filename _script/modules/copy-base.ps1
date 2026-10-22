New-Item -ItemType Directory -Path temp -Force | Out-Null
Copy-Item -Recurse -Path ..\240 -Destination temp\240
Copy-Item -Recurse -Path ..\Dialog -Destination temp\Dialog
Copy-Item -Recurse -Path ..\Manual -Destination temp\Manual
Copy-Item -Recurse -Path ..\Menu -Destination temp\Menu
Copy-Item -Recurse -Path ..\Module -Destination temp\Module
Copy-Item -Recurse -Path ..\Other -Destination temp\Other
Copy-Item -Recurse -Path ..\StringTable -Destination temp\StringTable
Copy-Item -Recurse -Path ..\System -Destination temp\System
Copy-Item -Recurse -Path ..\VersionInfo -Destination temp\VersionInfo
Copy-Item -Path ..\_deploy\parsecombo.py -Destination temp
Copy-Item -Path ..\_deploy\readme-translation.txt -Destination temp
