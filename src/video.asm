VideoInit:
	mov al, 13h ; VGA 320x200 256 couleurs
	mov ah, 0
	int 10h
	ret

; Met dans :
; AL : mode vidéo
; AH : nombre de caractères par colone
; BH : page active
VideoRetDefaut:
	mov ah, 0Fh
	int 10h
	ret
