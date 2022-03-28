/* 테일드 데몬 슬레이어 - 방치형RPG
1. 잠금풀기 가만히 놔두면 잠금 화면이 된다. - 설정에서 해제 가능
2. 훈련
3. 귀환(환생개념) 최소 20분에 1번 가능인듯
*/
CoordMode, Mouse, Window ;윈도우 기준으로 좌표계를 설정한다.

Gui, Add, Text, x10 y10 w200 h20, Macro Program(F6:Setting F7:Start)
Gui, Add, Text, x10 y40 w200 h20 vSetting, Setting
Gui, Add, Text, x10 y70 w200 h20 vStatus, Status-Stop
Gui, Add, Edit, x10 y100 w50 h30 vStatus1, 10 ; 공격력
Gui, Add, Edit, x60 y100 w50 h30 vStatus2, 3 ; 체력
Gui, Add, Edit, x110 y100 w50 h30 vStatus3,3 ; 체력회복
Gui, Add, Button, x170 y100 w50 h30 gSetStatus, SetStat ; 스탯분배
Gui, Add, Edit, x10 y130 w200 h30 vRebirthTime, Time : 00:00:00 ; 매크로시작시간
Gui, Show, w530 h200 X500, Demon Slayer Macro
isContinue = False;
cCount = 0;
global runningTime = 0
global isChannelChange = 0
global currentChannel =0
return

; Process ID를 셋팅한다. 
F6:: 
WinGet, tmp_pid, PID, A ;A는 활성창
GuiControl,, Setting, PID is %tmp_pid%
return

;메인 매크로
F7::
{
    Gui, Submit, NoHide ;"Gui의 내용을 가져와라"라는 의미. 스크립트를 진행하다가 이 구문을 만나면, 그제서야 v레이블에 현재 GUI의 내용이 담깁니다.
    ;autoTraining(%Status1%,%Status2%,%Status3%)

    Loop,50
    {
        a++

        GuiControl,, Status, Running Status is %a%-00
        ;귀환하자
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(506, 134) ; 귀환
        Sleep, 500
        resungerClick(284, 965) ; 귀환하기
        Sleep, 20000

        b:=0
        Loop,11
        {
            b++
            GuiControl,, Status, Running Status is %a%-%b%
            autoTraining(10,3,3) ; 훈련 10,3,3
            Sleep, 120000 ;2분에 한번 훈련
        }

    }
return
}

;126000초(21분)마다 귀환만하기
F8::
{
;resungerClick(514, 733)
;processIDClick(514, 733)
    SetTimer, startTimer, 1000
    Gui, Submit, NoHide ;"Gui의 내용을 가져와라"라는 의미. 스크립트를 진행하다가 이 구문을 만나면, 그제서야 v레이블에 현재 GUI의 내용이 담깁니다.
    Loop,50
    {
        runningTime = 0
        a++

        GuiControl,, Status, Rebirth count : %a%
        ;귀환하자
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(277, 986) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 300
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(277, 986) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(506, 134) ; 귀환
        Sleep, 500
        resungerClick(284, 965) ; 귀환하기
        Sleep, 20000
        resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
        Sleep, 100
        Sleep, 1240000 ; 1260초 21분마다 환생

    }
    return
}

; ProcessName 클릭함수
resungerClick(x, y)
{
ClickX:=x ;클릭할 좌표X
ClickY:=y ;클릭할 좌표Y
lparam:=ClickX|ClickY<<16 ;PostMessage는 좌표값을 16진수로 받습니다.
PostMessage,0x201,1,%lparam%,,NoxPlayer ;0x201,1 클릭,1 입니다.
PostMessage,0x202,0,%lparam%,,NoxPlayer ;0x202,0, 클릭을 때다 입니다.
;PostMessage, 0x201, 1, %lparam%,, ahk_pid %tmp_pid%
;PostMessage, 0x202, 0, %lparam%,, ahk_pid %tmp_pid%
return
}

; Process ID 클릭함수
processIDClick(x, y)
{
ClickX:=x ;클릭할 좌표X
ClickY:=y ;클릭할 좌표Y
lparam:=ClickX|ClickY<<16 ;PostMessage는 좌표값을 16진수로 받습니다.
;PostMessage,0x201,1,%lparam%,,NoxPlayer ;0x201,1 클릭,1 입니다.
;PostMessage,0x202,0,%lparam%,,NoxPlayer ;0x202,0, 클릭을 때다 입니다.
PostMessage, 0x201, 1, %lparam%,, ahk_pid %tmp_pid%
PostMessage, 0x202, 0, %lparam%,, ahk_pid %tmp_pid%
return
}

autoTraining(x,y,z)
{
    Gui, Submit, NoHide ;"Gui의 내용을 가져와라"라는 의미. 스크립트를 진행하다가 이 구문을 만나면, 그제서야 v레이블에 현재 GUI의 내용이 담깁니다.
    ;GuiControl,, Status, Status-Start
    resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
    Sleep, 100
    resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
    Sleep, 100
    resungerClick(94, 189) ; 무슨 대화창뜨면 눌러서 나가기
    Sleep, 100
    resungerClick(94, 909) ; 무슨 대화창뜨면 눌러서 나가기
    Sleep, 100
    resungerClick(520, 728) ; 훈련버튼
    Sleep, 300

    Loop, %x%
    {
        Sleep, 150
        resungerClick(520, 728) ; 공격력 업
    }

    Loop, %y%
    {
        Sleep, 150
        resungerClick(520, 812) ; 체력 업
    }

    Loop, %z%
    {
        Sleep, 150
        resungerClick(520, 900) ; 체력회복 업
    }
    Sleep, 100
    resungerClick(274, 988) ; 훈련창 나가기

    return
}

;SetStatus
SetStatus:
{
    Gui, Submit, NoHide ;"Gui의 내용을 가져와라"라는 의미. 스크립트를 진행하다가 이 구문을 만나면, 그제서야 v레이블에 현재 GUI의 내용이 담깁니다.
    Loop, %Status1%
    {
        Sleep, 150
        resungerClick(520, 728) ; 공격력 업
    }

    Loop, %Status2%
    {
        Sleep, 150
        resungerClick(520, 812) ; 체력 업
    }

    Loop, %Status3%
    {
        Sleep, 150
        resungerClick(520, 900) ; 체력회복 업
    }
    Sleep, 100
    resungerClick(274, 988) ; 훈련창 나가기

    return
}

; 타이머 함수
startTimer:
{
    runningTime++
    GuiControl,, RebirthTime, Time : %runningTime%
    return
}

GuiClose:
F3::ExitApp
;추가 되나?
