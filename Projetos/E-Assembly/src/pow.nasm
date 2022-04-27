; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


; Copiando a valor de RAM[1] para RAM[2]
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)


LOOP:

; Somando RAM[1] com RAM[0] e armazenando em RAM[0]
leaw $1, %A
movw (%A), %D
leaw $0, %A
addw (%A), %D, %D
movw %D, (%A)

; Subtraindo 1 em RAM[2]
leaw $2, %A
movw (%A), %D
decw %D
movw %D, (%A)

leaw $LOOP, %A
jg %D
nop