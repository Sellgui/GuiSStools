# ================================================
#   GuiSS Tools Launcher - Donker Groen + Tesla Style
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
    Width="1180" Height="760"
    WindowStartupLocation="CenterScreen"
    ResizeMode="NoResize"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    FontFamily="Segoe UI">

    <Border Background="#0F1A14" CornerRadius="12" BorderBrush="#1E8C4A" BorderThickness="2">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="50"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Top Bar -->
            <Border Grid.Row="0" Background="#1A2A22" CornerRadius="12,12,0,0">
                <Grid>
                    <TextBlock Text="GuiSS Tools Launcher" Margin="30,0,0,0" VerticalAlignment="Center" FontSize="16" FontWeight="SemiBold" Foreground="#A8FFCC"/>
                    <Button x:Name="CloseBtn" Content="✕" Width="40" Height="35" HorizontalAlignment="Right" Background="Transparent" Foreground="#A8FFCC" BorderThickness="0" Margin="0,0,20,0" FontSize="18"/>
                </Grid>
            </Border>

            <Grid Grid.Row="1" Margin="25">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="280"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Control Center Sidebar -->
                <Border Grid.Column="0" Background="#1A2A22" CornerRadius="8" Padding="15">
                    <StackPanel>
                        <TextBlock Text="Control Center" FontSize="18" FontWeight="SemiBold" Foreground="#A8FFCC" Margin="0,0,0,20"/>
                        
                        <Button x:Name="CheesyBtn" Height="55" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="15" FontWeight="Bold" Content="Start CheesySS Tools"/>
                        <Button x:Name="TeslaBtn" Height="55" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="15" FontWeight="Bold" Content="Start TeslaPro SS Tools"/>
                        <Button x:Name="PrefetchBtn" Height="55" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="15" FontWeight="Bold" Content="Open Prefetch"/>
                        <Button x:Name="ProcessHackerBtn" Height="55" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="15" FontWeight="Bold" Content="Process Hacker"/>
                        <Button x:Name="AnyDeskBtn" Height="55" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="15" FontWeight="Bold" Content="AnyDesk"/>
                        <Button x:Name="SystemInformerBtn" Height="55" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="15" FontWeight="Bold" Content="System Informer"/>
                        
                        <Separator Margin="0,20" Background="#2E4A3A"/>
                        
                        <Button x:Name="OpenFolderBtn" Height="45" Margin="0,6" Background="#2E5C4A" Foreground="White" Content="Open Install Folder"/>
                        <Button x:Name="ClearBtn" Height="45" Margin="0,6" Background="#2E5C4A" Foreground="White" Content="Clear Downloaded Files"/>
                        <Button x:Name="OpenCmdBtn" Height="45" Margin="0,6" Background="#2E5C4A" Foreground="White" Content="Open CMD"/>
                    </StackPanel>
                </Border>

                <!-- Main Content -->
                <Border Grid.Column="1" Margin="20,0,0,0" Background="#1A2A22" CornerRadius="8" Padding="25">
                    <StackPanel>
                        <TextBlock Text="Ready" FontSize="26" FontWeight="SemiBold" Foreground="#A8FFCC"/>
                        <TextBlock Text="Select a tool to launch" FontSize="13" Foreground="#8CFFBB" Margin="0,5,0,30"/>

                        <Border Background="#0F1A14" CornerRadius="8" Padding="20" Margin="0,0,0,20">
                            <TextBlock Text="The toolkit is ready. Choose an option from the left." FontSize="14" Foreground="#A8FFCC" TextWrapping="Wrap"/>
                        </Border>

                        <!-- Console -->
                        <Border Background="#0A140F" CornerRadius="8" Padding="15">
                            <Grid>
                                <TextBlock Text="Activity Console" FontSize="11" FontWeight="Bold" Foreground="#6BFF9E" Margin="0,0,0,8"/>
                                <TextBox x:Name="ConsoleBox" Height="220" Background="Transparent" Foreground="#A0E8C0" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" BorderThickness="0"/>
                            </Grid>
                        </Border>
                    </StackPanel>
                </Border>
            </Grid>
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

# Knop acties
$CheesyBtn.Add_Click({ Write-Console "CheesySS Tools starten..."; Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')" ' })
$TeslaBtn.Add_Click({ Write-Console "TeslaPro Tools starten..."; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"' })

$PrefetchBtn.Add_Click({ Write-Console "Prefetch geopend..."; Start-Process "https://github.com/Orbdiff/PrefetchView/releases/latest" })
$ProcessHackerBtn.Add_Click({ Write-Console "Process Hacker (nieuwste) geopend..."; Start-Process "https://processhacker.sourceforge.io/downloads.php" })
$AnyDeskBtn.Add_Click({ Write-Console "AnyDesk geopend..."; Start-Process "https://anydesk.com/nl/downloads" })
$SystemInformerBtn.Add_Click({ Write-Console "System Informer (Canary) geopend..."; Start-Process "https://systeminformer.com/canary" })

$CloseBtn.Add_Click({ $window.Close() })
$OpenFolderBtn.Add_Click({ explorer . })
$ClearBtn.Add_Click({ Write-Console "Download map gewist (nog niet volledig)." })
$OpenCmdBtn.Add_Click({ Start-Process cmd.exe })

Write-Console "GuiSS Tools Launcher gestart."
$window.ShowDialog() | Out-Null
