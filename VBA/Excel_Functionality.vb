'Pivot tables'
    ActiveWorkbook.PivotCaches.Create(SourceType:=xlDatabase, SourceData:= _
        "Test!R1C1:R1048576C57", Version:=xlPivotTableVersion14).CreatePivotTable _
        TableDestination:="TestNew!R1C1", TableName:="PivotTable2", DefaultVersion _
        :=xlPivotTableVersion14

'Pivot fields customization
    ActiveSheet.PivotTables("PivotTable2").AddDataField ActiveSheet.PivotTables( _
        "PivotTable2").PivotFields("test"), "Count of test", xlCount
        
    With ActiveSheet.PivotTables("PivotTable2").PivotFields( _
        "test")
        .Caption = "Max of test"
        .Function = xlMax
    End With
    
    With ActiveSheet.PivotTables("PivotTable2")
        .ColumnGrand = False
        .RowGrand = False
    End With
    
    With ActiveSheet.PivotTables("PivotTable2").PivotFields("TestField1")
        .Orientation = xlRowField
        .Position = 3
    End With
    With ActiveSheet.PivotTables("PivotTable2").PivotFields("TestField1")
        .Orientation = xlColumnField
        .Position = 1
    End With

'Pivot table refresh
ActiveSheet.PivotTables("PivotTable5").PivotFields("TAB").ClearAllFilters
ActiveSheet.PivotTables("PivotTable5").PivotCache.Refresh

'Pivot Field Sort
ActiveSheet.PivotTables("PivotTable5").PivotFields("TestField2"). _
AutoSort xlAscending, "TestField2"


'Find and replace
‘Excel find and replace for each cell in a range


 For Each cell In Range("AD2:AD9999").CurrentRegion
            cell.Cells.Replace What:="%1", Replacement:="%", _
            LookAt:=xlPart, SearchOrder:=xlByRows, MatchCase:=False, _
            SearchFormat:=False, ReplaceFormat:=False
 Next cell

 
 