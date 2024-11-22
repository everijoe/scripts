$DevRepoPath = "O:\SystemEngineering"
$OneDrivePath = "$env:USERPROFILE\OneDrive - Everi Payments, Inc"

if (Test-Path -Path $DevRepoPath) {
    Write-Output "Found $DevRepoPath"
} else {
    throw "$DevRepoPath not found"
}

if (Test-Path -Path $OneDrivePath) {
    Write-Output "Found $OneDrivePath"
} else {
    throw "$OneDrivePath not found"
}

Robocopy.exe $DevRepoPath\ $OneDrivePath\SystemEngineering /mir

Write-Output `a"Finished copying SystemEngineering to OneDrive."
