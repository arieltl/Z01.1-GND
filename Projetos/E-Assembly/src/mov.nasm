; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; -----------------------
; RAM[0] = RAM[1]
; -----------------------


; -----------------------
; RAM[3] = 1
; -----------------------

leaw $R0, $A 
movw (%A), %D ;Salva ram0 em D
leaw $R2, $A
movw %D, (%A) ; Salva D(ram0) em ram2
leaw $R1, $A
movw (%A), %D ;Salva ram1 em D
leaw $R0, $A
movw %D, (%A) ; Salva D(ram1) em ram0
leaw $R2, $A
movw (%A), %D ;Salva ram2(ram0) em D
leaw $R1, $A
movw %D, (%A) ; Salva D(ram2/0) em ram1
leaw $R3, %A
movw $1, (%A)