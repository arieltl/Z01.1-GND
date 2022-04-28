; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

FAT:
leaw $R0, %A
subw (%A), $1, %D
movw %D, (%A)
leaw %END
jle %D

MULT:

leaw $0, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, %D
movw %D, (%A)
leaw $1, %A
movw (%A), %D
decw %D
movw %D, (%A)


leaw $MULT, %A
jg %D
nop

leaw $R3, %A
movw (%A), %D
leaw $R1, %A
movw %D, (%A)

leaw $FAT, %A
jmp





