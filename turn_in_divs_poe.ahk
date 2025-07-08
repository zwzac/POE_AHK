#NoEnv
SendMode Input
CoordMode, Mouse, Screen
SetTitleMatchMode, 2

; === CONFIGURABLE SETTINGS ===
InventoryStartX := 1300     ; top-left inventory cell X
InventoryStartY := 615      ; top-left inventory cell Y
SlotWidth := 51
SlotHeight := 50

Columns := 12
Rows := 5

TradeX := 630              ; "Trade" button X coord
TradeY := 735              ; "Trade" button Y coord

RewardX := 630             ; Reward output slot X coord
RewardY := 500             ; Reward output slot Y coord

global stopScript := false

F10:: ; Press F10 to stop
    stopScript := true
    ToolTip, 🛑 Script stopping...
    Sleep, 1000
    ToolTip
    return

; === MAIN LOOP HOTKEY ===
F9::
stopScript := false  ; reset flag

Loop, %Columns%
{
    col := A_Index - 1
    Loop, %Rows%
    {
        if (stopScript)
            return

        row := A_Index - 1

        SlotX := InventoryStartX + (col * SlotWidth)
        SlotY := InventoryStartY + (row * SlotHeight)

        ; Ctrl+Click slot
        MouseMove, %SlotX%, %SlotY%, 0
        Sleep, 25
        Send, {Ctrl down}
        Click
        Send, {Ctrl up}
        Sleep, 25

        ; Click Trade
        MouseMove, %TradeX%, %TradeY%, 0
        Sleep, 25
        Click
        Sleep, 5

        ; Ctrl+Click reward
        MouseMove, %RewardX%, %RewardY%, 0
        Sleep, 25
        Send, {Ctrl down}
        Click
        Send, {Ctrl up}
        Sleep, 25
    }
}
return