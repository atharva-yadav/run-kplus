# script execution policy
Set-ExecutionPolicy RemoteSigned -Force

Write-Host "KEP+ Setup Starting..."

Write-Host "Running atlasCleanHelm.bat"
& .\atlasCleanHelm.bat

Write-Host "Running atlasStartHelm.bat"
& .\atlasStartHelm.bat

Write-Host "Changing Directory to Authorized/local-deployment"
Set-Location ..\..\Authorized\local-deployment\

Write-Host "Running build.ps1 with arguments"
& .\build.ps1 Seed --HubName unified-edge.azure-devices.net --HubConnectionString "HostName=unified-edge.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=gPZeFWB1wZBkNPTgbuYdurNkLeWKbtfeyW018="

Write-Host "Changing Directory to ptc-solution-ui/qa-setup"
Set-Location ..\..\ptc-solution-ui\qa-setup\

Write-Host "Running startAtlasMock.bat"
& .\startAtlasMock.bat

Write-Host "Running startEs.bat"
& .\startEs.bat

Write-Host "Setup Running"
