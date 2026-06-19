# ================================================
#   GuiSS Tools Launcher
#   Clean versie - Grok Edition
# ================================================

Clear-Host
$host.UI.RawUI.WindowTitle = "GuiSS Tools Launcher"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Hoofd Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "GuiSS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1120, 720)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $true

# Groene → Rode gradient achtergrond
$form.Add_Paint({
    $rect = New-Object System.Drawing.Rectangle(0, 0, $form.Width, $form.Height)
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, 
               [System.Drawing.Color]::FromArgb(0, 180, 80),   # Groen
               [System.Drawing.Color]::FromArgb(180, 30, 30),   # Rood
               45)
    $_.Graphics.FillRectangle($brush, $rect)
})

# Linker Sidebar
$sidebar = New-Object System.Windows.Forms.Panel
$sidebar.Size = New-Object System.Drawing.Size(240, 670)
$sidebar.Location = New-Object System.Drawing.Point(15, 15)
$sidebar.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$form.Controls.Add($sidebar)

# Titel
$title = New-Object System.Windows.Forms.Label
$title.Text = "GuiSS Tools"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::Cyan
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(25, 30)
$sidebar.Controls.Add($title)

# Actions
$actLabel = New-Object System.Windows.Forms.Label
$actLabel.Text = "ACTIONS"
$actLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$actLabel.ForeColor = [System.Drawing.Color]::LightGray
$actLabel.Location = New-Object System.Drawing.Point(25, 110)
$sidebar.Controls.Add($actLabel)

function New-SidebarBtn($text, $y) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $text
    $btn.Size = New-Object System.Drawing.Size(190, 45)
    $btn.Location = New-Object System.Drawing.Point(25, $y)
    $btn.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = "Flat"
    $btn.FlatAppearance.BorderSize = 1
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 10)
    $sidebar.Controls.Add($btn)
    return $btn
}

New-SidebarBtn "Open Install Folder" 160 | ForEach-Object { $_.Add_Click({ explorer . }) }
New-SidebarBtn "Clear Downloaded Files" 215 | ForEach-Object { 
    $_.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Download map is nog niet geleegd.", "Info") }) 
}
New-SidebarBtn "Open CMD" 270 | ForEach-Object { $_.Add_Click({ Start-Process cmd }) }

# Hoofd Paneel
$main = New-Object System.Windows.Forms.Panel
$main.Size = New-Object System.Drawing.Size(820, 670)
$main.Location = New-Object System.Drawing.Point(270, 15)
$main.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 28)
$form.Controls.Add($main)

# Ready tekst
$ready = New-Object System.Windows.Forms.Label
$ready.Text = "Ready - Select a tool to launch"
$ready.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$ready.ForeColor = [System.Drawing.Color]::White
$ready.AutoSize = $true
$ready.Location = New-Object System.Drawing.Point(30, 30)
$main.Controls.Add($ready)

# Grote CheesySS knop
$cheesyBtn = New-Object System.Windows.Forms.Button
$cheesyBtn.Text = "🐱 Start CheesySS Tools"
$cheesyBtn.Size = New-Object System.Drawing.Size(760, 80)
$cheesyBtn.Location = New-Object System.Drawing.Point(30, 100)
$cheesyBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 180, 80)
$cheesyBtn.ForeColor = [System.Drawing.Color]::White
$cheesyBtn.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$cheesyBtn.FlatStyle = "Flat"
$cheesyBtn.FlatAppearance.BorderSize = 0
$main.Controls.Add($cheesyBtn)

$cheesyBtn.Add_Click({
    $console.AppendText("`n[CheesySS] Tool wordt gestart...`n")
    Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
})

# Grote TeslaPro knop
$teslaBtn = New-Object System.Windows.Forms.Button
$teslaBtn.Text = "⚡ Start TeslaPro SS Tools"
$teslaBtn.Size = New-Object System.Drawing.Size(760, 70)
$teslaBtn.Location = New-Object System.Drawing.Point(30, 200)
$teslaBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$teslaBtn.ForeColor = [System.Drawing.Color]::White
$teslaBtn.Font = New-Object System.Drawing.Font("Segoe UI", 15, [System.Drawing.FontStyle]::Bold)
$teslaBtn.FlatStyle = "Flat"
$main.Controls.Add($teslaBtn)

$teslaBtn.Add_Click({
    $console.AppendText("`n[TeslaPro] Tools worden gestart...`n")
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})

# Console
$console = New-Object System.Windows.Forms.TextBox
$console.Multiline = $true
$console.ScrollBars = "Vertical"
$console.Size = New-Object System.Drawing.Size(780, 280)
$console.Location = New-Object System.Drawing.Point(30, 320)
$console.BackColor = [System.Drawing.Color]::Black
$console.ForeColor = [System.Drawing.Color]::Lime
$console.Font = New-Object System.Drawing.Font("Consolas", 10)
$console.Text = "Activity Console`nReady...`n"
$main.Controls.Add($console)

$form.ShowDialog() | Out-Null
