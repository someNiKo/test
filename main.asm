;本题要求:
;以下程序的功能是从键盘输入一行长度不超过8个字符的
;16进制字符串并保存到数组s中，再把该字符串转化成
;32位整数并保存到变量result中。注意字符串s一定以
;00h字符结束。
;例如：输入"8086CaFe"，则result的值=8086CAFEh。
;请把以下代码补充完整。
;==========请把以下代码保存到src\main.asm==============================
;==========选中main.sh及src文件夹->右键->压缩成submit.zip提交==========
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
   cmp al, 0Dh; 判断是否为回车键
   je input_done
   mov [si], al
   add si, 1                     
   jmp input_next
input_done:
   mov byte ptr [si], 0
;请在#1_begin和#1_end之间补充代码实现以下功能:
;把s中包含的16进制字符串转化成32位整数并保存到
;变量result中
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
;==========请把以上代码保存到src\main.asm==============================
