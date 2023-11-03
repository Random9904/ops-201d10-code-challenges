Write-Host
Write-Host
Write-Host "-------------------------CPU Order (Highest)-------------------------"
Write-Host
Write-Host

# Get-Process gets all the processes
# Sort-Object by CPU (highest)
# Format-Table shows results as a table
Get-Process | Sort-Object -Property CPU -Descending | Format-Table -AutoSize

Write-Host
Write-Host
Write-Host "-------------------------Property ID Order (Highest)-------------------------"
Write-Host
Write-Host

# Same
# Sort by ID; highest being number 1
# Same
Get-Process | Sort-Object -Property Id | Format-Table -AutoSize

Write-Host
Write-Host
Write-Host "-------------------------Working Set(Highest)-------------------------"
Write-Host
Write-Host

# Same
# Sort by Working Set (highest)
# Select top five
# Same
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5 | Format-Table -AutoSize

# Start-Process with Microsoft Edge and open it to the link
Start-Process "msedge" "https://owasp.org/www-project-top-ten/"

# Run notepad 10 times
for ($i = 1; $i -le 10; $i++) {
    Start-Process "notepad"
}

# Where-Object uses a filter to only with the name notepad
# ForEach-Object stops all the processes
Get-Process | Where-Object { $_.ProcessName -eq "notepad" } | ForEach-Object { Stop-Process -Id $_.Id -Force }

# Ask the user for a Process ID
$targetPID = Read-Host "Enter a Process ID to kill: "

# Check if the process exists
# TRUE -> KILL IT
# FALSE -> Print out error
if (Get-Process -Id $targetPID -ErrorAction SilentlyContinue) {
    Stop-Process -Id $targetPID -Force
    Write-Host "$targetPID killed"
} else {
    Write-Host "$targetPID not found."
}
