# ================================================
#   GuiSS Tools Launcher - TeslaPro Style (aangepast)
# ================================================

[CmdletBinding()]
param([switch]$SelfTest)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ($PSVersionTable.PSVersion.Major -lt 5) {
    throw "GuiSS Tools requires Windows PowerShell 5.1 or newer."
}

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

        <LinearGradientBrush x:Key="PrimaryGradientBrush" StartPoint="0,0" EndPoint="1,1">
            <GradientStop Color="#34D399" Offset="0"/>
            <GradientStop Color="#1E8C4A" Offset="1"/>
        </LinearGradientBrush>
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
                    <Border Width="32" Height="32" CornerRadius="8" Background="{DynamicResource PrimaryGradientBrush}">
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
                    <TextBlock Text="Control Center" FontSize="18" FontWeight="SemiBold" Foreground="#A8FFCC" Margin="0,0,0,20"/>
                    <TextBlock Text="Launch your tools easily." FontSize="12" Foreground="#8CFFBB" Margin="0,0,0,25"/>

                    <Button x:Name="CheesyBtn" Height="48" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Start CheesySS Tools"/>
                    <Button x:Name="TeslaBtn" Height="48" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Start TeslaPro SS Tools"/>
                    <Button x:Name="PrefetchBtn" Height="48" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Open Prefetch"/>
                    <Button x:Name="ProcessHackerBtn" Height="48" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="Process Hacker"/>
                    <Button x:Name="AnyDeskBtn" Height="48" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="AnyDesk"/>
                    <Button x:Name="SystemInformerBtn" Height="48" Margin="0,6" Background="#1E8C4A" Foreground="White" FontSize="14" FontWeight="Bold" Content="System Informer"/>
                </StackPanel>
            </Border>

            <!-- Main Content -->
            <StackPanel Grid.Column="1" Margin="30,30,40,30">
                <TextBlock Text="Installed" FontSize="22" FontWeight="SemiBold" Foreground="#A8FFCC"/>
               
