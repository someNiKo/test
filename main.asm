;����Ҫ��:
;���³���Ĺ����ǴӼ�������һ�г��Ȳ�����8���ַ���
;16�����ַ��������浽����s�У��ٰѸ��ַ���ת����
;32λ���������浽����result�С�ע���ַ���sһ����
;00h�ַ�������
;���磺����"8086CaFe"����result��ֵ=8086CAFEh��
;������´��벹��������
;==========������´��뱣�浽src\main.asm==============================
;==========ѡ��main.sh��src�ļ���->�Ҽ�->ѹ����submit.zip�ύ==========
.386
data segment use16
sth db 10h dup(0)
s   db 100h dup('S')
result dd 0
data ends

code segment use16
assume cs:code, ds:data
main:
   mov ax, data
   mov ds, ax
   mov si, offset s
input_next:
   mov ah, 1
   int 21h; AL=getchar()
   cmp al, 0Dh; �ж��Ƿ�Ϊ�س���
   je input_done
   mov [si], al
   add si, 1                     
   jmp input_next
input_done:
   mov byte ptr [si], 0
;����#1_begin��#1_end֮�䲹�����ʵ�����¹���:
;��s�а�����16�����ַ���ת����32λ���������浽
;����result��
;#1_begin-------------------------------------
FuncSetUp:
   mov si, offset s
FuncLoop:
   cmp byte ptr [si], 00h
   je FuncEnd
   mov al,[si]
   sub al, "0"
   cmp al, 9
   jbe FuncBE9
   mov al,[si]
   sub al, "A"
   cmp al, 5
   jbe FuncBEBF
   mov al,[si]
   sub al, "a"
   cmp al, 5
   jbe FuncBEsf
FuncBE9:
   sal result, 4
   and eax, 0000000000001111B
   add result, eax
   add si, 1
   jmp FuncLoop
FuncBEBF:
   sal result, 4
   add eax, 10
   and eax, 0000000000001111B
   add result, eax
   add si, 1
   jmp FuncLoop
FuncBEsf:
   sal result, 4
   add eax, 10
   and eax, 0000000000001111B
   add result, eax
   add si, 1
   jmp FuncLoop
FuncEnd:
;#1_end========================================
   mov ah, 4Ch
   int 21h
code ends
end main
;==========������ϴ��뱣�浽src\main.asm==============================
