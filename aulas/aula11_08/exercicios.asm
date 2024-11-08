#1)
add $t2, $t0, $t1 # i+j
sll $t2, $t2, 2 # transforma i+j em desvio
add $t2, $t2, $s2 # seta o edereço de D[i+j]
lw $t3, 0($t2) # load D[i+j]

WHILE: slt $t4, $t3, $s0 # D[i+j] < a
bne $t4, $0, EXIT
add $t3, $t3, $s1 # D[i+j] += b
sw $t3, 0($t2)
j WHILE
EXIT:

#2)
and $t0, $0, $0
FOR_i: slt $t2, $t1, $s0 # i < a = 1
and $t1, $0, $0
FOR_j: slt $t3, $t1, $s1 # j < b = 1
add $t4, $t0, $t1 # i+j
sll $t5, $t4, 2 # transforma i+j em desvio
add $t5, $t4, $s2 # seta &D[i+j]
sw $t4, 0($t5) # D[i+j] = i+j
addi $t1, $t1, 1
j FOR_j
addi $t0, $t0, 1
j FOR_i
