; ./asmx -l -o -w -e -C Z80 echo.asm
; then cat hello.asm.hex trailer.hex
; and paste the result into the Z80MC monitor prompt
        INCLUDE monitor_calls.asm

; read-eval-print loop, is key-by-key
; 0-9 - echo and add to accumulator
; e - push accumulator to the stack, accumulator <- 0
; operations: a->+ b->- c->* d->/ - accumulator <op> TOS, copy accum -> TOS
; f - zero accumulator (todo: backspace)

; zeroth: where do I locate my program so it doesn't clobber the monitor?
; :: 0x8000 seems to be where folks put stuff.
        org 0x8000

; first: how does keypad input work?
; I see some event names: KEY_EVENT, KEY_PRESSED - how do I use these?
; I also see IN_KEY_HEX, maybe there are multiple levels of abstraction
; in this API?
; :: in the monitor source, here's the input loop:

INPUT_LOOP
                CALL In_Key_Hex         ;Test regular HEX input
                JP Z,INPUT_LOOP


; second: how do I address the LED?
; I see LED_PUT_BYTE, LED_PUT_HEX, LED_CURSOR - seem sensible. 
; What arguments do they take? Can I position things? How do I clear a digit?

; third: how do I maintain my accumulator and data stack?
; clearly 16 bits to start with.

; fourth: given the answer to how input works, what does my 
; main loop look like?

; fifth: maybe I should print a log of operations to the console - 
; like a paper tape?

