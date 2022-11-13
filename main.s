	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	Len
	.type	Len, @function
Len:                 ## фунция int Len
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi ## rdi - это строка s
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax ## через rdi передаем строку 
	call	strlen@PLT ## получаем ее длину 
	mov	DWORD PTR -4[rbp], eax ## присваиваем х длину строки s
	mov	eax, DWORD PTR -4[rbp] ## возвращаем х
	leave
	ret
	.size	Len, .-Len
	.section	.rodata
.LC0:
	.string	"r"
	.align 8
.LC1:
	.string	"/home/artyom/CLionProjects/untitled3/text"
.LC2:
	.string	"%d"
.LC3:
	.string	"int, if, do, for, goto: "
.LC4:
	.string	"%d "
.LC5: ## Надпись: Пустой файл
	.string	"\320\237\321\203\321\201\321\202\320\276\320\271 \321\204\320\260\320\271\320\273 "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1888
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	
	## обнуляем массив Х
	mov	DWORD PTR -10048[rbp], 0
	mov	DWORD PTR -10044[rbp], 0
	mov	DWORD PTR -10040[rbp], 0
	mov	DWORD PTR -10036[rbp], 0
	mov	DWORD PTR -10032[rbp], 0
	
	
	lea	rax, .LC0[rip]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT ## открываем файл на чтение
	mov	QWORD PTR -10056[rbp], rax
	nop
.L4:
	mov	rdx, QWORD PTR -10056[rbp]
	lea	rax, -10016[rbp]
	mov	esi, 10000
	mov	rdi, rax
	call	fgets@PLT ## считываем строку
	test	rax, rax ## сравнение строки с 0 
	jne	.L4 ## считываем еще,если не 0
	lea	rax, -10016[rbp] 
	mov	rdi, rax ## передаем через rdi строку s
	call	Len ## вызываем функцию Len
	mov	DWORD PTR -10060[rbp], eax ## eax - длинa строки (х)
	mov	eax, DWORD PTR -10060[rbp]
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT ## выводим длину строки 
	cmp	DWORD PTR -10060[rbp], 0 ## сравниваем с 0 длину, если 0 прыграем на .L5
	je	.L5
	mov	DWORD PTR -10068[rbp], 0
	jmp	.L6
	
	
	
.L22:
	mov	eax, DWORD PTR -10068[rbp]
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 105 ## s[i] == 'i'
	jne	.L7
	
	mov	eax, DWORD PTR -10060[rbp]
	sub	eax, 3
	cmp	DWORD PTR -10068[rbp], eax ## i <= l - 4
	jge	.L7
	
	cmp	DWORD PTR -10068[rbp], 0 ## (i == 0)
	je	.L8
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i - 1] == ' ')
	sub	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L7
.L8:
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 1] == 'n')
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 110
	jne	.L7
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 2] == 't')
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 116
	jne	.L7
	
	mov	eax, DWORD PTR -10060[rbp] ## (i == l - 4) 
	sub	eax, 4
	cmp	DWORD PTR -10068[rbp], eax
	je	.L9
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 3] == ' ')
	add	eax, 3
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L7
.L9:
	mov	eax, DWORD PTR -10048[rbp] 
	## X[0] += 1
	add	eax, 1
	mov	DWORD PTR -10048[rbp], eax
	jmp	.L10
	
	
	
	
.L7:
	mov	eax, DWORD PTR -10068[rbp] ## s[i] == 'i'
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 105
	jne	.L11
	
	mov	eax, DWORD PTR -10060[rbp] ## (i <= l - 3)
	sub	eax, 2
	cmp	DWORD PTR -10068[rbp], eax
	jge	.L11
	
	cmp	DWORD PTR -10068[rbp], 0 ## (i == 0)
	je	.L12
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i - 1] == ' ')
	sub	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L11
.L12:
	mov	eax, DWORD PTR -10068[rbp] ## s[i + 1] == 'f'
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 102
	jne	.L11
	
	mov	eax, DWORD PTR -10060[rbp] ## (i == l - 3)
	sub	eax, 3
	cmp	DWORD PTR -10068[rbp], eax
	je	.L13
	
	mov	eax, DWORD PTR -10068[rbp] ## s[i + 2] == ' ')
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L11
.L13:
	mov	eax, DWORD PTR -10044[rbp] ## X[1] += 1;
	add	eax, 1
	mov	DWORD PTR -10044[rbp], eax
	jmp	.L10
	
	
	
	
.L11:
	mov	eax, DWORD PTR -10068[rbp] ## s[i] == 'd'
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 100
	jne	.L14
	
	mov	eax, DWORD PTR -10060[rbp] ## (i <= l - 3)
	sub	eax, 2
	cmp	DWORD PTR -10068[rbp], eax
	jge	.L14
	
	cmp	DWORD PTR -10068[rbp], 0 ## (i == 0)
	je	.L15
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i - 1] == ' ')
	sub	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L14
.L15:
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 1] == 'o')
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 111
	jne	.L14
	
	mov	eax, DWORD PTR -10060[rbp] ##(i == l - 3)
	sub	eax, 3
	cmp	DWORD PTR -10068[rbp], eax
	je	.L16
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 2] == ' ')
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L14
.L16:
	mov	eax, DWORD PTR -10040[rbp] ## X[2] += 1;
	add	eax, 1
	mov	DWORD PTR -10040[rbp], eax
	jmp	.L10
.L14:
	mov	eax, DWORD PTR -10068[rbp] ## s[i] == 'f'
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 102
	jne	.L17
	
	mov	eax, DWORD PTR -10060[rbp] ## (i <= l - 4)
	sub	eax, 3
	cmp	DWORD PTR -10068[rbp], eax
	jge	.L17
	
	cmp	DWORD PTR -10068[rbp], 0 ## (i == 0) 
	je	.L18
	
	mov	eax, DWORD PTR -10068[rbp] ## s[i - 1] == ' ')
	sub	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L17
.L18:
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 1] == 'o')
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 111
	jne	.L17
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 2] == 'r')
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 114
	jne	.L17
	
	mov	eax, DWORD PTR -10060[rbp] ## (i == l - 4)
	sub	eax, 4
	cmp	DWORD PTR -10068[rbp], eax
	je	.L19
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 3] == ' ')
	add	eax, 3
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L17
.L19:
	mov	eax, DWORD PTR -10036[rbp] ## X[3] += 1;
	add	eax, 1
	mov	DWORD PTR -10036[rbp], eax
	jmp	.L10
.L17:
	mov	eax, DWORD PTR -10068[rbp] ## s[i] == 'g'
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 103
	jne	.L10
	
	mov	eax, DWORD PTR -10060[rbp] ## (i <= l - 5)
	sub	eax, 4
	cmp	DWORD PTR -10068[rbp], eax
	jge	.L10
	
	cmp	DWORD PTR -10068[rbp], 0 ## (i == 0)
	je	.L20
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i - 1] == ' ')
	sub	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L10
.L20:
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 1] == 'o')
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 111
	jne	.L10
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 2] == 't')
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 116
	jne	.L10
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 3] == 'o')
	add	eax, 3
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 111
	jne	.L10
	
	mov	eax, DWORD PTR -10060[rbp] ## (i == l - 5)
	sub	eax, 5
	cmp	DWORD PTR -10068[rbp], eax
	je	.L21
	
	mov	eax, DWORD PTR -10068[rbp] ## (s[i + 4] == ' ')
	add	eax, 4
	cdqe
	movzx	eax, BYTE PTR -10016[rbp+rax]
	cmp	al, 32
	jne	.L10
.L21:
	mov	eax, DWORD PTR -10032[rbp] ## X[4] += 1;
	add	eax, 1
	mov	DWORD PTR -10032[rbp], eax
.L10:
	add	DWORD PTR -10068[rbp], 1 ## i+= 1
.L6:
	mov	eax, DWORD PTR -10068[rbp]
	cmp	eax, DWORD PTR -10060[rbp] ## сравниваем i, l
	jl	.L22 ## если меньше, повторяем цикл 
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT ## выводим "int, if, do, for, goto: "
	mov	DWORD PTR -10064[rbp], 0
	jmp	.L23 ## идем выводить массив
.L24:
	mov	eax, DWORD PTR -10064[rbp]
	cdqe
	mov	eax, DWORD PTR -10048[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT ## Выводим массив X
	add	DWORD PTR -10064[rbp], 1 ## i += 1
.L23:
	cmp	DWORD PTR -10064[rbp], 4 ## i <= 4
	jle	.L24 ## выводим еще, если i <= 4
	jmp	.L25 ## если i > 4
.L5:
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT ## Выводим "Пустой файл"
.L25:
	mov	rax, QWORD PTR -10056[rbp]
	mov	rdi, rax
	call	fclose@PLT ## закрываем файл
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
