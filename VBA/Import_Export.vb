'Exporting worksheets, Querying/Connecting to Databases, Querying Spreadsheets
'======================================================



'Save WS AS CSV into a directory
'======================================================
Sub Button6_Click()

Dim wb As Workbook
'CTRL+R
On Error GoTo ErrorHandler

    'ActiveSheet.Name = InputBox("Please Enter the Name of the Worksheet")
    With Sheets("test")
        .Copy
        'change root save dir below
    End With
    For Each wb In Application.Workbooks
        If wb.Name Like "Book*" Then wb.Activate: Exit For
    Next wb
    With wb
        
        '.SaveAs Filename:="C:\Users\path" & UniqueName & ".csv", FileFormat:=xlCSV
        .SaveAs Filename:="\\path\test.csv", FileFormat:=xlCSV
        
        '.Close savechanges:=False
ErrorHandler:
        Exit Sub
    End With

End Sub

'===========================================================
'Open a workbook
Directory = "test\path\"
    Debug.Print Directory

directorybase = Directory & folder & "\" & filename
    Debug.Print directorybase

Workbooks.Open filename:=directorybase, _
    UpdateLinks:=False


'===========================================================
'Query a Workbook with SQL
Dim conn As String
Dim mysql As String
Dim QT As QueryTabe
Dim ws As Worksheet

'Define connection string
conn = "ODBC;DSN=Excel Files;DBQ=\\test\2016\" & filename & ".xlsm;"

'SET SQL for QUERY 1 (SUMMARY DETAILS)---------------------------------------------------------
        mysql = "SELECT * FROM [Summary$B2:S78]"
        Debug.Print mysql
        
        Set ws = Worksheets("Import")

'RESET QUERY RANGE TABLE
        ws.Cells.ClearContents
        ws.Cells.Delete
        
'ADD QUERY RANGE TABLE and bring in data
        Set QT = ws.QueryTables.Add(conn, ws.Range("A1"), mysql)
        'QT.FieldNames = False
        QT.Refresh
        
'WAIT FOR FINISH
        DoEvents
        Application.CalculateUntilAsyncQueriesDone


'Excel Web Queries
Sheets("WebQCImport").Activate
            Cells.Clear
            
            URL = "URL;https://test"
            URL = URL & ".com"
                Debug.Print URL
            
            
            With ActiveSheet.QueryTables.Add(Connection:=URL, _
                Destination:=Range("$A$1"))
                .Name = _
                "name of query"
                .FieldNames = True
                .RowNumbers = False
                .FillAdjacentFormulas = False
                .PreserveFormatting = True
                .RefreshOnFileOpen = False
                .BackgroundQuery = True
                .RefreshStyle = xlInsertDeleteCells
                .SavePassword = False
                .SaveData = True
                .AdjustColumnWidth = True
                .RefreshPeriod = 0
                .WebSelectionType = xlEntirePage
                .WebFormatting = xlWebFormattingNone
                .WebPreFormattedTextToColumns = True
                .WebConsecutiveDelimitersAsOne = True
                .WebSingleBlockTextImport = False
                .WebDisableDateRecognition = False
                .WebDisableRedirections = False
                .Refresh BackgroundQuery:=False
            End With
            

‘Remove external data connections


    For i = ActiveWorkbook.Connections.Count To 1 Step -1
        ActiveWorkbook.Connections.Item(i).Delete
    Next i




