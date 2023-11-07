# Create a text file and put the ipconfig /all into it
ipconfig /all > network_report.txt

# Read the txt file
# Select-String searches for IPv4
# The last part is the REGEX
Get-Content network_report.txt | Select-String -Pattern "IPv4 Address" | ForEach-Object { $_.ToString() -replace '\D+(\d+\.\d+\.\d+\.\d+)', '$1' }

# Delete after use
Remove-Item network_report.txt