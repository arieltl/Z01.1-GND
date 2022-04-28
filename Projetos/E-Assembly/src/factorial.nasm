; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.
leaw $R0, %A
movw (%A), %D
leaw $INITFAT, %A
jg %D
nop
leaw $R1, %A
movw $1, (%A)
leaw $END, %A
jmp
nop

INITFAT:
leaw $R0, %A
movw (%A), %D
leaw $R1, %A
movw %D, (%A) 	


FAT:
leaw $R0, %A
subw (%A), $1, %D
movw %D, (%A)
leaw %END
jle %D
nop
leaw $R3, %A
movw $0,(%A)
leaw $R0, %A
movw (%A),%D
leaw $R4, %A
movw %D, (%A)
MULT:

leaw $1, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, %D
movw %D, (%A)
leaw $4, %A
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
nop
END:





