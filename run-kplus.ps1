# script execution policy
Set-ExecutionPolicy RemoteSigned -Force

Write-Host "Please select an option:"
Write-Host "  [1] Run only startAtlasMock and startEs" -ForegroundColor Cyan
Write-Host "  [2] Run all batch files" -ForegroundColor Cyan

$choice = Read-Host "Enter your choice (1 or 2): "

if($choice -eq "2") 
{
    Write-Host "Running all files" -BackgroundColor Blue -ForegroundColor White
    Write-Host "KEP+ Setup Starting..." -BackgroundColor Blue -ForegroundColor White

    Write-Host "Running atlasCleanHelm.bat" -BackgroundColor Blue -ForegroundColor White
    & .\atlasCleanHelm.bat

    Write-Host "Running atlasStartHelm.bat" -BackgroundColor Blue -ForegroundColor White
    & .\atlasStartHelm.bat

    Write-Host "Changing Directory to Authorized/local-deployment" -BackgroundColor Blue -ForegroundColor White
    Set-Location ..\..\Authorized\local-deployment\

    Write-Host "Running build.ps1 with arguments" -BackgroundColor Blue -ForegroundColor White
    & .\build.ps1 Seed --HubName unified-edge.azure-devices.net --HubConnectionString "HostName=unified-edge.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=gPZeFWB1wZBkNPTgbuYdurNkLeWKbtfeyW018="

    Write-Host "Changing Directory to ptc-solution-ui/qa-setup" -BackgroundColor Blue -ForegroundColor White
    Set-Location ..\..\ptc-solution-ui\qa-setup\

    Write-Host "Running startAtlasMock.bat" -BackgroundColor Blue -ForegroundColor White
    & .\startAtlasMock.bat

    Write-Host "Running startEs.bat" -BackgroundColor Blue -ForegroundColor White
    & .\startEs.bat

    Write-Host "Setup Running" -BackgroundColor Blue -ForegroundColor Green
} 
elseif($choice -eq "1")
{
    Write-Host "Running startAtlasMock and startEs only" -BackgroundColor Blue -ForegroundColor White
    Write-Host "Running startAtlasMock.bat" -BackgroundColor Blue -ForegroundColor White
    & .\startAtlasMock.bat

    Write-Host "Running startEs.bat" -BackgroundColor Blue -ForegroundColor White
    & .\startEs.bat

    Write-Host "Setup Running" -BackgroundColor Blue -ForegroundColor Green
} 
else 
{
    Write-Host "Invalid choice. Exiting.. " -BackgroundColor Yellow -ForegroundColor Red
}


# -----------------------------------------------------

Write-Host "Please select an option:"
Write-Host "  [1] Run only startAtlasMock and startEs" -ForegroundColor Cyan
Write-Host "  [2] Run all batch files" -ForegroundColor Cyan
 
$choice = Read-Host "Enter your choice (1 or 2): "
 
if($choice -eq "2")
{
  $errorEncountered = $false  # Flag to track encountered errors
  Write-Host "Running all files" -BackgroundColor Blue -ForegroundColor White
  Write-Host "KEP+ Setup Starting..." -BackgroundColor Blue -ForegroundColor White
 
  # Run atlasCleanHelm.bat
  Write-Host "Running atlasCleanHelm.bat" -BackgroundColor Blue -ForegroundColor White
  $atlasCleanOutput = & .\atlasCleanHelm.bat
 
  Write-Host -----------------------------------------------------
  Write-Host $atlasCleanOutput
  Write-Host $errorEncountered
  Write-Host -----------------------------------------------------
 
  if ($atlasCleanOutput -match "^ERROR.*" -or $? -ne 0) {
    Write-Error "Error encountereddddddddddd in atlasCleanHelm.bat: $atlasCleanOutput"
    $errorEncountered = $true
    break
  }
  Write-Host $errorEncountered
 
  # Run atlasStartHelm.bat
  Write-Host "Running atlasStartHelm.bat" -BackgroundColor Blue -ForegroundColor White
  $atlasStartOutput = & .\atlasStartHelm.bat
  if ($atlasStartOutput -match "^ERROR.*" -or $? -ne 0) {
    Write-Error "Error encountered in atlasStartHelm.bat: $atlasStartOutput"
    $errorEncountered = $true
    break
  }
 
 
  Write-Host "Changing Directory to Authorized/local-deployment" -BackgroundColor Blue -ForegroundColor White
  Set-Location ..\..\Authorized\local-deployment\
 
  Write-Host "Running build.ps1 with arguments" -BackgroundColor Blue -ForegroundColor White
  & .\build.ps1 Seed --HubName unified-edge.azure-devices.net --HubConnectionString "HostName=unified-edge.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=gPZeFWB1wZBkNPTgbuYdurNkLeWKbtfeyW018="
 
  Write-Host "Changing Directory to ptc-solution-ui/qa-setup" -BackgroundColor Blue -ForegroundColor White
  Set-Location ..\..\ptc-solution-ui\qa-setup\
 
  Write-Host "Running startAtlasMock.bat" -BackgroundColor Blue -ForegroundColor White
  $startAtlasMockOutput = & .\startAtlasMock.bat
  if ($startAtlasMockOutput -match "^ERROR.*" -or $? -ne 0) {
    Write-Error "Error encountered in startAtlasMock.bat: $startAtlasMockOutput"
    $errorEncountered = $true
    break
  }
 
  Write-Host "Running startEs.bat" -BackgroundColor Blue -ForegroundColor White
  $startEsOutput = & .\startEs.bat
  if ($startEsOutput -match "^ERROR.*" -or $? -ne 0) {
    Write-Error "Error encountered in startAtlasMock.bat: $startEsOutput"
    $errorEncountered = $true
    break
  }
 
  Write-Host "Setup Running" -BackgroundColor Blue -ForegroundColor Green
}
 
elseif($choice -eq "1")
{
    Write-Host "Running startAtlasMock and startEs only" -BackgroundColor Blue -ForegroundColor White
    Write-Host "Running startAtlasMock.bat" -BackgroundColor Blue -ForegroundColor White
    & .\startAtlasMock.bat
 
    Write-Host "Running startEs.bat" -BackgroundColor Blue -ForegroundColor White
    & .\startEs.bat
 
    Write-Host "Setup Running" -BackgroundColor Blue -ForegroundColor Green
}
else
{
    Write-Host "Invalid choice. Exiting.. " -BackgroundColor Yellow -ForegroundColor Red
}

# ----------------------------------------------------------
