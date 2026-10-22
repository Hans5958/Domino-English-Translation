Remove-Item -Path "Website/en/*" -Recurse -Force | Out-NulL
Copy-Item -Recurse -Path "Manual" -Destination "Website/en"
Remove-Item -Path "Website/en/index.htm" | Out-NulL
