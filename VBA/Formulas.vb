

'Simple concatenate formula
ActiveCell.formula = "=CONCATENATE(" & "D" & ActiveCell.row & "," & """ Test text """ & "," & "D" & ActiveCell.Offset(-1, 0).row & ")"
            
