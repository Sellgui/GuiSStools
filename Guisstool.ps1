# ================================================
#   GuiSS Tools Launcher - Aangepaste versie
# ================================================

Clear-Host
$host.UI.RawUI.WindowTitle = "GuiSS Tools Launcher"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "GuiSS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1180, 720)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
$form.FormBorderStyle = "FixedSingle"

# Sidebar
$sidebar = New-Object System.Windows.Forms.Panel
$sidebar.Size = New-Object System.Drawing.Size(260, 660)
$sidebar.Location = New-Object System.Drawing.Point(12, 12)
$sidebar.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$form.Controls.Add($sidebar)

$title = New-Object System.Windows.Forms.Label
$title.Text = "GuiSS Tools"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 22, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 200)
$title.Location = New-Object System.Drawing.Point(25, 25)
$sidebar.Controls.Add($title)

# Actions
$act = New-Object System.Windows.Forms.Label; $act.Text = "ACTIONS"; $act.ForeColor = "Gray"; $act.Location = New-Object System.Drawing.Point(25, 110); $sidebar.Controls.Add($act)

$btn1 = New-Object System.Windows.Forms.Button; $btn1.Text = "Open Install Folder"; $btn1.Size = New-Object System.Drawing.Size(205, 35); $btn1.Location = New-Object System.Drawing.Point(25, 140); $btn1.BackColor = [System.Drawing.Color]::FromArgb(45,45,45); $btn1.ForeColor = "White"; $btn1.FlatStyle = "Flat"; $btn1.Add_Click({explorer .}); $sidebar.Controls.Add($btn1)
$btn2 = New-Object System.Windows.Forms.Button; $btn2.Text = "Clear Downloaded Files"; $btn2.Size = New-Object System.Drawing.Size(205, 35); $btn2.Location = New-Object System.Drawing.Point(25, 180); $btn2.BackColor = [System.Drawing.Color]::FromArgb(45,45,45); $btn2.ForeColor = "White"; $btn2.FlatStyle = "Flat"; $btn2.Add_Click({[System.Windows.Forms.MessageBox]::Show("Nog niet geïmplementeerd","Info")}); $sidebar.Controls.Add($btn2)
$btn3 = New-Object System.Windows.Forms.Button; $btn3.Text = "Open CMD"; $btn3.Size = New-Object System.Drawing.Size(205, 35); $btn3.Location = New-Object System.Drawing.Point(25, 220); $btn3.BackColor = [System.Drawing.Color]::FromArgb(45,45,45); $btn3.ForeColor = "White"; $btn3.FlatStyle = "Flat"; $btn3.Add_Click({Start-Process cmd}); $sidebar.Controls.Add($btn3)

# Hoofd paneel
$main = New-Object System.Windows.Forms.Panel
$main.Size = New-Object System.Drawing.Size(880, 660)
$main.Location = New-Object System.Drawing.Point(285, 12)
$main.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 25)
$form.Controls.Add($main)

$ready = New-Object System.Windows.Forms.Label; $ready.Text = "Ready - Select a tool to launch"; $ready.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold); $ready.ForeColor = "White"; $ready.Location = New-Object System.Drawing.Point(30, 25); $main.Controls.Add($ready)

# Kleine Cheesy knop (geel)
$cheesyBtn = New-Object System.Windows.Forms.Button
$cheesyBtn.Text = "🐱 Start CheesySS Tools"
$cheesyBtn.Size = New-Object System.Drawing.Size(800, 55)
$cheesyBtn.Location = New-Object System.Drawing.Point(30, 80)
$cheesyBtn.BackColor = [System.Drawing.Color]::FromArgb(255, 200, 0)   # Geel
$cheesyBtn.ForeColor = "Black"
$cheesyBtn.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$main.Controls.Add($cheesyBtn)

# Kleine Tesla knop (blauw)
$teslaBtn = New-Object System.Windows.Forms.Button
$teslaBtn.Text = "⚡ Start TeslaPro SS Tools"
$teslaBtn.Size = New-Object System.Drawing.Size(800, 55)
$teslaBtn.Location = New-Object System.Drawing.Point(30, 145)
$teslaBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)   # Blauw
$teslaBtn.ForeColor = "White"
$teslaBtn.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$main.Controls.Add($teslaBtn)

# Kleinere Console
$console = New-Object System.Windows.Forms.TextBox
$console.Multiline = $true
$console.ScrollBars = "Vertical"
$console.Size = New-Object System.Drawing.Size(800, 180)
$console.Location = New-Object System.Drawing.Point(30, 230)
$console.BackColor = [System.Drawing.Color]::Black
$console.ForeColor = [System.Drawing.Color]::Lime
$console.Font = New-Object System.Drawing.Font("Consolas", 9.5)
$console.Text = "Activity Console`nReady...`n"
$main.Controls.Add($console)

# Acties
$cheesyBtn.Add_Click({
    $console.AppendText("`n[CheesySS] Tool wordt gestart...`n")
    Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
})

$teslaBtn.Add_Click({
    $console.AppendText("`n[TeslaPro] Tools worden gestart...`n")
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})

$form.ShowDialog() | Out-Null
