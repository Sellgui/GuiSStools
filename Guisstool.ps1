Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml
Add-Type -AssemblyName System.IO.Compression.FileSystem

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# ==================== CONFIG ====================
$userDir   = [Environment]::GetFolderPath("UserProfile")
$downloads = Join-Path $userDir "Downloads"
$dest      = Join-Path $downloads "Guiss-Tools"
$version   = "3.3"

$announcementTitle = "New Update"
$announcementMessage = @"
There has been a new update for Guiss Tools.

Two new tools have been added. You can get them by pressing the green Install / Update Tools button.

New tools added:
• Doomsday Client Finder
• Bypass EXE Finder

Thank you for using Guiss Tools.
"@

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Guiss Launcher"
    Width="1320"
    Height="830"
    MinWidth="1320"
    MinHeight="830"
    WindowStartupLocation="CenterScreen"
    ResizeMode="NoResize"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    FontFamily="Segoe UI">

    <Window.Resources>
        <!-- Groene kleuren -->
        <LinearGradientBrush x:Key="PrimaryButtonBrush" StartPoint="0,0" EndPoint="1,1">
            <GradientStop Color="#22C55E" Offset="0"/>
            <GradientStop Color="#16A34A" Offset="1"/>
        </LinearGradientBrush>

        <LinearGradientBrush x:Key="DangerButtonBrush" StartPoint="0,0" EndPoint="1,1">
            <GradientStop Color="#3A2028" Offset="0"/>
            <GradientStop Color="#24151A" Offset="1"/>
        </LinearGradientBrush>

        <LinearGradientBrush x:Key="NeutralButtonBrush" StartPoint="0,0" EndPoint="1,1">
            <GradientStop Color="#182332" Offset="0"/>
            <GradientStop Color="#141C27" Offset="1"/>
        </LinearGradientBrush>

        <LinearGradientBrush x:Key="CardBackground" StartPoint="0,0" EndPoint="1,1">
            <GradientStop Color="#101824" Offset="0"/>
            <GradientStop Color="#0B1017" Offset="1"/>
        </LinearGradientBrush>

        <SolidColorBrush x:Key="BorderBrushSoft" Color="#1C2A3C"/>

        <Style x:Key="ActionButtonStyle" TargetType="Button">
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontSize" Value="15"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="Height" Value="56"/>
            <Setter Property="Margin" Value="0,0,0,14"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Background" Value="{StaticResource NeutralButtonBrush}"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="Root" Background="{TemplateBinding Background}" CornerRadius="17" BorderBrush="#203040" BorderThickness="1">
                            <Border.Effect>
                                <DropShadowEffect BlurRadius="18" ShadowDepth="0" Opacity="0.22"/>
                            </Border.Effect>
                            <Grid Margin="16,0,16,0">
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="Auto"/>
                                    <ColumnDefinition Width="12"/>
                                    <ColumnDefinition Width="*"/>
                                </Grid.ColumnDefinitions>
                                <Border Width="36" Height="36" CornerRadius="11" Background="#18FFFFFF" BorderBrush="#24FFFFFF" BorderThickness="1" VerticalAlignment="Center">
                                    <TextBlock Text="{TemplateBinding Tag}" FontFamily="Segoe MDL2 Assets" FontSize="15" Foreground="White" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                </Border>
                                <ContentPresenter Grid.Column="2" VerticalAlignment="Center"/>
                            </Grid>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="Root" Property="BorderBrush" Value="#4ADE80"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <Border CornerRadius="24" Background="#05070B" BorderBrush="#1D2938" BorderThickness="1">
        <Grid>
            <!-- Top Bar -->
            <Border Height="64" Background="#0A0F17" CornerRadius="24,24,0,0">
                <Grid Margin="20,0">
                    <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                        <Border Width="40" Height="40" CornerRadius="12" Background="#101A27" BorderBrush="#23435D" BorderThickness="1">
                            <TextBlock Text="G" FontSize="22" FontWeight="Bold" Foreground="#4ADE80" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <StackPanel Margin="12,0,0,0">
                            <TextBlock Text="Guiss Launcher" FontSize="20" FontWeight="SemiBold" Foreground="White"/>
                            <TextBlock Text="Guiss Tools" FontSize="12" Foreground="#7E92A6"/>
                        </StackPanel>
                    </StackPanel>

                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
                        <Button x:Name="MinButton" Content="—" Width="36" Height="32" Background="Transparent" Foreground="White" BorderThickness="0"/>
                        <Button x:Name="CloseButton" Content="✕" Width="36" Height="32" Background="Transparent" Foreground="White" BorderThickness="0"/>
                    </StackPanel>
                </Grid>
            </Border>

            <!-- Main Content -->
            <Grid Margin="0,70,0,0">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="320"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Sidebar -->
                <Border Background="#0B1118" Margin="20,0,10,20" CornerRadius="20">
                    <StackPanel Margin="20">
                        <TextBlock Text="Control Center" FontSize="22" FontWeight="SemiBold" Foreground="White" Margin="0,0,0,20"/>

                        <Button x:Name="InstallButton" Content="Install / Update Tools" Tag="&#xE898;" Style="{StaticResource ActionButtonStyle}" Background="{StaticResource PrimaryButtonBrush}"/>
                        <Button x:Name="DeleteButton" Content="Remove Installed Tools" Tag="&#xE74D;" Style="{StaticResource ActionButtonStyle}" Background="{StaticResource DangerButtonBrush}"/>
                        <Button x:Name="OpenFolderButton" Content="Open Install Folder" Tag="&#xE838;" Style="{StaticResource ActionButtonStyle}"/>
                        <Button x:Name="ExitButton" Content="Exit" Tag="&#xE8BB;" Style="{StaticResource ActionButtonStyle}"/>
                    </StackPanel>
                </Border>

                <!-- Main Area -->
                <Grid Grid.Column="1" Margin="10,0,20,20">
                    <StackPanel>
                        <TextBlock x:Name="StatusText" Text="Ready" FontSize="28" FontWeight="SemiBold" Foreground="White"/>
                        <TextBlock x:Name="SubStatusText" Text="Everything is ready. Pick an action on the left." FontSize="14" Foreground="#9DB1C4" Margin="0,8,0,20"/>

                        <Border Background="#101824" CornerRadius="16" Padding="20" BorderBrush="#1C2A3C" BorderThickness="1">
                            <StackPanel>
                                <TextBlock Text="Activity Console" FontSize="18" FontWeight="SemiBold" Foreground="White"/>
                                <TextBox x:Name="ActivityBox" Height="280" Background="#0B1118" Foreground="#D8E8F5" 
                                         FontFamily="Consolas" FontSize="13" IsReadOnly="True" 
                                         VerticalScrollBarVisibility="Auto" TextWrapping="Wrap"/>
                            </StackPanel>
                        </Border>
                    </StackPanel>
                </Grid>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Find controls
$CloseButton      = $window.FindName("CloseButton")
$MinButton        = $window.FindName("MinButton")
$InstallButton    = $window.FindName("InstallButton")
$DeleteButton     = $window.FindName("DeleteButton")
$OpenFolderButton = $window.FindName("OpenFolderButton")
$ExitButton       = $window.FindName("ExitButton")
$StatusText       = $window.FindName("StatusText")
$SubStatusText    = $window.FindName("SubStatusText")
$ActivityBox      = $window.FindName("ActivityBox")

# Button actions
$CloseButton.Add_Click({ $window.Close() })
$MinButton.Add_Click({ $window.WindowState = "Minimized" })
$ExitButton.Add_Click({ $window.Close() })

$InstallButton.Add_Click({
    $ActivityBox.AppendText("`n[$(Get-Date -Format HH:mm:ss)] Starting install...`n")
    # Hier kun je later de install logica toevoegen
})

$DeleteButton.Add_Click({
    $ActivityBox.AppendText("`n[$(Get-Date -Format HH:mm:ss)] Removing tools...`n")
    # Hier kun je later de remove logica toevoegen
})

$OpenFolderButton.Add_Click({
    if (Test-Path $dest) {
        Start-Process $dest
    } else {
        [System.Windows.MessageBox]::Show("Install folder does not exist yet.", "Guiss Tools")
    }
})

$window.ShowDialog() | Out-Null
