#NoEnv
SendMode Input
CoordMode, Mouse, Screen
SetTitleMatchMode, 2

; === CONFIGURATION ===
DeckStartX := 1300     ; top-left inventory cell X
DeckStartY := 615      ; top-left inventory cell Y
SlotHeight := 50       ; Distance between vertical inventory slots

ClickX := 1200         ; Where to left-click to drop card (somewhere outside inventory)
ClickY := 615

RevealsPerSlot := 20
SlotCount := 2
Delay := 25           ; Delay between each right+left click pair

; === HOTKEY TO START ===
F11::
    Loop, %SlotCount%
    {
        offsetY := (A_Index - 1) * SlotHeight
        currentDeckY := DeckStartY + offsetY

        Loop, %RevealsPerSlot%
        {
            ; Step 1: Right-click deck
            MouseMove, %DeckStartX%, %currentDeckY%, 0
            Sleep, 30
            Click, right
            Sleep, 30

            ; Step 2: Left-click drop location
            MouseMove, %ClickX%, %ClickY%, 0
            Sleep, 30
            Click, left
            Sleep, %Delay%
        }
    }
return
