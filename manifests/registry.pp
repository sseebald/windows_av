class windows_av::registry {

  registry::value {'MSE Schedule Day':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => 'ScheduleDay',
    type  => dword,
    data  => 3,
  }

  registry::value {'MSE Schedule Time':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => ScheduleTime,
    type  => dword,
    data  => 0,
  }

  registry::value {'MSE File and Prog Activity':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Real-Time Protection',
    value => DisableIOAVProtection,
    type  => dword,
    data  => 0,
  }
 
  registry::value {'Scan all downloaded files and attachments':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Real-Time Protection',
    value => DisableOnAccessProtection,
    type  => dword,
    data  => 0,
  }

  registry::value {'Scan all removable drives':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => DisableRemovableDriveScanning,
    type  => dword,
    data  => 0,
  }

}
