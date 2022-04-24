; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

leaw $R5, %A ; R5 e par quando o ultimo bit for zero
movw (%A), %D
notw %D ; inverte R5
leaw $1, %A
andw %D, %A, %D ;Zera todos bits menos o ultimo
leaw $R0, %A
movw %D, (%A) ; Salva em R0