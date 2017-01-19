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


'===========================================================
'Query a Database with SQL
Sub GetDataFromADO()
    'Declare variables'
    Dim i As Integer
    
    Set objMyConn = New ADODB.Connection
    Set objMyCmd = New ADODB.Command
    Set objMyRecordset = New ADODB.Recordset
        Dim strSQL As String

    'Open Connection'
        'objMyConn.ConnectionString = "Provider=SQLOLEDB;Data Source=localhost;Initial Catalog=MyDatabase;User ID=abc;Password=abc;"
        objMyConn.ConnectionString = "DSN=dsn;UID=user_id;pwd=pwd;DBQ=dsn;DBA=W;APA=T;EXC=F;FEN=T;QTO=F;FRC=10;FDL=10;LOB=T;RST=T;BTD=F;BNF=F;BAM=IfAllSuccessful;NUM=NLS;DPM=F;MTS=T;MDI=F;CSR=F;FWC=F;FBS=64000;TLO=O;MLD=0;ODA=F;"
        objMyConn.Open

    '====================================================================
    'Q.PopEXp
    Sheets("Q.PopCount").Select
    '==================================================================
    'Set and Excecute SQL Command'
        strSQL = "SELECT DISTINCT planNAme, COUNT(*) as Total FROM customer_table GROUP BY planNAme, 2 ORDER BY 2 DESC;"

    'Open Recordset'
        Set objMyCmd.ActiveConnection = objMyConn
        objMyCmd.CommandText = strSQL
        objMyCmd.CommandType = adCmdText
        objMyCmd.Execute
                        
        Set objMyRecordset.ActiveConnection = objMyConn
        objMyRecordset.Open objMyCmd
        
     For i = 0 To objMyRecordset.Fields.Count - 1
         ActiveSheet.Cells(1, i + 1) = objMyRecordset.Fields(i).Name
     Next i
     
    'Copy Data to Excel'
        ActiveSheet.Range("A2").CopyFromRecordset (objMyRecordset)
    
    objMyConn.Close
    Set objMyConn = Nothing
    
    'objMyRecordset.Close
    Set objMyRecordset = Nothing


