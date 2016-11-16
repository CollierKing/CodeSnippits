Sub yelpQuery()

Dim lastrow As Long
Dim url As String
Dim qt As QueryTable

'Start from list range
Sheets("Info").Select
    Range("A2").Select
    
Sheets("List").Select
    Range("A2").Select

Do While ActiveCell.Value <> ""
        
Name = ActiveCell.Value
url = ActiveCell.Offset(0, 1).Value
        
        'url = "https://www.yelp.com/biz/zanzibar-houston-houston"
        url = "Url;" & url
            Debug.Print url
        
        Sheets("data").Select
        Cells.ClearContents
        Cells.Delete
                    
        With ActiveSheet.QueryTables.Add(Connection:=url, _
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
        
        Range("A1").Select
        
        On Error Resume Next
        'Pull Data from import
        
        Area = "NA"
        Cells.Find(What:="Get Directions", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(0, 0).Select
        
        Address = "NA"
        'Address = Cells.Find(What:="Get Directions", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(-1, 0).Value
        
        Cells.Find(What:="Get Directions", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(0, 0).Select
        Address = ActiveCell.Offset(-2, 0).Value & ". " & ActiveCell.Offset(-1, 0).Value
            Debug.Print Address
        
        Area = Cells.Find(What:="Get Directions", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(-1, 0).Value
            Debug.Print Area
            
        Rating = "NA"
        Rating = Cells.Find(What:="This business has been claimed by the owner or a representative. Learn more", After:=Range("A1"), LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(2, 0).Value
        'Rating = ActiveCell.Value
            Debug.Print Rating
        
        If Rating = "NA" Then
        Rating = Cells.Find(What:="Claim this business to view business statistics, receive messages from prospective customers, and respond to reviews.", After:=Range("A1"), LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(2, 0).Value
        'Rating = ActiveCell.Value
            Debug.Print Rating
        End If
        

        Reviews = "NA"
        Reviews = Cells.Find(What:="This business has been claimed by the owner or a representative. Learn more", After:=Range("A1"), LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(3, 0).Value
        'Reviews = ActiveCell.Offset(1, 0).Value
            Debug.Print Reviews
        'Reviews = Cells.Find(What:="*" & "star rating", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
        
        If Reviews = "NA" Then
        Reviews = Cells.Find(What:="Claim this business to view business statistics, receive messages from prospective customers, and respond to reviews.", After:=Range("A1"), LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(3, 0).Value
        'Reviews = ActiveCell.Offset(1, 0).Value
            Debug.Print Reviews
        End If
        
'        Address = "NA"
'        Address = Cells.Find(What:="Write a Review Add Photo Share , Opens a popup Bookmark , Opens a popup", After:=Range("A1"), LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
'            Debug.Print Address

        Cells.Find(What:="business info summary", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(0, 0).Select
        
        PriceRange = "NA"
        PriceRange = Cells.Find(What:="*" & "price range", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print PriceRange
        
        Reservations = "NA"
        Reservations = Cells.Find(What:="Takes Reservations", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Reservations
        
        Parking = "NA"
        Parking = Cells.Find(What:="Parking", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Parking
            
        Ages = "NA"
        Ages = Cells.Find(What:="Ages Allowed", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Ages
            
        Groups = "NA"
        Groups = Cells.Find(What:="Good for Groups", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Groups
            
        Ambience = "NA"
        Ambience = Cells.Find(What:="Ambience", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Ambience
            
        Noise = "NA"
        Noise = Cells.Find(What:="Noise Level", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Noise
        
        
        Music = "NA"
        Music = Cells.Find(What:="Music", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Music
        
        Dance = "NA"
        Dance = Cells.Find(What:="Good For Dancing", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Dance
        
        Alcohol = "NA"
        Alcohol = Cells.Find(What:="Alcohol", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Alcohol
        
        HappyHour = "NA"
        HappyHour = Cells.Find(What:="Happy Hour", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print HappyHour
        
        BestNights = "NA"
        BestNights = Cells.Find(What:="Best Nights", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print BestNights
        
        Smoking = "NA"
        Smoking = Cells.Find(What:="Smoking", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print Smoking
        
        OutDoor = "NA"
        OutDoor = Cells.Find(What:="Outdoor Seating", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print OutDoor
            
        TV = "NA"
        TV = Cells.Find(What:="Has TV", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print TV
            
        PoolTable = "NA"
        PoolTable = Cells.Find(What:="Has Pool Table", After:=ActiveCell, LookIn:=xlValues, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:=False, SearchFormat:=False).Offset(1, 0).Value
            Debug.Print PoolTable
            
        On Error GoTo 0
        'Copy Data to Info tab
        
        Sheets("info").Select
        
        Range("A" & ActiveCell.Row).Value = Name
        Range("B" & ActiveCell.Row).Value = Rating
        Range("C" & ActiveCell.Row).Value = Reviews
        Range("D" & ActiveCell.Row).Value = Area
        Range("E" & ActiveCell.Row).Value = Address
        Range("F" & ActiveCell.Row).Value = Reservations
        Range("G" & ActiveCell.Row).Value = Parking
        Range("H" & ActiveCell.Row).Value = Ages
        Range("I" & ActiveCell.Row).Value = Groups
        Range("J" & ActiveCell.Row).Value = Ambience
        Range("K" & ActiveCell.Row).Value = Noise
        Range("L" & ActiveCell.Row).Value = Music
        Range("M" & ActiveCell.Row).Value = Dance
        Range("N" & ActiveCell.Row).Value = Alcohol
        Range("O" & ActiveCell.Row).Value = HappyHour
        Range("P" & ActiveCell.Row).Value = BestNights
        Range("Q" & ActiveCell.Row).Value = Smoking
        Range("R" & ActiveCell.Row).Value = OutDoor
        Range("S" & ActiveCell.Row).Value = TV
        Range("T" & ActiveCell.Row).Value = PoolTable
        'Range("A" & ActiveCell.Row).Value = Name

        Call Delete_IE_Cache
        
        ActiveCell.Offset(1, 0).Select
        
        Sheets("List").Select
        
ActiveCell.Offset(1, 0).Select
Loop


End Sub


Sub Delete_IE_Cache()
     
    Shell "RunDll32.exe InetCpl.Cpl, ClearMyTracksByProcess 8" 'clears temporary Internet files
    'Shell "RunDll32.exe InetCpl.Cpl, ClearMyTracksByProcess 1" 'deletes history
    'Shell "RunDll32.exe InetCpl.Cpl, ClearMyTracksByProcess 2" 'deletes cookies
     
End Sub
