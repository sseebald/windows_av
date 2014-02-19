class windows_av 
{

  reboot {'before':
    when => pending,
  }

  file {'C:\mseinstall.exe':
    ensure => present,
    mode   => 0777,
    source => 'puppet:///modules/windows_av/mseinstall.exe',
  }

  package {'Microsoft Security Essentials':
    ensure          => installed,
    source          => 'C:\mseinstall.exe',
    install_options => ['/s','/runwgacheck'],
    notify          => Reboot['after'],
  }

  reboot {'after':
    apply => finished,
  }

  registry::value {'MSE Schedule Day':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => 'ScheduleDay',
    type  => dword,
    data  => 3,
    notify => Service['MsMpSvc'],
 }

  registry::value {'MSE Schedule Time':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => ScheduleTime,
    type  => dword,
    data  => 0,
    notify => Service['MsMpSvc'],
 }

  registry::value {'MSE File and Prog Activity':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Real-Time Protection',
    value => DisableIOAVProtection,
    type  => dword,
    data  => 0,
    notify => Service['MsMpSvc'],
 }
 
  registry::value {'Scan all downloaded files and attachments':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Real-Time Protection',
    value => DisableOnAccessProtection,
    type  => dword,
    data  => 0,
    notify => Service['MsMpSvc'],
 }

  registry::value {'Scan all removable drives':
    key    => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value  => DisableRemovableDriveScanning,
    type   => dword,
    data   => 0,
    notify => Service['MsMpSvc'],
  }

  service {'MsMpSvc':
    ensure    => running,
  }

}

