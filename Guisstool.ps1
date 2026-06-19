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
    Width="1150" Height="720"
    WindowStartupLocation="CenterScreen"
    ResizeMode="NoResize"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    FontFamily="Segoe UI">

    <Border Background="#0A3D1F" CornerRadius="12" BorderBrush="#1E8C4A" BorderThickness="2">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="50"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Grid.Row="0" Background="#0F5C2F" CornerRadius="12,12,0,0">
                <Grid>
                    <TextBlock Text="GuiSS Tools Launcher" Margin="30,0,0,0" VerticalAlignment="Center" FontSize="16" FontWeight="SemiBold" Foreground="#C5FFDD"/>
                    <Button x:Name="CloseBtn" Content="✕" Width="40" Height="35" HorizontalAlignment="Right" Background="Transparent" Foreground="#C5FFDD" BorderThickness="0" Margin="0,0,20,0" FontSize="18"/>
                </Grid>
            </Border>

            <Grid Grid.Row="1" Margin="25">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="260"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Sidebar -->
                <Border Grid.Column="0" Background="#0A3D1F" BorderBrush="#1E8C4A" BorderThickness="0,0,1,0" CornerRadius="8">
                    <StackPanel Margin="25,35,20,20">
                        <TextBlock Text="GuiSS Tools" FontSize="24" FontWeight="Bold" Foreground="#A8FFCC" Margin="0,0,0,30"/>
                        <TextBlock Text="ACTIONS" FontSize="9" FontWeight="Bold" Foreground="#6BFF9E" Margin="0,0,0,10"/>
                        
                        <Button x:Name="OpenFolderBtn" Content=" Open Install Folder" Height="42" Background="#1E8C4A" Foreground="White" Margin="0,5"/>
                        <Button x:Name="ClearBtn" Content=" Clear Downloaded Files" Height="42" Background="#1E8C4A" Foreground="White" Margin="0,5"/>
                        <Button x:Name="OpenCmdBtn" Content=" Open CMD" Height="42" Background="#1E8C4A" Foreground="White" Margin="0,5"/>
                    </StackPanel>
                </Border>

                <!-- Main Area -->
                <StackPanel Grid.Column="1" Margin="35,35,40,30">
                    <TextBlock Text="Ready" FontSize="28" FontWeight="SemiBold" Foreground="#C5FFDD"/>
                    <TextBlock Text="Select a tool to launch" FontSize="13" Foreground="#8CFFBB" Margin="0,5,0,30"/>

                    <Button x:Name="CheesyBtn" Height="62" Margin="0,8" FontSize="16" FontWeight="Bold" Content="Start CheesySS Tools" Background="#1E8C4A" Foreground="White"/>
                    <Button x:Name="TeslaBtn" Height="62" Margin="0,8" FontSize="16" FontWeight="Bold" Content="Start TeslaPro SS Tools" Background="#1E8C4A" Foreground="White"/>

                    <TextBlock Text="Extra Tools" FontSize="14" FontWeight="SemiBold" Foreground="#C5FFDD" Margin="0,30,0,12"/>

                    <Button x:Name="PrefetchBtn" Height="52" Margin="0,6" FontSize="15" FontWeight="Bold" Content="Open Prefetch" Background="#1E8C4A" Foreground="White"/>
                    <Button x:Name="ProcessHackerBtn" Height="52" Margin="0,6" FontSize="15" FontWeight="Bold" Content="Process Hacker" Background="#1E8C4A" Foreground="White"/>
                    <Button x:Name="AnyDeskBtn" Height="52" Margin="0,6" FontSize="15" FontWeight="Bold" Content="AnyDesk" Background="#1E8C4A" Foreground="White"/>
                    <Button x:Name="SystemInformerBtn" Height="52" Margin="0,6" FontSize="15" FontWeight="Bold" Content="System Informer" Background="#1E8C4A" Foreground="White"/>
                </StackPanel>
            </Grid>

            <!-- Console -->
            <Border Grid.Row="1" Grid.ColumnSpan="2" VerticalAlignment="Bottom" Height="155" Background="#041F10" BorderBrush="#1E8C4A" BorderThickness="0,1,0,0">
                <Grid Margin="30,12">
                    <TextBlock Text="ACTIVITY CONSOLE" FontSize="9" FontWeight="Bold" Foreground="#6BFF9E" Margin="0,0,0,6"/>
                    <TextBox x:Name="ConsoleBox" Background="Transparent" Foreground="#A0E8C0" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" BorderThickness="0"/>
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
$PrefetchBtn = $window.FindName("PrefetchBtn")
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
$CheesyBtn.Add_Click({ Write-Console "CheesySS Tools starten..."; Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')" ' })
$TeslaBtn.Add_Click({ Write-Console "TeslaPro Tools starten..."; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"' })
$PrefetchBtn.Add_Click({ Write-Console "Prefetch map geopend..."; Start-Process explorer.exe -ArgumentList "C:\Windows\Prefetch" })
$ProcessHackerBtn.Add_Click({ Write-Console "Process Hacker geopend..."; Start-Process "https://processhacker.sourceforge.io/downloads.php" })
$AnyDeskBtn.Add_Click({ Write-Console "AnyDesk geopend..."; Start-Process "https://anydesk.com/nl/downloads" })
$SystemInformerBtn.Add_Click({ Write-Console "System Informer geopend..."; Start-Process "https://systeminformer.com/canary" })

$CloseBtn.Add_Click({ $window.Close() })
$OpenFolderBtn.Add_Click({ explorer . })
$ClearBtn.Add_Click({ Write-Console "Download map gewist." })
$OpenCmdBtn.Add_Click({ Start-Process cmd.exe })

Write-Console "GuiSS Tools Launcher gestart."
$window.ShowDialog() | Out-Null
