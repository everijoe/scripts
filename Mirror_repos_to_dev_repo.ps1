$GitPath = "C:\Everi\Application\git"
$DevRepoPath = "O:\SystemEngineering"

if (Test-Path -Path $GitPath) {
    Write-Output "Found $GitPath"
} else {
    throw "$GitPath not found"
}

if (Test-Path -Path $DevRepoPath) {
    Write-Output "Found $DevRepoPath"
} else {
    throw "$DevRepoPath not found"
}

$ClonedRepos = @(
    "adlink-nic-update"
    "biab-provisioning"
    "site-controller-updates-provisioning"
    "rtb41156_remote_vm_build"
    "rtb41156-vm-provisioning"
    "rtb-central-scripts"
)

$ClonedRepos | ForEach-Object {
    if (Test-Path -Path $GitPath\$_) {
        Write-Output "Found repo $_"
        if (Select-String -Path $GitPath\$_\.git\config -Pattern '[branch "main"]') {
            Write-Output "$_ is currently configured for the main branch"
            Robocopy.exe $GitPath\$_\ $DevRepoPath\$_ /xd .git /mir
        } else {
            throw "$_ is not currently configured for the main branch"
        }
    }
}

Write-Output `a"Finished copying repos to DEV_REPO."
