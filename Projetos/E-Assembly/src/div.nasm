; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos


LOOP:
leaw $R1, %A
movw (%A), %D ;Salva R1 em D
leaw $R0, %A 
rsubw %D, (%A), %D ;Subtrai R1 de R0
movw %D, (%A) ; Salva novo valor de R0
leaw $END, %A

jl %D ; Pula para o fim se R0 for menor que 0
nop

leaw $R2, %A
addw (%A), $1, %D 
movw %D, (%A)     ; incrementa R2
leaw $LOOP, %A 
jmp              ; Repete
nop
END:
















































































