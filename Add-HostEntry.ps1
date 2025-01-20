param (
    [string]$ipAddress,
    [string]$canonicalName
)

$hostsFilePath = "$env:SystemRoot\System32\drivers\etc\hosts"

$hostsContent = Get-Content -Path $hostsFilePath

$entryExists = $hostsContent -match "^\s*$ipAddress\s+$canonicalName\s*$"

if (-not $entryExists) {
    $newEntry = "`r`n$ipAddress`t$canonicalName"

    Add-Content -Path $hostsFilePath -Value $newEntry

    Write-Output "Entry added: $newEntry"
} else {
    Write-Output "Entry already exists: $ipAddress $canonicalName"
}