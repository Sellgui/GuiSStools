# ================================================
#   GuiSS Tools Launcher - Simpele Stabiele Versie
# ================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "GuiSS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1050, 620)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(10, 61, 31)
$form.Font = New-Object System.Drawing.Font("Segoe UI", 10)

$title = New-Object System.Windows.Forms.Label
$title.Text = "GuiSS Tools Launcher"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::FromArgb(168, 255, 204)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(30, 25)
$form.Controls.Add($title)

$y = 90
$buttons = @(
    @{Text="Start CheesySS Tools"; Action={Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')" ' }},
    @{Text="Start TeslaPro SS Tools"; Action={Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"' }},
    @{Text="Open Prefetch Folder"; Action={Start-Process explorer.exe -ArgumentList "C:\Windows\Prefetch" }},
    @{Text="Process Hacker"; Action={Start-Process "https://processhacker.sourceforge.io/downloads.php" }},
    @{Text="AnyDesk"; Action={Start-Process "https://anydesk.com/nl/downloads" }},
    @{Text="System Informer"; Action={Start-Process "https://systeminformer.com/canary" }}
)

foreach ($b in $buttons) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $b.Text
    $btn.Size = New-Object System.Drawing.Size(420, 52)
    $btn.Location = New-Object System.Drawing.Point(30, $y)
    $btn.BackColor = [System.Drawing.Color]::FromArgb(30, 140, 74)
    $btn.ForeColor = "White"
    $btn.FlatStyle = "Flat"
    $btn.FlatAppearance.BorderSize = 0
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $btn.Add_Click($b.Action)
    $form.Controls.Add($btn)
    $y += 65
}

$consoleLabel = New-Object System.Windows.Forms.Label
$consoleLabel.Text = "Activity Console"
$consoleLabel.ForeColor = [System.Drawing.Color]::FromArgb(168, 255, 204)
$consoleLabel.Location = New-Object System.Drawing.Point(520, 25)
$consoleLabel.AutoSize = $true
$form.Controls.Add($consoleLabel)

$console = New-Object System.Windows.Forms.TextBox
$console.Location = New-Object System.Drawing.Point(520, 55)
$console.Size = New-Object System.Drawing.Size(500, 480)
$console.BackColor = [System.Drawing.Color]::FromArgb(16, 17, 22)
$console.ForeColor = [System.Drawing.Color]::FromArgb(160, 232, 192)
$console.Font = New-Object System.Drawing.Font("Consolas", 11)
$console.Multiline = $true
$console.ScrollBars = "Vertical"
$console.ReadOnly = $true
$form.Controls.Add($console)

function Write-Console($msg) {
    $time = Get-Date -Format "HH:mm:ss"
    $console.AppendText("[$time] $msg`r`n")
    $console.ScrollToCaret()
}

Write-Console "GuiSS Tools Launcher gestart."
$form.ShowDialog() | Out-Null
