#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Pixel, Screen

imageFiles := ["example_1.png", "example_2.png", "example_3.png", "example_4.png"]
Paused := false

global x := 0
global y := 0

ImageCheck(imageFile)
{
    WinGetPos, start_X, start_Y, end_width, end_height, A
    end_X := start_X + end_width
    end_Y := start_Y + end_height
    ImageSearch, x, y, %start_X%, %start_Y%, %end_X%, %end_Y%,*50 %imageFile%
    x := x - start_X
    y := y - start_Y 
}
ImageClick()
{
    y := y+5
    Click, %x%, %y%
}

T::
Loop, % imageFiles.MaxIndex()
{
    imageFile := imageFiles[A_Index]
    if (!Paused) 
    {
        Loop
        {
            ImageCheck(imageFile)
            if !ErrorLevel 
            {
                ImageClick()
                break
            }
            Sleep 500
        }
    }
    Sleep 500
}

return

F11::
Paused := !Paused
return