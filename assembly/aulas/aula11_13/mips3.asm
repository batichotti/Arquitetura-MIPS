mult:
addi $sp, $sp, -16
sw $a0, 16($sp)
sw $a1, 8($sp)
sw $ra, 4($sp)
sw $s0, 0($sp)
add $s0, $0, $0
add $t0, $0, $0
FOR: slt $t1, $t0, $a1
add $a0, $s0, $0
addi $a1, $a0, $0
jal soma
lw $a0, 16($sp)
lw $a1, 8($sp)
add $s0, $v0, $0 j FOR
add $v0, $s0, $0
lw $ra, 4($sp)
lw $s0, 0($sp)
addi $sp, $sp, 16
jr $ra