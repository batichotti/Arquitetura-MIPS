# while (save[i] == k) { i += 1 };
LOOP:
sll $t0, $s3, 2
add $t0, $t0, $s6 # t0 = &save[i]
lw $t1, 0($t0) #t1 = save[i]
bne $t1, $s5, EXIT
addi $s3, $s3, 1 # i++;
j LOOP
EXIT: