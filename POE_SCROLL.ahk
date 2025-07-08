+WheelUp::
    ; Send Shift + Left Click
    Send, +{LButton}
    ; Prevent default scrolling behavior
    return

^WheelUp::
    ; Send Ctrl + Left Click
    Send, ^{LButton}
    ; Prevent default scrolling behavior
    return

+WheelDown::
    ; Send Shift + Left Click
    Send, +{LButton}
    ; Prevent default scrolling behavior
    return

^WheelDown::
    ; Send Ctrl + Left Click
    Send, ^{LButton}
    ; Prevent default scrolling behavior
    return

WheelDown::
    ; Pass through normal scrolling
    Send, {Blind}{WheelDown}
    return

WheelUp::
    Send, {Blind}{WheelUp}
    return
