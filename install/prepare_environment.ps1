$chocolatey = invoke-webrequest "https://chocolatey.org/install.ps1"
invoke-expression $($chocolatey.content)
choco install -y python3

$pythonFolders = get-childitem -path $($env:systemdrive + "\") | ? {$_ -like "python3*"}
$pyFolder = ""

foreach ($pythonFolder in $pythonFolders){

	$path = $pythonFolder.fullname + "\python.exe"
	$path2 = $pythonFolder.fullname + "\scripts\pip.exe"

	if ((test-path $path) -and (test-path $path2)){
		write-output "Path exists"
		$pyFolder = $pythonFolder.fullname
		break
	}else{
		write-output "Path does not exist"
	}

}

$pyFolder

if (-not $pyFolder.length -lt 1){

	$envPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
	$envPath2 = $envPath -split ';'

	$pyFolderPath = "$($pyFolder)\"
	$pyFolderBool = $envPath2 -contains $pyFolderPath

	if (-not $pyFolderBool){

		Write-Output "Amending Python folder system variable"
		$envPath += ";" + $pyFolder + "\"

	}

	$pyScriptsPath = "$($pyFolder)\scripts\"
	$pyScriptsBool = $envPath2 -contains $pyScriptsPath

	if (-not $pyScriptsBool){

		Write-Output "Amending Python scripts folder system variable"
		$envPath += ";" + $pyFolder + "\scripts\"

	}

	$envPathSplit = $envPath -split ';'

	if ($envPathSplit.length -gt $envPath2.length){

		Write-Output "Adding missing variables"
		$amendedPath = $envPath -split ';' | ? {$_ -notlike "*\users\*"}
		$amendedPath2 = $amendedPath -join ';'

		[Environment]::SetEnvironmentVariable("Path", $amendedPath2, "Machine")

	}



}else{

	Write-Output "Error: Python folder not found"

}



