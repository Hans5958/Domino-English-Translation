Remove-Item -Path temp -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path dist -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path dist -Force | Out-Null
