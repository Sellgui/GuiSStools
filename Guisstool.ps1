# ================================================
#   GuiSS Tools Launcher - Super Simpele Stabiele Versie
# ================================================

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Xaml
Add-Type -AssemblyName System.Windows.Forms

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="GuiSS Tools Launcher"
    Width="1000" Height="650"
    WindowStartupLocation="CenterScreen"
    ResizeMode="NoResize"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    FontFamily="Segoe UI">

    <Border Background="#0A3D1F" CornerRadius="8" BorderBrush="#1E8C4A" BorderThickness="2">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="50"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Grid.Row="0" Background="#0F5C2F" CornerRadius="8,8,0,0">
                <Grid>
                    <TextBlock Text="GuiSS Tools Launcher" Margin="25,0,0,0" VerticalAlignment="Center" FontSize="15" FontWeight="SemiBold" Foreground="#C5FFDD"/>
                    <Button x:Name="CloseBtn" Content="✕" Width="40" Height="35" HorizontalAlignment="Right" Background="Transparent" Foreground="#C5FFDD" BorderThickness="0" Margin="0,0,15,0" FontSize="16"/>
                </Grid>
            </Border>

            <Grid Grid.Row="1" Margin="20">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="250"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- Sidebar -->
                <Border Grid.Column="0" Background="#0A3D1F" BorderBrush="#1E8C4A" BorderThickness="0,0,1,0" Padding="15">
                    <StackPanel>
                        <TextBlock Text="GuiSS Tools" FontSize="20" FontWeight="Bold" Foreground="#A8FFCC" Margin="0,0,0,20"/>
                        
                        <Button x:Name="OpenFolderBtn" Content=" Open Install Folder" Height="35" Background="#1E8C4A" Foreground="White" Margin="0,4"/>
                        <Button x:Name="ClearBtn" Content=" Open Prefetch Folder" Height="35" Background="#1E8C4A" Foreground="White" Margin="0,4"/>
                        <Button x:Name="OpenCmdBtn" Content=" Open CMD" Height="35" Background="#1E8C4A" Foreground="White" Margin="0,4"/>

                        <TextBlock Text="TOOLS" FontSize="11" FontWeight="Bold" Foreground="#6BFF9E" Margin="0,25,0,10"/>

                        <Button x:Name="CheesyBtn" Height="45" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="13" FontWeight="Bold" Content="Start CheesySS Tools"/>
                        <Button x:Name="TeslaBtn" Height="45" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="13" FontWeight="Bold" Content="Start TeslaPro SS Tools"/>
                        <Button x:Name="ProcessHackerBtn" Height="45" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="13" FontWeight="Bold" Content="Process Hacker"/>
                        <Button x:Name="AnyDeskBtn" Height="45" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="13" FontWeight="Bold" Content="AnyDesk"/>
                        <Button x:Name="SystemInformerBtn" Height="45" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="13" FontWeight="Bold" Content="System Informer"/>
                    </StackPanel>
                </Border>

                <!-- Main Area -->
                <StackPanel Grid.Column="1" Margin="30,35,40,30">
                    <TextBlock Text="Ready" FontSize="26" FontWeight="SemiBold" Foreground="#C5FFDD"/>
                    <TextBlock Text="Select a tool to launch" FontSize="13" Foreground="#8CFFBB" Margin="0,5,0,30"/>
                </StackPanel>
            </Grid>

            <!-- Console -->
            <Border Grid.Row="1" Grid.ColumnSpan="2" VerticalAlignment="Bottom" Height="140" Background="#041F10" BorderBrush="#1E8C4A" BorderThickness="0,1,0,0">
                <Grid Margin="30,12">
                    <TextBlock Text="ACTIVITY CONSOLE" FontSize="9
