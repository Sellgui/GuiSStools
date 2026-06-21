Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# ==================== CONFIG ====================
$dest    = Join-Path $env:USERPROFILE "Downloads\Guiss-Tools"
$version = "3.3"

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Guiss Launcher" Width="900" Height="600"
        WindowStartupLocation="CenterScreen" ResizeMode="NoResize"
        WindowStyle="None" AllowsTransparency="True" Background="Transparent">

    <Window.Resources>
        <LinearGradientBrush x:Key="PrimaryGreen" StartPoint="0,0" EndPoint="1,1">
            <GradientStop Color="#22C55E" Offset="0"/>
            <GradientStop Color="#16A34A" Offset="1"/>
        </LinearGradientBrush>
        
        <SolidColorBrush x:Key="DarkBg" Color="#0B1118"/>
        <SolidColorBrush x:Key="CardBg" Color="#101824"/>
    </Window.Resources>

    <Border CornerRadius="20" Background="{StaticResource DarkBg}" BorderBrush="#1C2A3C" BorderThickness="1">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="60"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Background="#0A0F17" CornerRadius="20,20,0,0">
                <Grid>
                    <StackPanel Orientation="Horizontal" VerticalAlignment="Center" Margin="20,0">
                        <TextBlock Text="G" FontSize="24" FontWeight="Bold" Foreground="#4ADE80" VerticalAlignment="Center"/>
                        <TextBlock Text="  Guiss Launcher" FontSize="20" FontWeight="SemiBold" Foreground="White" VerticalAlignment="Center"/>
                    </StackPanel>
                    
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center" Margin="0,0,15,0">
                        <Button x:Name="MinBtn" Content="—" Width="40" Height="30" Background="Transparent" Foreground="White" BorderThickness="0"/>
                        <Button x:Name="CloseBtn" Content="✕" Width="40" Height="30" Background="Transparent" Foreground="White" BorderThickness="0"/>
                    </StackPanel>
                </Grid>
            </Border>

            <!-- Main Content -->
            <Grid Grid.Row="1" Margin="30">
                <StackPanel>
                    <TextBlock Text="Guiss Tools" FontSize="32" FontWeight="Bold" Foreground="White"/>
                    <TextBlock Text="Professional Macro &amp; Screenshare Detection Toolkit" 
                               FontSize="16" Foreground="#7E92A6" Margin="0,8,0,30"/>

                    <Button x:Name="InstallBtn" Content="Install / Update Guiss Tools" 
                            Height="55" Background="{StaticResource PrimaryGreen}" 
                            Foreground="White" FontSize="16" FontWeight="SemiBold"
                            Margin="0,0,0,15"/>

                    <Button x:Name="RemoveBtn" Content="Remove Installed Tools" 
                            Height="50" Background="#3A2028" Foreground="White" 
                            FontSize="15" Margin="0,0,0,15"/>

                    <Button x:Name="OpenFolderBtn" Content="Open Install Folder" 
                            Height="45" Background="#182332" Foreground="White" 
                            FontSize="15"/>
                </StackPanel>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Find controls
$CloseBtn     = $window.FindName("CloseBtn")
$MinBtn       = $window.FindName("MinBtn")
$InstallBtn   = $window.FindName("InstallBtn")
$RemoveBtn    = $window.FindName("RemoveBtn")
$OpenFolderBtn = $window.FindName("OpenFolderBtn")

# Button actions
$CloseBtn.Add_Click({ $window.Close() })
$MinBtn.Add_Click({ $window.WindowState = "Minimized" })

$InstallBtn.Add_Click({
    [System.Windows.MessageBox]::Show("Install functie komt hier (je kunt dit later uitbreiden)", "Guiss Tools")
})

$RemoveBtn.Add_Click({
    [System.Windows.MessageBox]::Show("Remove functie komt hier", "Guiss Tools")
})

$OpenFolderBtn.Add_Click({
    if (Test-Path $dest) {
        Start-Process $dest
    } else {
        [System.Windows.MessageBox]::Show("Install folder bestaat nog niet.", "Guiss Tools")
    }
})

$window.ShowDialog() | Out-Null
