$name = (Get-Item .).Name
Compress-Archive -Path * -DestinationPath "$env:APPDATA\Factorio\mods\$name.zip" -Force