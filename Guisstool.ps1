# ================================================
#   GuiSS Tools Launcher - CheesySS Style
# ================================================

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml
Add-Type -AssemblyName System.Windows.Forms

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# XAML - Gebaseerd op CheesySS stijl
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="GuiSS Tools Launcher"
    Width="1180" Height="740"
    WindowStartupLocation="CenterScreen"
    ResizeMode="NoResize"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    FontFamily="Segoe UI">

    <Border Background="#0F0B00" BorderBrush="#3D2E00" BorderThickness="1" CornerRadius="10">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="45"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Grid.Row="0" Background="#1A1200" CornerRadius="10,10,0,0">
                <Grid>
                    <TextBlock Text="GuiSS Tools Launcher" Margin="20,0,0,0" VerticalAlignment="Center" FontSize="14" FontWeight="SemiBold" Foreground="#FFF4C8"/>
                    <Button x:Name="CloseBtn" Content="✕" Width="40" Height="30" HorizontalAlignment="Right" Background="Transparent" Foreground="#907830" BorderThickness="0" FontSize="14" Margin="0,0,10,0"/>
                </Grid>
            </Border>

            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="240"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Sidebar -->
                <Border Grid.Column="0" Background="#1A1200" BorderBrush="#3D2E00" BorderThickness="0,0,1,0">
                    <StackPanel Margin="20,30,20,20">
                        <TextBlock Text="GuiSS Tools" FontSize="22" FontWeight="Bold" Foreground="#F5C200" Margin="0,0,0,25"/>
                        <TextBlock Text="ACTIONS" FontSize="9" FontWeight="Bold" Foreground="#907830" Margin="4,0,0,8"/>
                        
                        <Button x:Name="OpenFolderBtn" Content=" Open Install Folder" Height="38" Background="Transparent" Foreground="#FFF4C8" HorizontalContentAlignment="Left" Margin="0,2"/>
                        <Button x:Name="ClearBtn" Content=" Clear Downloaded Files" Height="38" Background="Transparent" Foreground="#FFF4C8" HorizontalContentAlignment="Left" Margin="0,2"/>
                        <Button x:Name="OpenCmdBtn" Content=" Open CMD" Height="38" Background="Transparent" Foreground="#FFF4C8" HorizontalContentAlignment="Left" Margin="0,2"/>
                    </StackPanel>
                </Border>

                <!-- Main Content -->
                <Grid Grid.Column="1" Margin="25,25,25,25">
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <TextBlock Grid.Row="0" Text="Ready" FontSize="26" FontWeight="SemiBold" Foreground="#FFF4C8"/>
                    <TextBlock Grid.Row="1" Text="Select a tool to launch" FontSize="12" Foreground="#907830" Margin="0,5,0,20"/>

                    <!-- CheesySS Knop (Geel) -->
                    <Button x:Name="CheesyBtn" Grid.Row="2" Height="75" Margin="0,0,0,15" Background="#F5C200" Foreground="#0F0B00" FontSize="18" FontWeight="Bold" Content="🐱 Start CheesySS Tools"/>

                    <!-- TeslaPro Knop (Blauw) -->
                    <Button x:Name="TeslaBtn" Grid.Row="3" Height="70" Background="#0A84FF" Foreground="White" FontSize="17" FontWeight="Bold" Content="⚡ Start TeslaPro SS Tools"/>
                </Grid>
            </Grid>

            <!-- Console -->
            <Border Grid.Row="1" Grid.ColumnSpan="2" VerticalAlignment="Bottom" Height="170" Background="#060400" BorderBrush="#3D2E00" BorderThickness="0,1,0,0" Margin="0,0,0,0">
                <Grid Margin="25,10">
                    <TextBlock Text="ACTIVITY CONSOLE" FontSize="9" FontWeight="Bold" Foreground="#5A4010" Margin="0,0,0,5"/>
                    <TextBox x:Name="ConsoleBox" Background="Transparent" Foreground="#F5C200" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" BorderThickness="0"/>
                </Grid>
            </Border>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$CloseBtn = $window.FindName("CloseBtn")
$CheesyBtn = $window.FindName("CheesyBtn")
$TeslaBtn = $window.FindName("TeslaBtn")
$ConsoleBox = $window.FindName("ConsoleBox")
$OpenFolderBtn = $window.FindName("OpenFolderBtn")
$ClearBtn = $window.FindName("ClearBtn")
$OpenCmdBtn = $window.FindName("OpenCmdBtn")

function Write-Console {
    param([string]$Message)
    $time = Get-Date -Format "HH:mm:ss"
    $ConsoleBox.Dispatcher.Invoke({
        $ConsoleBox.AppendText("[$time] $Message`r`n")
        $ConsoleBox.ScrollToEnd()
    })
}

# Knop acties
$CheesyBtn.Add_Click({
    Write-Console "CheesySS Tools starten..."
    Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
})

$TeslaBtn.Add_Click({
    Write-Console "TeslaPro SS Tools starten..."
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"'
})

$CloseBtn.Add_Click({ $window.Close() })
$OpenFolderBtn.Add_Click({ explorer . })
$ClearBtn.Add_Click({ Write-Console "Clear functie nog niet actief." })
$OpenCmdBtn.Add_Click({ Start-Process cmd })

Write-Console "GuiSS Tools Launcher gestart."
$window.ShowDialog() | Out-Null
