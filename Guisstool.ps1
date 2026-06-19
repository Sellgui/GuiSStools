# ================================================
#   GuiSS Tools Launcher - CheesySS Style
# ================================================

Clear-Host
$host.UI.RawUI.WindowTitle = "GuiSS Tools Launcher"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "GuiSS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1200, 760)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $true

# Sidebar (links)
$sidebar = New-Object System.Windows.Forms.Panel
$sidebar.Size = New-Object System.Drawing.Size(260, 700)
$sidebar.Location = New-Object System.Drawing.Point(12, 12)
$sidebar.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$form.Controls.Add($sidebar)

# Titel
$title = New-Object System.Windows.Forms.Label
$title.Text = "GuiSS Tools"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(25, 30)
$sidebar.Controls.Add($title)

# ACTIONS
$actionsLabel = New-Object System.Windows.Forms.Label
$actionsLabel.Text = "ACTIONS"
$actionsLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$actionsLabel.ForeColor = [System.Drawing.Color]::Gray
$actionsLabel.Location = New-Object System.Drawing.Point(25, 110)
$sidebar.Controls.Add($actionsLabel)

# Sidebar knoppen
$btnOpen = New-Object System.Windows.Forms.Button; $btnOpen.Text = "Open Install Folder"; $btnOpen.Size = New-Object System.Drawing.Size(205, 42); $btnOpen.Location = New-Object System.Drawing.Point(25, 145); $btnOpen.BackColor = [System.Drawing.Color]::FromArgb(45,45,45); $btnOpen.ForeColor = "White"; $btnOpen.FlatStyle = "Flat"; $btnOpen.Add_Click({explorer .}); $sidebar.Controls.Add($btnOpen)
$btnClear = New-Object System.Windows.Forms.Button; $btnClear.Text = "Clear Downloaded Files"; $btnClear.Size = New-Object System.Drawing.Size(205, 42); $btnClear.Location = New-Object System.Drawing.Point(25, 195); $btnClear.BackColor = [System.Drawing.Color]::FromArgb(45,45,45); $btnClear.ForeColor = "White"; $btnClear.FlatStyle = "Flat"; $btnClear.Add_Click({[System.Windows.Forms.MessageBox]::Show("Download map nog niet gewist.", "Info")}); $sidebar.Controls.Add($btnClear)
$btnCMD = New-Object System.Windows.Forms.Button; $btnCMD.Text = "Open CMD"; $btnCMD.Size = New-Object System.Drawing.Size(205, 42); $btnCMD.Location = New-Object System.Drawing.Point(25, 245); $btnCMD.BackColor = [System.Drawing.Color]::FromArgb(45,45,45); $btnCMD.ForeColor = "White"; $btnCMD.FlatStyle = "Flat"; $btnCMD.Add_Click({Start-Process cmd}); $sidebar.Controls.Add($btnCMD)

# Hoofd paneel
$main = New-Object System.Windows.Forms.Panel
$main.Size = New-Object System.Drawing.Size(890, 700)
$main.Location = New-Object System.Drawing.Point(285, 12)
$main.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 25)
$form.Controls.Add($main)

# Ready tekst
$ready = New-Object System.Windows.Forms.Label
$ready.Text = "Ready"
$ready.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
$ready.ForeColor = "White"
$ready.Location = New-Object System.Drawing.Point(35, 25)
$main.Controls.Add($ready)

$subtitle = New-Object System.Windows.Forms.Label
$subtitle.Text = "Select a tool to launch"
$subtitle.Font = New-Object System.Drawing.Font("Segoe UI", 11)
$subtitle.ForeColor = "Gray"
$subtitle.Location = New-Object System.Drawing.Point(35, 60)
$main.Controls.Add($subtitle)

# CheesySS Knop (groot + groen)
$cheesyBtn = New-Object System.Windows.Forms.Button
$cheesyBtn.Text = "Start CheesySS Tools"
$cheesyBtn.Size = New-Object System.Drawing.Size(820, 90)
$cheesyBtn.Location = New-Object System.Drawing.Point(35, 110)
$cheesyBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 190, 100)
$cheesyBtn.ForeColor = "White"
$cheesyBtn.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$cheesyBtn.FlatStyle = "Flat"
$main.Controls.Add($cheesyBtn)

# TeslaPro Knop
$teslaBtn = New-Object System.Windows.Forms.Button
$teslaBtn.Text = "Start TeslaPro SS Tools"
$teslaBtn.Size = New-Object System.Drawing.Size(820, 80)
$teslaBtn.Location = New-Object System.Drawing.Point(35, 215)
$teslaBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$teslaBtn.ForeColor = "White"
$teslaBtn.Font = New-Object System.Drawing.Font("Segoe UI", 15, [System.Drawing.FontStyle]::Bold)
$teslaBtn.FlatStyle = "Flat"
$main.Controls.Add($teslaBtn)

# Console
$console = New-Object System.Windows.Forms.TextBox
$console.Multiline = $true
$console.ScrollBars = "Vertical"
$console.Size = New-Object System.Drawing.Size(820, 290)
$console.Location = New-Object System.Drawing.Point(35, 330)
$console.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 10)
$console.ForeColor = [System.Drawing.Color]::Lime
$console.Font = New-Object System.Drawing.Font("Consolas", 10)
$console.Text = "Activity Console`nReady...`n"
$main.Controls.Add($console)

# Knop acties
$cheesyBtn.Add_Click({
    $console.AppendText("`n[CheesySS] Starting tool...`n")
    Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
})

$teslaBtn.Add_Click({
    $console.AppendText("`n[TeslaPro] Starting tools...`n")
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})

$form.ShowDialog() | Out-Null
