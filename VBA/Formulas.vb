

'Simple concatenate formula
ActiveCell.formula = "=CONCATENATE(" & "D" & ActiveCell.row & "," & """ Test text """ & "," & "D" & ActiveCell.Offset(-1, 0).row & ")"
            
Sub Sumif()

Dim lol As String
Dim ws As Worksheet
Dim ws2 As Worksheet
Dim dbe As Error

Set ws = Sheets("Sheet1")
Set ws2 = Sheets("Sheet2")

'Range("A" & (ActiveCell.Row)).Select
'ActiveCell.Formula = Application.SumIfs(ws.Range("A:A"), ws.Range("E:E"), ws2.Range("B" & (ActiveCell.Row)), ws.Range("F:F"), ws2.Range("A" & (ActiveCell.Row)))



'Practice
'ActiveCell.Formula = "=Sumifs(" & "A:A" & ", " & "F:F" & ", " & "G5" & ")"  'WORKS
'ActiveCell.Formula = "=Sumifs(" & "Sheet2!" & "A:A" & ", " & "Sheet2!" & "F:F" & ", " & "Sheet2!" & "G5" & ")"  'WORKS


'Working - Long version
'ActiveCell.Formula = "=Sumifs(" & "Sheet1!" & "A:A" & ", " & "Sheet1!" & "E:E" & ", " & "Sheet2!" & "B" & ActiveCell.Row & ", " & "Sheet1!" & "F:F" & ", " & "Sheet2!" & "A" & ActiveCell.Row & ")"


'Working Short Version

'ActiveCell.Formula = "=Sumifs(" & "Sheet1!" & "A:A" & ", " & _
'"Sheet1!" & "E:E" & ", " & "Sheet2!" & "B" & ActiveCell.Row & _
'", " & "Sheet1!" & "F:F" & ", " & "Sheet2!" & "A" & ActiveCell.Row & ")"


ActiveCell.Formula = "=Vlookup(" & "Sheet2!" & "A" & ActiveCell.Row & _
", " & "Sheet1!" & "F:H" & ", " & "3" & ", " & "False" & ")"


End Sub
