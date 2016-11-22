	.arch armv5te
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"ldrinsn.c"
	.text
	.align	2
	.global	ldrinsntest
	.type	ldrinsntest, %function
ldrinsntest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push {r4}
	cmp	r0, r1
	movge   r4, r2
	ldrge	sl, [r4, #8]!
	push    {r4, r5, r6}
	pop     {r4, r5, r6}
	push    {r4, r5, r6, sl, fp, lr}
	pop     {r4, r5, r6, sl, fp}
	pop     {r0}
	mov	r0, r4
	pop {r4}
	bx	lr
	.size	ldrinsntest, .-ldrinsntest
