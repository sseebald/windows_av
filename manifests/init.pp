class windows_av 
{

  file {'C:\mseinstall.exe':
    ensure => present,
    mode   => 0777,
    source => 'puppet:///modules/windows_av/mseinstall.exe',
  }

  package {'mseinstall':
    ensure          => installed,
    source          => 'C:\mseinstall.exe',
    install_options => ['/s','/runwgacheck'],
    notify          => Reboot['after'],
  }

  reboot {'after':}

  registry::value {'MSE Schedule Day':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => 'ScheduleDay',
    type  => REG_DWORD,
    data  => 3,
  }

  registry::value {'MSE Schedule Time':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => ScheduleTime,
    type  => REG_DWORD,
    data  => 0,
  }

  registry::value {'MSE File and Prog Activity':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Real-Time Protection',
    value => DisableIOAVProtection,
    type  => REG_DWORD,
    data  => 0,
  }
 
  registry::value {'Scan all downloaded files and attachments':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Real-Time Protection',
    value => DisableOnAccessProtection,
    type  => REG_DWORD,
    data  => 0
    ,
  }

  registry::value {'Scan all removable drives':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => DisableRemovableDriveScanning,
    type  => REG_DWORD,
    data  => 0,
  }

}

