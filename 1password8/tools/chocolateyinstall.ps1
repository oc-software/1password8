
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://downloads.1password.com/win/1PasswordSetup-latest.exe'
$getUser = (((Get-WMIObject -ClassName Win32_ComputerSystem).Username).Split('\')[1])
$env:LocalAppData = "C:\Users\$getUser.OC\AppData\Local"
$env:UserProfile = "C:\Users\$getUser.OC"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64bit      = $url64
  appPath       = "$env:ProgramFiles\1Password"
  softwareName  = '1Password 8'
  checksum64    = '74AB3B856FDE8B7A5C4A7602CA6C21993FE113DE40E5F92487D68B688D0DECD6'
  checksumType64= 'sha256'
  silentArgs = '--silent'
}

if (!{Test-Path "$env:ProgramFiles\1Password"}) {
  New-Item -ItemType Directory -Path "$env:ProgramFiles\1Password"
}
Install-ChocolateyPackage @packageArgs