Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml
Add-Type -AssemblyName System.IO.Compression.FileSystem

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$userDir   = [Environment]::GetFolderPath("UserProfile")
$downloads = Join-Path $userDir "Downloads"
$dest      = Join-Path $downloads "Guiss-Tools"
$version   = "3.3"

$announcementTitle = "New Update"
$announcementMessage = @"
There has been a new update for Guiss Tools.

Two new tools have been added to the downloaded EXE folder.

New tools added:
• Doomsday Client Finder
• Bypass EXE Finder

Thank you for using Guiss Tools.
"@

<Border CornerRadius="24" Background="#0A120F" BorderBrush="#1A2E24" BorderThickness="1">
    <Grid>
        <!-- Top Bar -->
        <Border Height="64" Background="#08100D" CornerRadius="24,24,0,0">
            <Grid Margin="20,0">
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                    <Border Width="40" Height="40" CornerRadius="12" Background="#0F1A16" BorderBrush="#2A4738" BorderThickness="1">
                        <TextBlock Text="G" FontSize="20" FontWeight="Bold" Foreground="#4ADE80" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                    </Border>
                    <StackPanel Margin="12,0,0,0">
                        <TextBlock Text="Guiss Launcher" FontSize="18" FontWeight="SemiBold" Foreground="White"/>
                        <TextBlock Text="Guiss Tools" FontSize="11" Foreground="#7E92A6"/>
                    </StackPanel>
                </StackPanel>

                <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
                    <Button x:Name="MinButton" Content="—" Width="36" Height="32" Background="Transparent" Foreground="White" BorderThickness="0"/>
                    <Button x:Name="CloseButton" Content="✕" Width="36" Height="32" Background="Transparent" Foreground="White" BorderThickness="0"/>
                </StackPanel>
            </Grid>
        </Border>

        <!-- Main Content -->
        <Grid Margin="0,70,0,20">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>           <!-- Main Content (links) -->
                <ColumnDefinition Width="20"/>          <!-- Spacer -->
                <ColumnDefinition Width="300"/>         <!-- Control Center (rechts) -->
            </Grid.ColumnDefinitions>

            <!-- Main Content (links) -->
            <Grid Grid.Column="0" Margin="20,0,0,0">
                <StackPanel>
                    <TextBlock x:Name="StatusText" Text="Ready" FontSize="28" FontWeight="SemiBold" Foreground="White"/>
                    <TextBlock x:Name="SubStatusText" Text="Everything is ready. Pick an action on the right." FontSize="14" Foreground="#9DB1C4" Margin="0,8,0,25"/>

                    <!-- Mini Stats -->
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="15"/>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="15"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <Border Grid.Column="0" Background="#0F1A16" CornerRadius="16" Padding="18" BorderBrush="#2A4738" BorderThickness="1">
                            <StackPanel>
                                <TextBlock Text="Step" FontSize="12" Foreground="#7C93A8"/>
                                <TextBlock x:Name="StepText" Text="Waiting" FontSize="20" FontWeight="SemiBold" Foreground="White" Margin="0,8,0,0"/>
                            </StackPanel>
                        </Border>

                        <Border Grid.Column="2" Background="#0F1A16" CornerRadius="16" Padding="18" BorderBrush="#2A4738" BorderThickness="1">
                            <StackPanel>
                                <TextBlock Text="Progress" FontSize="12" Foreground="#7C93A8"/>
                                <TextBlock x:Name="ProgressLabel" Text="0%" FontSize="20" FontWeight="SemiBold" Foreground="White" Margin="0,8,0,0"/>
                            </StackPanel>
                        </Border>

                        <Border Grid.Column="4" Background="#0F1A16" CornerRadius="16" Padding="18" BorderBrush="#2A4738" BorderThickness="1">
                            <StackPanel>
                                <TextBlock Text="Detected Tools" FontSize="12" Foreground="#7C93A8"/>
                                <TextBlock x:Name="ToolCountText" Text="0" FontSize="20" FontWeight="SemiBold" Foreground="White" Margin="0,8,0,0"/>
                            </StackPanel>
                        </Border>
                    </Grid>

                    <!-- Activity Console (kleiner, midden) -->
                    <Border Margin="0,25,0,0" Background="#0F1A16" CornerRadius="18" Padding="16" BorderBrush="#2A4738" BorderThickness="1">
                        <StackPanel>
                            <TextBlock Text="Activity Console" FontSize="16" FontWeight="SemiBold" Foreground="White"/>
                            <TextBox x:Name="ActivityBox" Height="220" Background="#08100D" Foreground="#D8E8F5" 
                                     FontFamily="Consolas" FontSize="13" IsReadOnly="True" 
                                     VerticalScrollBarVisibility="Auto" TextWrapping="Wrap"/>
                        </StackPanel>
                    </Border>
                </StackPanel>
            </Grid>

            <!-- Control Center (rechts) -->
            <Border Grid.Column="2" Background="#0B1118" CornerRadius="20" BorderBrush="#1A2E24" BorderThickness="1" Padding="20">
                <StackPanel>
                    <TextBlock Text="Control Center" FontSize="20" FontWeight="SemiBold" Foreground="White"/>
                    <TextBlock Text="Install, update or remove Guiss Tools" TextWrapping="Wrap" Margin="0,8,0,20" Foreground="#8EA2B6" FontSize="13"/>

                    <Button x:Name="InstallButton" Content="Install / Update Tools" Tag="&#xE898;" Style="{StaticResource ActionButtonStyle}" Background="#22C55E"/>
                    <Button x:Name="DeleteButton" Content="Remove Installed Tools" Tag="&#xE74D;" Style="{StaticResource ActionButtonStyle}" Background="#3A2028"/>
                    <Button x:Name="OpenFolderButton" Content="Open Install Folder" Tag="&#xE838;" Style="{StaticResource ActionButtonStyle}"/>
                    <Button x:Name="ExitButton" Content="Exit Launcher" Tag="&#xE8BB;" Style="{StaticResource ActionButtonStyle}"/>
                </StackPanel>
            </Border>
        </Grid>
    </Grid>
</Border>

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
$StepText         = $window.FindName("StepText")
$ProgressLabel    = $window.FindName("ProgressLabel")
$ToolCountText    = $window.FindName("ToolCountText")
$ActivityBox      = $window.FindName("ActivityBox")

# Button actions (basic)
$CloseButton.Add_Click({ $window.Close() })
$MinButton.Add_Click({ $window.WindowState = "Minimized" })
$ExitButton.Add_Click({ $window.Close() })

$InstallButton.Add_Click({
    $ActivityBox.AppendText("`n[$(Get-Date -Format HH:mm:ss)] Starting Guiss Tools installation...`n")
})

$DeleteButton.Add_Click({
    $ActivityBox.AppendText("`n[$(Get-Date -Format HH:mm:ss)] Removing Guiss Tools...`n")
})

$OpenFolderButton.Add_Click({
    if (Test-Path $dest) { Start-Process $dest }
})

$window.ShowDialog() | Out-Null
