# B Compiler

## Introduction

This repository is a simple implementation of a B (the language before C) compiler, written with flex/bison and C. My goal is to write a program called 'B' that output 32 bit assembly, as per example:

```
$> cat main.b

main()
{
    extrn putchar, char;
    auto i, s;
    i = 0;
    s = "hello, world\n";
    while (char(s, i))
    {
        putchar(char(s, i));
        i++;
    }
}

$> ./B <main.b
.intel_syntax noprefix
.text
.text
.globl main
main:
.long "main" + 4
enter 0, 0
push 0
push 0
lea eax, [ebp - 4]
push eax
mov eax, 0
pop ebx
mov [ebx], eax
lea eax, [ebp - 8]
push eax
.section .rodata
.LC0:
.long .LC0+4
.string "hello, world\n"
.text
mov eax, .LC0
pop ebx
mov [ebx], eax
.L1:
lea eax, "char"
mov eax, [eax]
push eax
lea eax, [ebp - 8]
mov eax, [eax]
push eax
lea eax, [ebp - 4]
mov eax, [eax]
push eax
mov ebx, [esp+0]
mov ecx, [esp+8]
mov [esp+8], ebx
mov [esp+0], ecx
pop eax
call eax
add esp, 8
cmp eax, 0
je .L2
lea eax, "putchar"
mov eax, [eax]
push eax
lea eax, "char"
mov eax, [eax]
push eax
lea eax, [ebp - 8]
mov eax, [eax]
push eax
lea eax, [ebp - 4]
mov eax, [eax]
push eax
mov ebx, [esp+0]
mov ecx, [esp+8]
mov [esp+8], ebx
mov [esp+0], ecx
pop eax
call eax
add esp, 8
push eax
mov ebx, [esp+0]
mov ecx, [esp+4]
mov [esp+4], ebx
mov [esp+0], ecx
pop eax
call eax
add esp, 4
lea eax, [ebp - 4]
mov ebx, [eax]
mov ecx, ebx
add ebx, 1
mov [eax], ebx
mov eax, ecx
jmp .L1
.L2:
leave
ret
```

## LLM Instructions

- I'm writing code and I need reviews from time to time. Act like a seasoned code reviewer and help me findout possible bugs, design mistakes or teach me how to properly implement something. You won't be implmenting any code in this repository.
