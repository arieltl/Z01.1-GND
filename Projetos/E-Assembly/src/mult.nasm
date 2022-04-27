; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

LOOP:

leaw $0, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, %D
movw %D, (%A)
leaw $1, %A
movw (%A), %A
decw %A
movw %A, (%A)
movw %A, %D

leaw $LOOP, %A
jg %D