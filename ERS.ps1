# Edge Removal Script (ERS), version 0.1

if((Test-Path "$env:PROGRAMDATA\Microsoft\Windows\Start Menu\Programs\Startup\ERS.bat") -eq $false) {
	Write-Output 'pwsh -windowstyle hidden "C:\Program Files (x86)\Microsoft\ERS.ps1"'>>"$env:PROGRAMDATA\Microsoft\Windows\Start Menu\Programs\Startup\ERS.bat"
	Start-Process "$env:PROGRAMDATA\Microsoft\Windows\Start Menu\Programs\Startup\ERS.bat"
	$date = Get-Date -format "MM/dd/yyyy, AT HH:mm:ss"
	Write-Output "Installed on:$date">>"$env:USERPROFILE\ms_edge.log"
}
if((Test-Path "${env:ProgramFiles(x86)}\Microsoft\ERS.ps1") -eq $false) {
	Copy-Item ".\ERS.ps1" "${env:ProgramFiles(x86)}\Microsoft\"
}

function msucks {
	if((Test-Path "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe") -eq $true) {
		$adware_version = (Get-Item "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe").VersionInfo.FileVersion
		Start-Process "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\$adware_version\Installer\setup.exe" '--uninstall --system-level --verbose-logging --force-uninstall'
		$date = Get-Date -format "MM/dd/yyyy, AT HH:mm:ss"
		Write-Output "Microsoft Edge uninstalled on:$date">>"$env:USERPROFILE\ms_edge.log"
		Start-Sleep -Seconds 300
	} else {
		Start-Sleep -Seconds 18000
	}; msucks
}; msucks