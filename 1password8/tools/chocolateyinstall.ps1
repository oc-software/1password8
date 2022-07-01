
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$url        = 'https://downloads.1password.com/win/1PasswordSetup-latest.exe'
$url64      = 'https://downloads.1password.com/win/1PasswordSetup-latest.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
#  url           = $url
  url64bit      = $url64

  softwareName  = '1Password 8'

#  checksum      = '74AB3B856FDE8B7A5C4A7602CA6C21993FE113DE40E5F92487D68B688D0DECD6'
#  checksumType  = 'sha256'
  checksum64    = '74AB3B856FDE8B7A5C4A7602CA6C21993FE113DE40E5F92487D68B688D0DECD6'
  checksumType64= 'sha256'
  silentArgs = '--silent'
}

Install-ChocolateyPackage @packageArgs