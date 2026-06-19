# ================================================
#   GuiSS Tools Launcher - Eenvoudige Werkende Versie
# ================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "GuiSS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1100, 680)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(10, 61, 31)
$form.Font = New-Object System.Drawing.Font("Segoe UI", 10)

# Title
$title = New-Object System.Windows.Forms.Label
$title.Text = "GuiSS Tools"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::FromArgb(168, 255, 204)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(30, 30)
$form.Controls.Add($title)

# Knoppen
$y = 100
$btns = @(
    "Start CheesySS Tools",
    "Start TeslaPro SS Tools",
    "Open Prefetch Folder",
    "Process Hacker",
    "AnyDesk",
    "System Informer"
)

foreach ($text in $btns) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $text
    $btn.Size = New-Object System.Drawing.Size(400, 50)
    $btn.Location = New-Object System.Drawing.Point(30, $y)
    $btn.BackColor = [System.Drawing.Color]::FromArgb(30, 140, 74)
    $btn.ForeColor = "White"
    $btn.FlatStyle = "Flat"
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $form.Controls.Add($btn)
    
    if ($text -eq "Start CheesySS Tools") {
        $btn.Add_Click({ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')" ' })
    } elseif ($text -eq "Start TeslaPro SS Tools") {
        $btn.Add_Click({ Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"' })
    } elseif ($text -eq "Open Prefetch Folder") {
        $btn.Add_Click({ Start-Process explorer.exe -ArgumentList "C:\Windows\Prefetch" })
    } elseif ($text -eq "Process Hacker") {
        $btn.Add_Click({ Start-Process "https://processhacker.sourceforge.io/downloads.php" })
    } elseif ($text -eq "AnyDesk") {
        $btn.Add_Click({ Start-Process "https://anydesk.com/nl/downloads" })
    } elseif ($text -eq "System Informer") {
        $btn.Add_Click({ Start-Process "https://systeminformer.com/canary" })
    }
    $y += 60
}

$form.ShowDialog() | Out-Null
