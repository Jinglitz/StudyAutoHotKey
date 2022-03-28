/*
일단 해볼것
1.타이머.
2.함수에서 변수사용하기
이것만 돼도 좋아진다.
*/
CoordMode, Mouse, Window ;윈도우 기준으로 좌표계를 설정한다.

;Gui, Add, Text, x10 y10 w200 h20, Macro Program
;Gui, Add, Text, x10 y40 w200 h20 vSetting, Setting
;Gui, Add, Text, x10 y70 w200 h20 vStatus, Status-Stop
;Gui, Add, Edit, x10 y100 w50 h30 vStatus1, 10 ; 공격력
;Gui, Add, Edit, x60 y100 w50 h30 vStatus2, 3 ; 체력
;Gui, Add, Edit, x110 y100 w50 h30 vStatus3,3 ; 체력회복
Gui, Add, Edit, x10 y10 w200 h30 vRebirthTime, Time : 0
Gui, Add, Edit, x10 y40 w200 h30 vSecondTime, Time : 0
Gui, Show, w530 h200 X500, Test.dlg
global runningTime = 0
global runningTime2 = 0
return

F1::
{
    SetTimer, startTimer, 1000
    SetTimer, startTimer2, 5000
    Loop
    {
        Send, {a} ;a키를 누른다
        Sleep, 1000
    }
return
}


startTimer:
{
    runningTime++
    GuiControl,, RebirthTime, Time : %runningTime%
    return
}

startTimer2:
{
    runningTime2++
    GuiControl,, SecondTime, Time : %runningTime2%
    return
}

GuiClose:
F3::ExitApp