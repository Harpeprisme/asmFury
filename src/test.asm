format MZ

debut:
	push cs
	pop ds

	call VideoRetDefaut
	mov [initAH], ah
	mov [initAL], al
	mov [initBH], bh

	call VideoInit

	mov [varI], 0
	mov [posY], 1

; Affiche un joli arcenciel avec les 255 couleurs du mode VGA
debut_dessin:
	mov ah, 0ch
	mov al, [varI]
	mov bh, [initBH]
	mov cx, [posX]
	mov dx, [posY]
	int 10h

	add [varI], 1
	add [posX], 1


	cmp [varI], 255
	jne debut_dessin

	push 8
	push 1
	push 2
	call _pixel


	mov ah, 86h ; attente
	mov cx, 30
	mov dx, 0FFh
	int 15h

quitter:
	mov al, [initAL]
	mov ah, 0
	int 10h ; On remet le mode vidéo de départ

	mov ax, 4c00h
	int 21h ; On quitte le programme

_pixel:
	push bp
	mov bp, sp

	mov ah, 0ch
	mov al, [bp] ; couleur
	mov bh, [initBH]
	mov cx, [bp+4] ; x
	mov dx, [bp+8] ; y
	int 10h

	pop bp
	ret

include 'video.asm'

msg db 'Coucou', '$'
initAL db 0
initAH db 0
initBH db 0
varI db 0
posX dw 0
posY dw 0
