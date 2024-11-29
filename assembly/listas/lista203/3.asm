# $s0 = f; $s1 = g; $s2 = h; $s3 = i; $s4 = j;
# $s6 = &A[]; $s7 = &B[]

# a) 
# B[0] = A[1];
lw $t0, 4($s6)
sw $t0, 0($s7)

# b)
# B[i] = A[j];
sll $t0, $s4, 2
add $t0, $t0, $s6 # &A[j]
lw $t0, 0($t0)

sll $t1, $s3, 2
add $t1, $t1, $s7 # &B[i]

sw $t0, 0($t1)

# c)
# B[i + 1] = A[j * 2];

# d)
# B[8] = A[i - j];

# e)
# B[12] = A[i] + A[j];
