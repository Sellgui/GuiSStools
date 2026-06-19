# ================================================
#   GuiSS Tools Launcher - Tesla Style
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
                <RowDefinition Height="60"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Top Bar -->
            <Border Grid.Row="0" Background="#1A2A22" CornerRadius="12,12,0,0">
                <Grid>
                    <StackPanel Orientation="Horizontal" VerticalAlignment="Center" Margin="25,0,0,0">
                        <TextBlock Text="GuiSS" FontSize="18" FontWeight="Bold" Foreground="#A8FFCC"/>
                        <TextBlock Text=" Tools Launcher" FontSize="18" Foreground="#C5FFDD"/>
                    </StackPanel>
                    <Button x:Name="CloseBtn" Content="✕" Width="40" Height="35" HorizontalAlignment="Right" Background="Transparent" Foreground="#C5FFDD" BorderThickness="0" Margin="0,0,20,0" FontSize="18"/>
                </Grid>
            </Border>

            <Grid Grid.Row="1" Margin="20">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="280"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Control Center -->
                <Border Grid.Column="0" Background="#1A2A22" CornerRadius="8" Padding="15" Margin="0,0,10,0">
                    <StackPanel>
                        <TextBlock Text="Control Center" FontSize="18" FontWeight="SemiBold" Foreground="#A8FFCC" Margin="0,0,0,15"/>
                        <TextBlock Text="Install, update or remove tools from one clean window." FontSize="12" Foreground="#8CFFBB" TextWrapping="Wrap" Margin="0,0,0,20"/>

                        <Button x:Name="CheesyBtn" Height="50" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Start CheesySS Tools"/>
                        <Button x:Name="TeslaBtn" Height="50" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Start TeslaPro SS Tools"/>
                        <Button x:Name="PrefetchBtn" Height="50" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Open Prefetch"/>
                        <Button x:Name="ProcessHackerBtn" Height="50" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Process Hacker"/>
                        <Button x:Name="AnyDeskBtn" Height="50" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="AnyDesk"/>
                        <Button x:Name="SystemInformerBtn" Height="50" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="System Informer"/>
                    </StackPanel>
                </Border>

                <!-- Installed Card -->
                <StackPanel Grid.Column="1" Margin="10,0,0,0">
                    <Border Background="#1A2A22" CornerRadius="8" Padding="20" Margin="0,0,0,15">
                        <StackPanel>
                            <TextBlock Text="Installed" FontSize="18" FontWeight="SemiBold" Foreground="#A8FFCC"/>
                            <TextBlock Text="The toolkit is ready on this system." FontSize="12" Foreground="#8CFFBB" Margin="0,5,0,15"/>
                            <TextBlock Text="A cleaner launcher for your SS Tools." FontSize="12" Foreground="#6BFF9E"/>
                        </StackPanel>
                    </Border>

                    <!-- Status Cards -->
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition/>
                            <ColumnDefinition/>
                            <ColumnDefinition/>
                        </Grid.ColumnDefinitions>
                        <Border Grid.Column="0" Background="#1A2A22" CornerRadius="8" Padding="15" Margin="0,0,8,0">
                            <StackPanel>
                                <TextBlock Text="Ready" FontSize="14" Foreground="#A8FFCC"/>
                                <TextBlock Text="Current launcher task" FontSize="11" Foreground="#6BFF9E"/>
                            </StackPanel>
                        </Border>
                        <Border Grid.Column="1" Background="#1A2A22" CornerRadius="8" Padding="15" Margin="0,0,8,0">
                            <StackPanel>
                                <TextBlock Text="100%" FontSize="18" FontWeight="Bold" Foreground="#34D399"/>
                                <TextBlock Text="Overall progress" FontSize="11" Foreground="#6BFF9E"/>
                            </StackPanel>
                        </Border>
                        <Border Grid.Column="2" Background="#1A2A22" CornerRadius="8" Padding="15">
                            <StackPanel>
                                <TextBlock Text="11" FontSize="18" FontWeight="Bold" Foreground="#A8FFCC"/>
                                <TextBlock Text="Tools detected" FontSize="11" Foreground="#6BFF9E"/>
                            </StackPanel>
                        </Border>
                    </Grid>

                    <!-- Activity Console -->
                    <Border Background="#1A2A22" CornerRadius="8" Padding="15" Margin="0,15,0,0">
                        <StackPanel>
                            <TextBlock Text="Activity Console" FontSize="14" FontWeight="SemiBold" Foreground="#A8FFCC" Margin="0,0,0,8"/>
                            <TextBox x:Name="ConsoleBox" Height="220" Background="#0F1A14" Foreground="#A0E8C0" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" BorderThickness="0"/>
                        </StackPanel>
                    </Border>
                </StackPanel>
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

function Write-Console($msg) {
    $time = Get-Date -Format "HH:mm:ss"
    $ConsoleBox.Dispatcher.Invoke({
        $ConsoleBox.AppendText("[$time] $msg`r`n")
        $ConsoleBox.ScrollToEnd()
    })
}

$CheesyBtn.Add_Click({ Write-Console "CheesySS Tools starten..."; Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')" ' })
$TeslaBtn.Add_Click({ Write-Console "TeslaPro Tools starten..."; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "irm ''https://raw.githubusercontent.com/TeslaPros/TeslaPro-s-SS-Tools/main/installer.ps1'' | iex"' })
$PrefetchBtn.Add_Click({ Write-Console "Prefetch map geopend..."; Start-Process explorer.exe -ArgumentList "C:\Windows\Prefetch" })
$ProcessHackerBtn.Add_Click({ Write-Console "Process Hacker geopend..."; Start-Process "https://processhacker.sourceforge.io/downloads.php" })
$AnyDeskBtn.Add_Click({ Write-Console "AnyDesk geopend..."; Start-Process "https://anydesk.com/nl/downloads" })
$SystemInformerBtn.Add_Click({ Write-Console "System Informer geopend..."; Start-Process "https://systeminformer.com/canary" })

$CloseBtn.Add_Click({ $window.Close() })

Write-Console "GuiSS Tools Launcher gestart."
$window.ShowDialog() | Out-Null
