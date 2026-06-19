# ================================================
#   GuiSS Tools Launcher - Groene Thema
# ================================================

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml
Add-Type -AssemblyName System.Windows.Forms

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="GuiSS Tools Launcher"
    Width="1150" Height="740"
    WindowStartupLocation="CenterScreen"
    ResizeMode="NoResize"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    FontFamily="Segoe UI">

    <Border Background="#0A3D1F" CornerRadius="10" BorderBrush="#1E8C4A" BorderThickness="2">   <!-- Donker Groen -->
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="45"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Grid.Row="0" Background="#0F5C2F" CornerRadius="10,10,0,0">
                <Grid>
                    <TextBlock Text="GuiSS Tools Launcher" Margin="25,0,0,0" VerticalAlignment="Center" FontSize="15" FontWeight="SemiBold" Foreground="#C5FFDD"/>
                    <Button x:Name="CloseBtn" Content="✕" Width="40" Height="30" HorizontalAlignment="Right" Background="Transparent" Foreground="#C5FFDD" BorderThickness="0" Margin="0,0,15,0" FontSize="16"/>
                </Grid>
            </Border>

            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="260"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Sidebar -->
                <Border Grid.Column="0" Background="#0A3D1F" BorderBrush="#1E8C4A" BorderThickness="0,0,1,0">
                    <StackPanel Margin="25,35,20,20">
                        <TextBlock Text="GuiSS Tools" FontSize="24" FontWeight="Bold" Foreground="#A8FFCC" Margin="0,0,0,30"/>
                        <TextBlock Text="ACTIONS" FontSize="9" FontWeight="Bold" Foreground="#6BFF9E" Margin="0,0,0,10"/>
                        
                        <Button x:Name="OpenFolderBtn" Content=" Open Install Folder" Height="40" Background="#1E8C4A" Foreground="White" Margin="0,4"/>
                        <Button x:Name="ClearBtn" Content=" Clear Downloaded Files" Height="40" Background="#1E8C4A" Foreground="White" Margin="0,4"/>
                        <Button x:Name="OpenCmdBtn" Content=" Open CMD" Height="40" Background="#1E8C4A" Foreground="White" Margin="0,4"/>
                    </StackPanel>
                </Border>

                <!-- Main Area -->
                <StackPanel Grid.Column="1" Margin="30,35,40,30">
                    <TextBlock Text="Ready" FontSize="28" FontWeight="SemiBold" Foreground="#C5FFDD"/>
                    <TextBlock Text="Select a tool to launch" FontSize="13" Foreground="#8CFFBB" Margin="0,5,0,25"/>

                    <!-- CheesySS -->
                    <Button x:Name="CheesyBtn" Height="58" Margin="0,8" Background="#E6B800" Foreground="#0F2A00" FontSize="16" FontWeight="Bold" Content="Start CheesySS Tools"/>

                    <!-- TeslaPro -->
                    <Button x:Name="TeslaBtn" Height="58" Margin="0,8" Background="#0088FF" Foreground="White" FontSize="16" FontWeight="Bold" Content="Start TeslaPro SS Tools"/>

                    <!-- Extra Tools -->
                    <TextBlock Text="Extra Tools" FontSize="14" FontWeight="SemiBold" Foreground="#C5FFDD" Margin="0,25,0,12"/>

                    <Button x:Name="ProcessHackerBtn" Height="52" Margin="0,6" Background="#FF4444" Foreground="White" FontSize="15" FontWeight="Bold" Content="Process Hacker"/>
                    <Button x:Name="AnyDeskBtn" Height="52" Margin="0,6" Background="#00C853" Foreground="White" FontSize="15" FontWeight="Bold" Content="AnyDesk"/>
                    <Button x:Name="SystemInformerBtn" Height="52" Margin="0,6" Background="#9C27B0" Foreground="White" FontSize="15" FontWeight="Bold" Content="System Informer"/>
                </StackPanel>
            </Grid>

            <!-- Console -->
            <Border Grid.Row="1" Grid.ColumnSpan="2" VerticalAlignment="Bottom" Height="160" Background="#041F10" BorderBrush="#1E8C4A" BorderThickness="0,1,0,0">
                <Grid Margin="30,12">
                    <TextBlock Text="ACTIVITY CONSOLE" FontSize="9" FontWeight="Bold" Foreground="#6BFF9E" Margin="0,0,0,6"/>
                    <TextBox x:Name="ConsoleBox" Background="Transparent" Foreground="#A8FFCC" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" BorderThickness="0"/>
                </Grid>
            </Border>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Naam vinden
$CloseBtn = $window.FindName("CloseBtn")
$CheesyBtn = $window.FindName("CheesyBtn")
$TeslaBtn = $window.FindName("TeslaBtn")
$ProcessHackerBtn = $window.FindName("ProcessHackerBtn")
$AnyDeskBtn = $window.FindName("AnyDeskBtn")
$SystemInformerBtn = $window.FindName("SystemInformerBtn")
$ConsoleBox = $window.FindName("ConsoleBox")
$OpenFolderBtn = $window.FindName("OpenFolderBtn")
$ClearBtn = $window.FindName("ClearBtn")
$OpenCmdBtn = $window.FindName("OpenCmdBtn")

function Write-Console($msg) {
    $time = Get-Date -Format "HH:mm:ss"
    $ConsoleBox.Dispatcher.Invoke({
        $ConsoleBox.AppendText("[$time] $msg`r`n")
        $ConsoleBox.ScrollToEnd()
    })
}

# Acties
$CheesyBtn.Add_Click({ 
    Write-Console "CheesySS Tools starten..."
    Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
})

$TeslaBtn.Add_Click({ 
    Write-Console "TeslaPro Tools starten..."
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})

$ProcessHackerBtn.Add_Click({
    Write-Console "Process Hacker download geopend..."
    Start-Process "https://processhacker.sourceforge.io/downloads.php"
})

$AnyDeskBtn.Add_Click({
    Write-Console "AnyDesk download geopend..."
    Start-Process "https://anydesk.com/nl/downloads"
})

$SystemInformerBtn.Add_Click({
    Write-Console "System Informer download geopend..."
    Start-Process "https://www.systeminformer.com/downloads"
})

$CloseBtn.Add_Click({ $window.Close() })
$OpenFolderBtn.Add_Click({ explorer . })
$ClearBtn.Add_Click({ Write-Console "Clear functie nog niet actief." })
$OpenCmdBtn.Add_Click({ Start-Process cmd.exe })

Write-Console "GuiSS Tools Launcher gestart."
$window.ShowDialog() | Out-Null
