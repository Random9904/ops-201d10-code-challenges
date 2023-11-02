# Events ---------------------------------------
# Define the output file path
$outputFilePath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), 'last_24.txt')

# Get the current date and time
$currentTime = Get-Date

# Calculate the start time for the 24-hour period
$startTime = $currentTime.AddHours(-24)

# Retrieve events from the System event log within the specified time frame
$events = Get-WinEvent -LogName System -FilterXPath "*[System[TimeCreated[@SystemTime>='$($startTime.ToUniversalTime())']]]"

# Save the events to the output file
$events | Format-Table -AutoSize | Out-File -FilePath $outputFilePath

# Errors ---------------------------------------
# Define the output file path
$outputFilePath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), 'errors.txt')

# Filter and retrieve "error" type events from event log
$events = Get-WinEvent -LogName System -ErrorAction SilentlyContinue | Where-Object { $_.LevelDisplayName -eq 'Error' }

# Save the error events to the output file
$events | Format-Table -AutoSize | Out-File -FilePath $outputFilePath

# 3---------------------------
# Get-WinEvent gets the events
# Where-Object filters it to only 16
Get-WinEvent -LogName System | Where-Object { $_.Id -eq 16 }

# 4 -------------------------
# Get-WinEvent gets the events
# MaxEvents limits it to the recent 20
# Format-table provide better legibility
Get-WinEvent -LogName System -MaxEvents 20 | Format-Table -AutoSize

# 5--------------------------
# Same
# Limits to recent 500
# ExpandProperty makes it full text
Get-WinEvent -LogName System -MaxEvents 500 | Select-Object -ExpandProperty ProviderName