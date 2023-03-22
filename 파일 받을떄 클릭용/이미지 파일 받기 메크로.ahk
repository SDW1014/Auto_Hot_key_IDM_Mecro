#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Pixel, Screen

global imageFile_1 := "example_1.png"
global imageFile_2 := "example_2.png"
global imageFile_3 := "example_3.png"
global imageFile_4 := "example_4.png"
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
Loop
{
    if (!Paused) 
    {
        ImageCheck(imageFile_1)
        if !ErrorLevel 
        {
            ImageClick()
            Loop
                {
                    ImageCheck(imageFile_2)
                    if !ErrorLevel 
                    {
                        ImageClick()
                        Loop
                            {
                                ImageCheck(imageFile_3)
                                if !ErrorLevel 
                                {
                                    ImageClick()
                                    Loop
                                        {
                                            ImageCheck(imageFile_3)
                                            if !ErrorLevel 
                                            {
                                                ImageClick()
                                                break
                                            }
                                            Sleep 500
                                        }
                                    break
                                }
                                Sleep 500
                            }
                        
                        break
                    }
                    Sleep 500
                }
           
            break
        }
    }
    Sleep 500
}

return

F11::
Paused := !Paused
return