'Excel find function
folder = Cells.Find(What:="Folder", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(0, 1).Value
    Debug.Print folder

filename = Cells.Find(What:="FileName", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(0, 1).Value
    Debug.Print filename

	

'clear filters from Excel table
If ActiveSheet.ListObjects("TBL_test").ShowAutoFilter Then
    ActiveSheet.ListObjects("TBL_test").Range.AutoFilter
End If

'Unhide columns
        Selection.Columns.AutoFit
        Selection.EntireColumn.Hidden = False

'Set lastrow
With Sheets("test")
    lastrow = .Cells(.rows.count, "C").End(xlUp).row
End With

'Set LastCol
With ActiveSheet
     lastcol = ActiveSheet.UsedRange.Columns.count
End With

'Select sheet's entire range
'Select Activesheet Range
Set rng = Range(Cells(1, 1), Cells(lastrow, lastcol))

'fillDown cells
fr = ActiveCell.row
cl = ActiveCell.Column
'lr = Cells(rows.Count, cl).End(xlUp).Row
Range(Cells(fr, cl), Cells(lastrow, cl)).FillDown


'Filtering and copying cells   '#Filter
    
Worksheets("test").Range("A1").AutoFilter _
Field:=7, _
Criteria1:=Pop, _
VisibleDropDown:=True

Worksheets("test").Range("A1").AutoFilter _
Field:=12, _
Criteria1:=tdsp, _
VisibleDropDown:=True

With Sheets("test")
	lastrow = .Cells(.rows.count, "B").End(xlUp).row
End With

'Set Visible Range for Copy
Set copyrange = Sheets("test").Range("A3:P" & lastrow)

copyrange.SpecialCells(xlCellTypeVisible).Copy


