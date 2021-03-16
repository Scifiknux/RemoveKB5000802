set-executionpolicy remotesigned -force
$SearchUpdates = dism /online /get-packages | findstr "Package_for"
$updateName = $SearchUpdates.replace("Package Identity : ", "")
$updates =  $updateName | findstr "19041.867"
DISM.exe /Online /Remove-Package /PackageName:$updates /quiet /norestart
# Love, CJ Pollock
