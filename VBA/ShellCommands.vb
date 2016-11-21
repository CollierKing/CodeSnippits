‘Clear temp internet files


Sub Delete_IE_Cache()
     
    Shell "RunDll32.exe InetCpl.Cpl, ClearMyTracksByProcess 8" 'clears temporary Internet files
    'Shell "RunDll32.exe InetCpl.Cpl, ClearMyTracksByProcess 1" 'deletes history
    'Shell "RunDll32.exe InetCpl.Cpl, ClearMyTracksByProcess 2" 'deletes cookies
     
End Sub
