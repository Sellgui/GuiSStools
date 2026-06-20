# ================================================
#   GuiSS Tools Launcher - TeslaPro Style (jouw tools)
# ================================================

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml
Add-Type -AssemblyName System.Windows.Forms

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

[xml]$xaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="GuiSS Tools Launcher"
        Width="1240"
        Height="800"
        MinWidth="980"
        MinHeight="640"
        WindowStartupLocation="CenterScreen"
        WindowStyle="None"
        ResizeMode="CanResize"
        Background="#101116"
        FontFamily="Segoe UI Variable, Segoe UI"
        Foreground="#F6F7FB">

    <Window.Resources>
        <SolidColorBrush x:Key="WindowBackgroundBrush" Color="#101116"/>
        <SolidColorBrush x:Key="SidebarBrush" Color="#171922"/>
        <SolidColorBrush x:Key="ContentBrush" Color="#121823"/>
        <SolidColorBrush x:Key="PanelBrush" Color="#1D202B"/>
        <SolidColorBrush x:Key="CardBrush" Color="#252936"/>
        <SolidColorBrush x:Key="CardHoverBrush" Color="#2C3344"/>
        <SolidColorBrush x:Key="SelectedBrush" Color="#173A55"/>
        <SolidColorBrush x:Key="AccentBrush" Color="#30A4FF"/>
        <SolidColorBrush x:Key="MutedBrush" Color="#AEB6C8"/>
        <SolidColorBrush x:Key="TextBrush" Color="#F6F7FB"/>
        <SolidColorBrush x:Key="LineBrush" Color="#333A4D"/>
        <SolidColorBrush x:Key="SuccessBrush" Color="#62C370"/>
    </Window.Resources>

    <Grid Background="{DynamicResource WindowBackgroundBrush}">
        <Grid.RowDefinitions>
            <RowDefinition Height="50"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Title Bar -->
        <Border Background="#171922" BorderBrush="#333A4D" BorderThickness="0,0,0,1">
            <Grid>
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center" Margin="20,0,0,0">
                    <Border Width="32" Height="32" CornerRadius="8" Background="#30A4FF">
                        <TextBlock Text="GS" FontWeight="Bold" FontSize="16" HorizontalAlignment="Center" VerticalAlignment="Center" Foreground="#07111C"/>
                    </Border>
                    <TextBlock Text="GuiSS Tools Launcher" FontSize="18" FontWeight="SemiBold" Margin="12,0,0,0" VerticalAlignment="Center"/>
                </StackPanel>
                <Button x:Name="CloseBtn" Content="✕" Width="40" Height="32" HorizontalAlignment="Right" Background="Transparent" Foreground="#F6F7FB" BorderThickness="0" Margin="0,0,15,0" FontSize="16"/>
            </Grid>
        </Border>

        <Grid Grid.Row="1">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="280"/>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>

            <!-- Sidebar -->
            <Border Background="#171922" BorderBrush="#333A4D" BorderThickness="0,0,1,0">
                <StackPanel Margin="20">
                    <TextBlock Text="Navigation" Foreground="#8CFFBB" FontSize="12" Margin="0,0,0,10"/>
                    <Button x:Name="BtnNavHome" Content="H Home" Style="{StaticResource NavButtonStyle}" Background="#173A55"/>
                    <Button x:Name="BtnNavTools" Content="T Tools" Style="{StaticResource NavButtonStyle}"/>
                    <Button x:Name="BtnNavCommands" Content="C CMD Commands" Style="{StaticResource NavButtonStyle}"/>
                    <Button x:Name="BtnNavDownloads" Content="D Downloads" Style="{StaticResource NavButtonStyle}"/>
                    <Button x:Name="BtnNavInfo" Content="I Info" Style="{StaticResource NavButtonStyle}"/>
                    <Button x:Name="BtnNavSettings" Content="S Settings" Style="{StaticResource NavButtonStyle}"/>
                </StackPanel>
            </Border>

            <!-- Main Content -->
            <StackPanel Grid.Column="1" Margin="30,30,40,30">
                <TextBlock Text="Welcome to GuiSS Tools" FontSize="34" FontWeight="Bold"/>
                <TextBlock Text="A cleaner launcher for your SS Tools." FontSize="15" Foreground="#8CFFBB" Margin="0,8,0,30"/>

                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition/>
                        <ColumnDefinition Width="20"/>
                        <ColumnDefinition/>
                    </Grid.ColumnDefinitions>
                    <Border Background="#1D202B" CornerRadius="12" Padding="20">
                        <StackPanel>
                            <TextBlock Text="Tools" FontSize="22" FontWeight="Bold"/>
                            <TextBlock Text="Browse your SS tools" Foreground="#6BFF9E" Margin="0,4,0,0"/>
                            <Button x:Name="CheesyBtn" Content="Start CheesySS Tools" Height="48" Margin="0,16,0,8" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold"/>
                            <Button x:Name="TeslaBtn" Content="Start TeslaPro SS Tools" Height="48" Margin="0,8" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold"/>
                        </StackPanel>
                    </Border>
                    <Border Grid.Column="2" Background="#1D202B" CornerRadius="12" Padding="20">
                        <StackPanel>
                            <TextBlock Text="Extra Tools" FontSize="22" FontWeight="Bold"/>
                            <Button x:Name="PrefetchBtn" Content="Open Prefetch" Height="48" Margin="0,16,0,8" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold"/>
                            <Button x:Name="ProcessHackerBtn" Content="Process Hacker" Height="48" Margin="0,8" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold"/>
                            <Button x:Name="AnyDeskBtn" Content="AnyDesk" Height="48" Margin="0,8" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold"/>
                            <Button x:Name="SystemInformerBtn" Content="System Informer" Height="48" Margin="0,8" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold"/>
                        </StackPanel>
                    </Border>
                </Grid>

                <!-- Activity Console -->
                <Border Background="#1D202B" CornerRadius="12" Padding="18" Margin="0,25,0,0">
                    <StackPanel>
                        <TextBlock Text="Activity Console" FontSize="14" FontWeight="SemiBold" Foreground="#A8FFCC" Margin="0,0,0,10"/>
                        <TextBox x:Name="ConsoleBox" Height="220" Background="#101116" Foreground="#A0E8C0" FontFamily="Consolas" FontSize="11" IsReadOnly="True" VerticalScrollBarVisibility="Auto" BorderThickness="0"/>
                    </StackPanel>
                </Border>
            </StackPanel>
        </Grid>
    </Grid>
</Window>
'@

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
