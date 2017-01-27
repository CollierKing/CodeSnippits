'Programming Structures
'Loops, IF statements, Case expressions

'Loops
'Loop until reach next visible/unfiltered row
'Good for navigating filtered rows
Do Until ActiveCell.EntireRow.Hidden = False
	ActiveCell.Offset(1, 0).Select
Loop


'If Statements
If Not ActiveCell.value Like "target value" Then
	ActiveCell.offset(1,0).Select

'Case Expressions
Do While ActiveCell.Value <> ""

    Select Case ActiveCell.Value
        Case Is = "test1"
            ‘Do stuff

        Case Is = "test2"
            ‘Do other stuff

    End Select

    ActiveCell.Offset(1, 0).Select

Loop

'For Loop Example'

With Sheets("SheetX")
    lastrow = .Cells(.Rows.Count, "A").End(xlUp).Row
        For Each c In .Range("A2:A" & lastrow)
            Yr = Range("A" & c.Row).Value
                Debug.Print Yr
            Monthh = Range("B" & c.Row).Value
                Debug.Print Monthh
            Event = Range("C" & c.Row).Value
                Debug.Print CampPhase
               Select Case Yr
                    Case Is = Yearr
                        Select Case Monthh
                            Case Is = Mon
                                Select Case Event
                                    Case Is = Event2

                                        file1 = Range("E" & c.Row).Value
                                        file2 = Range("F" & c.Row).Value

                                        Call pricequery2(file1, fil2)

                                End Select
                        End Select
                End Select
        Next c
End With
End Sub
