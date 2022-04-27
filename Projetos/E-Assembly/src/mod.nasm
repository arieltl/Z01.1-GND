; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

LOOP:
leaw $R0, %A
movw (%A), %D
leaw $R2, %A
movw %D, (%A)
leaw $R1, %A
movw (%A), %A
subw %D, %A, %D
leaw $NEG, %A
jl %D
nop
leaw $R0, %A
movw %D, (%A)
leaw $LOOP, %A
jmp
nop
NEG:
