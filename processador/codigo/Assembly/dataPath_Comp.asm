j MAIN

SOMA: add $s2, $a0, $s2
jr $ra

MULT: addi $sp, $sp, -16
sw $ra, 0($sp)
sw $s0, 4($sp)
sw $s1, 12($sp)
addi $s2, $zero, 0

MULT_LOOP: beq $a1, $zero, MULT_LOOP_EXIT
jal SOMA
addi $a1, $a1, -1
j MULT_LOOP

MULT_LOOP_EXIT: add $v0, $zero, $s2
lw $ra, 0($sp)
lw $s0, 4($sp)
lw $s1, 12($sp)
addi $sp, $sp, 16
jr $ra

SHIFT_LEFT: addi $sp, $sp, -24
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 12($sp)
sw $s3, 16($sp)
sw $s4, 20($sp)

SL_LOOP: slt $t2, $zero, $a3
bne $t2, 1, SL_LOOP_EXIT
sll $a2, $a2, 1
addi $a3, $a3, -1
j SL_LOOP

SL_LOOP_EXIT: add $v1, $zero, $a2
lw $s0, 0($sp)
lw $s1, 4($sp)
lw $s2, 12($sp)
lw $s3, 16($sp)
lw $s4, 20($sp)
addi $sp, $sp, 24
jr $ra

MAIN: addi $s0, $zero, 7
addi $s1, $zero, 6

B_IF: slt $t0, $s1, $zero
bne $t0, 1 B_IF_EXIT
sub $s1, $zero, $s1

B_IF_EXIT: 
A_IF: slt $t1, $s0, $zero
beq $t1, $zero, A_IF_EXIT
sub $s0, $zero, $s1

A_IF_EXIT: add $a0, $zero, $s0
add $a1, $zero, $s1
jal MULT
add $s2, $zero, $v0
addi $s3, $zero, 2
addi $s4, $zero, 5
add $a2, $zero, $s3
add $a3, $zero, $s4
jal SHIFT_LEFT
add $s5, $zero, $v1

END:
add $s5, $s5, $0
j END
