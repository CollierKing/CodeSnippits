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