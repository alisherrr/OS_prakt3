org 7C00h

        jmp start

msg: db '   ********                                                              Rahimov', \
        ' ************                                                            Alisher', \
        '**************                                                     Alovudinovich', \
        ' ************                                                                   ', \
        '   ********                                                           NMT-303902', 0

start:
        mov ah, 79h     ; ����� ����� �� ����� ����
        mov bx, 0B800h  ; ����� �����-��������
        mov es, bx      ; �������� � ���������� ������� ������ ������, ������� ����� ����� bx
        mov di, 0       ; �������� � ��������
        mov si, msg
        add di, 80 * 10 * 2
loop1:
        mov al, [cs:si]
        cmp al, 0
        je exit
        mov [es:di], ax
        inc si
        add di, 2
        jmp loop1

exit:
        db 510-($-$$) dup 0
        dw 0AA55h

