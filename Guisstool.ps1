# ================================================
#   SS Tools Launcher GUI - Pure PowerShell
#   Werkt net als CheesySS & TeslaPro
# ================================================

Clear-Host
$host.UI.RawUI.WindowTitle = "🚀 SS Tools Launcher"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# === Hoofd Form ===
$form = New-Object System.Windows.Forms.Form
$form.Text = "SS Tools Launcher"
$form.Size = New-Object System.Drawing.Size(1150, 720)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$form.ForeColor = [System.Drawing.Color]::White
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $true

# Linker Sidebar
$sidebar = New-Object System.Windows.Forms.Panel
$sidebar.Size = New-Object System.Drawing.Size(230, 680)
$sidebar.Location = New-Object System.Drawing.Point(10, 10)
$sidebar.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 25)
$form.Controls.Add($sidebar)

# Logo / Titel
$logo = New-Object System.Windows.Forms.Label
$logo.Text = "🐱 SS Tools"
$logo.Font = New-Object System.Drawing.Font("Segoe UI", 22, [System.Drawing.FontStyle]::Bold)
$logo.ForeColor = [System.Drawing.Color]::Cyan
$logo.AutoSize = $true
$logo.Location = New-Object System.Drawing.Point(20, 20)
$sidebar.Controls.Add($logo)

# Actions
$actions = New-Object System.Windows.Forms.Label
$actions.Text = "ACTIONS"
$actions.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$actions.ForeColor = [System.Drawing.Color]::LightGray
$actions.Location = New-Object System.Drawing.Point(20, 90)
$sidebar.Controls.Add($actions)

function Create-SidebarButton($text, $y, $action) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $text
    $btn.Size = New-Object System.Drawing.Size(190, 40)
    $btn.Location = New-Object System.Drawing.Point(20, $y)
    $btn.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = "Flat"
    $btn.FlatAppearance.BorderSize = 1
    $btn.Add_Click($action)
    $sidebar.Controls.Add($btn)
    return $btn
}

Create-SidebarButton "Open Install Folder" 140 { explorer . }
Create-SidebarButton "Clear Downloaded Files" 190 { 
    [System.Windows.Forms.MessageBox]::Show("Download map geleegd (nog niet volledig geïmplementeerd)", "Info", "OK", "Information")
}
Create-SidebarButton "Open CMD" 240 { Start-Process cmd }

# Hoofd gebied
$mainPanel = New-Object System.Windows.Forms.Panel
$mainPanel.Size = New-Object System.Drawing.Size(860, 680)
$mainPanel.Location = New-Object System.Drawing.Point(250, 10)
$mainPanel.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 35)
$form.Controls.Add($mainPanel)

# Titel
$title = New-Object System.Windows.Forms.Label
$title.Text = "Ready - Select a tool to launch"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::White
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(20, 20)
$mainPanel.Controls.Add($title)

# Tools Grid
$tools = @(
    "PrefetchView", "BAMReveal", "StringsParser", "Fileless",
    "DPS-Analyzer", "UserAssistView", "JournalParser", "InjGen",
    "USBDetector", "PFTrace", "CheckDeletedUSN", "JARParser"
)

$x = 20
$y = 80
$width = 190
$height = 80
$col = 0

foreach ($tool in $tools) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $tool
    $btn.Size = New-Object System.Drawing.Size($width, $height)
    $btn.Location = New-Object System.Drawing.Point($x, $y)
    $btn.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 70)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = "Flat"
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 11)

    if ($tool -eq "PrefetchView") {
        $btn.Add_Click({
            [System.Windows.Forms.MessageBox]::Show("CheesySS Tool wordt gestart...", "Launching")
            Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
        })
    } else {
        $btn.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Deze tool komt binnenkort!", "Info") })
    }

    $mainPanel.Controls.Add($btn)

    $col++
    if ($col -eq 4) {
        $col = 0
        $x = 20
        $y += $height + 20
    } else {
        $x += $width + 20
    }
}

# Console onderaan
$console = New-Object System.Windows.Forms.TextBox
$console.Multiline = $true
$console.ScrollBars = "Vertical"
$console.Size = New-Object System.Drawing.Size(840, 140)
$console.Location = New-Object System.Drawing.Point(20, 520)
$console.BackColor = [System.Drawing.Color]::Black
$console.ForeColor = [System.Drawing.Color]::Lime
$console.Font = New-Object System.Drawing.Font("Consolas", 10)
$console.Text = "Activity Console`nReady...`n"
$mainPanel.Controls.Add($console)

# TeslaPro knop
$teslaBtn = New-Object System.Windows.Forms.Button
$teslaBtn.Text = "⚡ Start TeslaPro SS Tools"
$teslaBtn.Size = New-Object System.Drawing.Size(300, 50)
$teslaBtn.Location = New-Object System.Drawing.Point(20, 460)
$teslaBtn.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$teslaBtn.ForeColor = [System.Drawing.Color]::White
$teslaBtn.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$teslaBtn.Add_Click({
    $console.AppendText("`nTeslaPro Tools starten...`n")
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})
$mainPanel.Controls.Add($teslaBtn)

$form.ShowDialog() | Out-Null
