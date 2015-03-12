	;; Copied from http://wiki.osdev.org/Bare_Bones_with_NASM
MBALIGN     equ  1<<0
MEMINFO     equ  1<<1
FLAGS  	    equ  MBALIGN | MEMINFO
MAGIC       equ  0x1BADB002
CHECKSUM    equ -(MAGIC + FLAGS)


section .multiboot
	align 4
	dd MAGIC
	dd FLAGS
	dd CHECKSUM


section .bootstrap_stack
	align 4
stack_bottom:
	times 16384 db 0
stack_top:
 
section .text
	global __go_register_gc_roots
	global __go_runtime_error
	global _start
	
_start:
	mov esp, stack_top
 	extern go.kernel.Kmain
	call go.kernel.Kmain
 	cli
.hang:
	hlt
	jmp .hang

	;; Keeps go happy
__go_register_gc_roots:
__go_runtime_error:
	ret
