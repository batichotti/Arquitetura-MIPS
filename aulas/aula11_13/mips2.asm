EXEMPLO:
addi $sp, $sp, -4
sw $s0, 0($sp)

add $t0, $a0, $a1
add $t1, $s2, $s3
sub $s0, $t0, $t1

add $v0, $s0, $0

lw $s0, 0($sp)
addi $sp, $sp, 4
jr $ra