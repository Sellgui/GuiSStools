# ================================================
#   GuiSS Tools Launcher - CheesySS Style
# ================================================

Clear-Host
$host.UI.RawUI.WindowTitle = "GuiSS Tools Launcher"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "GuiSS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1180, 740)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 18)
$form.FormBorderStyle = "FixedSingle"

# Linker Sidebar (zoals CheesySS)
$sidebar = New-Object System.Windows.Forms.Panel
$sidebar.Size = New-Object System.Drawing.Size(260, 680)
$sidebar.Location = New-Object System.Drawing.Point(12, 12)
$sidebar.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$form.Controls.Add($sidebar)

# Titel linksboven
$title = New-Object System.Windows.Forms.Label
$title.Text = "GuiSS Tools"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 22, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 180)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(25, 25)
$sidebar.Controls.Add($title)

# ACTIONS
$act = New-Object System.Windows.Forms.Label
$act.Text = "ACTIONS"
$act.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$act.ForeColor = [System.Drawing.Color]::Gray
$act.Location = New-Object System.Drawing.Point(25, 100)
$sidebar.Controls.Add($act)

$btn1 = New-Object System.Windows.Forms.Button; $btn1.Text = "Open Install Folder"; $btn1.Size = New-Object System.Drawing.Size(210, 38); $btn1.Location = New-Object System.Drawing.Point(25, 130); $btn1.BackColor = [System.Drawing.Color]::FromArgb(40,40,40); $btn1.ForeColor = "White"; $btn1.FlatStyle = "Flat"; $btn1.Add_Click({explorer .}); $sidebar.Controls.Add($btn1)
$btn2 = New-Object System.Windows.Forms.Button; $btn2.Text = "Clear Downloaded Files"; $btn2.Size = New-Object System.Drawing.Size(210, 38); $btn2.Location = New-Object System.Drawing.Point(25, 175); $btn2.BackColor = [System.Drawing.Color]::FromArgb(40,40,40); $btn2.ForeColor = "White"; $btn2.FlatStyle = "Flat"; $btn2.Add_Click({[System.Windows.Forms.MessageBox]::Show("Map nog niet geleegd", "Info")}); $sidebar.Controls.Add($btn2)
$btn3 = New-Object System.Windows.Forms.Button; $btn3.Text = "Open CMD"; $btn3.Size = New-Object System.Drawing.Size(210, 38); $btn3.Location = New-Object System.Drawing.Point(25, 220); $btn3.BackColor = [System.Drawing.Color]::FromArgb(40,40,40); $btn3.ForeColor = "White"; $btn3.FlatStyle = "Flat"; $btn3.Add_Click({Start-Process cmd}); $sidebar.Controls.Add($btn3)

# Hoofd paneel (rechts)
$main = New-Object System.Windows.Forms.Panel
$main.Size = New-Object System.Drawing.Size(870, 680)
$main.Location = New-Object System.Drawing.Point(285, 12)
$main.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 25)
$form.Controls.Add($main)

# Ready header
$ready = New-Object System.Windows.Forms.Label
$ready.Text = "Ready"
$ready.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$ready.ForeColor = "White"
$ready.Location = New-Object System.Drawing.Point(30, 25)
$main.Controls.Add($ready)

$sub = New-Object System.Windows.Forms.Label
$sub.Text = "Select a tool to launch"
$sub.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$sub.ForeColor = "Gray"
$sub.Location = New-Object System.Drawing.Point(30, 55)
$main.Controls.Add($sub)

# === Grote Knoppen ===
$cheesyBtn = New-Object System.Windows.Forms.Button
$cheesyBtn.Text = "Start CheesySS Tools"
$cheesyBtn.Size = New-Object System.Drawing.Size(800, 85)
$cheesyBtn.Location = New-Object System.Drawing.Point(35, 110)
$cheesyBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 180, 80)
$cheesyBtn.ForeColor = "White"
$cheesyBtn.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$cheesyBtn.FlatStyle = "Flat"
$cheesyBtn.FlatAppearance.BorderSize = 0
$main.Controls.Add($cheesyBtn)

$teslaBtn = New-Object System.Windows.Forms.Button
$teslaBtn.Text = "Start TeslaPro SS Tools"
$teslaBtn.Size = New-Object System.Drawing.Size(800, 75)
$teslaBtn.Location = New-Object System.Drawing.Point(35, 210)
$teslaBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$teslaBtn.ForeColor = "White"
$teslaBtn.Font = New-Object System.Drawing.Font("Segoe UI", 15, [System.Drawing.FontStyle]::Bold)
$teslaBtn.FlatStyle = "Flat"
$main.Controls.Add($teslaBtn)

# Console
$console = New-Object System.Windows.Forms.TextBox
$console.Multiline = $true
$console.ScrollBars = "Vertical"
$console.Size = New-Object System.Drawing.Size(800, 280)
$console.Location = New-Object System.Drawing.Point(35, 320)
$console.BackColor = [System.Drawing.Color]::Black
$console.ForeColor = [System.Drawing.Color]::Lime
$console.Font = New-Object System.Drawing.Font("Consolas", 10)
$console.Text = "Activity Console`nReady...`n"
$main.Controls.Add($console)

# Acties voor knoppen
$cheesyBtn.Add_Click({
    $console.AppendText("`n[CheesySS] Tool wordt gestart...`n")
    Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
})

$teslaBtn.Add_Click({
    $console.AppendText("`n[TeslaPro] Tools worden gestart...`n")
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})

$form.ShowDialog() | Out-Null
