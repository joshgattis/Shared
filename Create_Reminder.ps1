$objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon

$objNotifyIcon.Icon = [System.Drawing.SystemIcons]::Information
$objNotifyIcon.BalloonTipIcon = "Info" 
$objNotifyIcon.BalloonTipText = "Reminder, your admin session will end at 9:30 AM. Please finish up and close all work before this time." 
$objNotifyIcon.BalloonTipTitle = "Admin Session Ending Soon"
$objNotifyIcon.Visible = $True

$objNotifyIcon.ShowBalloonTip(10000)
