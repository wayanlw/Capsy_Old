Attribute VB_Name = "Module1"
tester

Sub Sht_insertwithName_I()

    Dim NewSheet As Worksheet
    Dim sheetname As String


    sheetname = Application.InputBox("Insert the name of the new Sheet" & _
                vbCr & " ", Type:=2, Title:="Insert New Sheet")


    'The Inputbox types and their input types
    '0   A Formula
    '1   A Number
    '2   Text (Default)
    '4   A logical value (True or False)
    '8   A cell reference, as a Range object
    '16  An error value, such as #N/A
    '64  An array of values

    'Handle If User Cancels
    If sheetname = "" Then                        ' if user doesnt enter anything exit sub
        Exit Sub
    ElseIf sheetname = "False" Then               ' if user cancels exit sub
        Exit Sub
    End If

    ' check if a sheet exists by that name and if not create sheet
    If Fnc_Sheet_Exists(sheetname) = False Then
        Set NewSheet = Sheets.Add(After:=ActiveSheet)
        NewSheet.Name = sheetname
        Fnc_NoGridZoon (NewSheet.Name)
    Else
        MsgBox ("Sheetname already exists")
    End If



End Sub
