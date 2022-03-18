#SingleInstance, Force
#ErrorStdOut
#Warn, All, Off
SetWorkingDir %A_ScriptDir%
ini := StrReplace(A_ScriptFullPath, ".ahk", ".ini")

Gui, Add, Text, x102 y9 w40 h20 , Tekstas
Gui, Add, Edit, x22 y29 w210 h60 vEdit1
Gui, Add, Edit, x22 y119 w210 h60 vEdit2
Gui, Add, Edit, x22 y209 w210 h60 vEdit3
Gui, Add, Edit, x22 y299 w210 h60 vEdit4
Gui, Add, Hotkey, % "x292 y39 w70 h40 vHotkey1"
Gui, Add, Hotkey, % "x292 y129 w70 h40 vHotkey2"
Gui, Add, Hotkey, % "x292 y219 w70 h40 vHotkey3"
Gui, Add, Hotkey, % "x292 y309 w70 h40 vHotkey4"
Gui, Add, Text, x302 y19 w50 h20 , Mygtukas
Gui, Add, Button, x402 y39 w50 h30 gButton1, Submit
Gui, Add, Button, x402 y129 w50 h30 gButton2, Submit
Gui, Add, Button, x402 y219 w50 h30 gButton3, Submit
Gui, Add, Button, x402 y309 w50 h30 gButton4, Submit
Gui, Add, Button, x432 y359 w40 h20 gButton_clear , Clear
IniRead, Hotkey1, %ini%, Settings1, Hotkey1
IniRead, Hotkey2, %ini%, Settings2, Hotkey2
IniRead, Hotkey3, %ini%, Settings3, Hotkey3
IniRead, Hotkey4, %ini%, Settings4, Hotkey4
GuiControl,, Hotkey1, %Hotkey1%
GuiControl,, Hotkey2, %Hotkey2%
GuiControl,, Hotkey3, %Hotkey3%
GuiControl,, Hotkey4, %Hotkey4%
OnExit("done")

done(ExitReason, ExitCode) {
 Global
 Gui, Submit
 IniWrite, %Hotkey1%, %ini%, Settings1, Hotkey1
 IniWrite, %Hotkey2%, %ini%, Settings2, Hotkey2 ;       .ini write
 IniWrite, %Hotkey3%, %ini%, Settings3, Hotkey3
 IniWrite, %Hotkey4%, %ini%, Settings4, Hotkey4
}



IfExist, text1.txt
    sleep, 0
Else
    FileAppend, %Edit1%, text1.txt
    FileAppend, %Edit2%, text2.txt ;                    IfExist
    FileAppend, %Edit3%, text3.txt
    FileAppend, %Edit4%, text4.txt



F1=%a_scriptdir%\text1.txt
FileGetSize,size,%f1%,
If(Size=0)
    Gui, Show, x570 y285 h386 w479, Keybinds ;          FileSize
Else
    SoundBeep, 1500





IniRead, Settings1, project.ini, Settings1, Hotkey1 ;   iniread1
Try
{
    Hotkey, %Settings1%, label1
}

IniRead, Settings2, project.ini, Settings2, Hotkey2 ;   iniread2
Hotkey, %Settings2%, label2


IniRead, Settings3, project.ini, Settings3, Hotkey3 ;   iniread3
Hotkey, %Settings3%, label3


IniRead, Settings4, project.ini, Settings4, Hotkey4 ;   iniread4
Hotkey, %Settings4%, label4
return

label1:
FileRead, read1, text1.txt ;                        Write text 1
Send, %read1%
return

label2:
FileRead, read2, text2.txt ;                        Write text 2
Send, %read2%
return

label3:
FileRead, read3, text3.txt ;                        Write text 3
Send, %read3%
return

label4:
FileRead, read4, text4.txt ;                        Write text 4
Send, %read4%
return


Button1:
Gui, Submit, Nohide
FileAppend, %Edit1%, text1.txt ;                Button1
Return

Button2:
    Gui, Submit, Nohide
    FileAppend, %Edit2%, text2.txt ;            Button2
Return

Button3:
    Gui, Submit, Nohide
    FileAppend, %Edit3%, text3.txt ;            Button3
Return

Button4:
    Gui, Submit, Nohide
    FileAppend, %Edit4%, text4.txt ;            Button4 
 Return


Button_clear:
    FileDelete, text1.txt
    FileAppend, %Edit1%, text1.txt

    FileDelete, text2.txt
    FileAppend, %Edit2%, text2.txt ;            Clear

    FileDelete, text3.txt
    FileAppend, %Edit3%, text3.txt

    FileDelete, text4.txt
    FileAppend, %Edit4%, text4.txt
Return





GuiClose:
ExitApp