; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------


; R4 --> monitora posicao
; R3 --> monitora qtas vezes rodar
; R2 --> guarda o valor original de R4

leaw $R4,%A
movw (%A), %D
movw %A, (%A)
leaw $R2, %A
movw %D, (%A)
leaw $R3, %A
movw %D, (%A)

LOOP:
leaw $R1, %A
movw (%A), %D
leaw $R4, %A
movw (%A), %A
incw %A
addw (%A), %D, %D
leaw $R1, %A
movw %D, (%A)
leaw $R4, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $R3, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $LOOP, %A
jg %D
nop

DIV:

leaw $R1, %A
movw (%A), %D ;Salva R1 em D
leaw $R2, %A 
rsubw %D, (%A), %D ;Subtrai R1 de R0
movw %D, (%A) ; Salva novo valor de R0
leaw $END, %A

jl %D ; Pula para o fim se R0 for menor que 0
nop

leaw $R0, %A
addw (%A), $1, %D 
movw %D, (%A)     ; incrementa R2
leaw $DIV, %A 
jmp              ; Repete
nop

END:
