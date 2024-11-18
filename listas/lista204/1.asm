# $s0 = a; $s1 = b; $t0 = i; $t1 = j; $s2 = &D[]

# a) 
# if (a < b) {
#     i = j;
# } else {
#     i = 0;
# }
slt $t4, $s0, $s1 #retorna 1 se a for menor
beq $t4, $zero, ELSE
add $t0, $t1, $zero
j EXIT
ELSE: and $t0, $zero, $zero
EXIT:

# b)
# if (D[i] < b) {
#     D[i] += a;
# }
sll $t4, $t0, 2
add $t4, $t4, $s2
lw $t5, 0($t4)
slt $t6, $t5, $s1  # 1 se D[i] for menor q b
beq $t6, $zero, EXIT
add $t7, $t5, $s0
sw $t7, 0($t4)
EXIT:

# c)
# while (D[i] != 0) {
#     i++;
# }

LOOP:
sll $t5, $t0, 2
add $t5, $t5, $s2 # &D[i]
lw $t6, 0($t5)
beq $t6, $0, EXIT
addi $t0, $t0, 1
j LOOP
EXIT:

# d)
# if (D[i] < a) {
#     D[j] += b;
# } else {
#     D[i] += b;
# }

sll $t5, $t0, 2
add $t5, $t5, $s2 # &D[i]
lw $t6, 0($t5)
slt $t7, $t6, $s0
beq $t7, $0, ELSE
sll $t5, $t0, 2
add $t5, $t5, $s2 # &D[j]
lw $t6, 0($t5)
add $t6, $t6, $s1
sw $t6, 0($t5)
j EXIT
ELSE:
add $t6, $t6, $s1
sw $t6, 0($t5)
EXIT:

# e)
# if (D[i+j] < D[i]) {
#     D[i] += D[i+j];
#     D[i+j] = D[i] - D[i+j];
# } else {
#     D[i] -= D[i+j];
# }

sll $t5, $t0, 2
add $t6, $t5, $s2 # &D[i]
lw $t8, 0($t6)
add $t3, $t0, $t1
sll $t3, $t3, 2
add $t7, $t3, $s2 # &D[i+j]
lw $t9, 0($t7)
slt $t2, $t9, $t8
beq $t2, $0, ELSE

j EXIT
ELSE:
add $  
EXIT:

# f)
# while (D[i+j] < a)
# D[i+j] += b;

# g)
# for (i=0; i<a; i++)
# for (j=0; j<b; j++)
# D[4*j] = i + j;

# h)
# while (D[i] < 4)
# for (j=0; j<b; j+=a)
# D[i] = i + j;

# i)
# while (D[i] != 0) {
#     i++;
# }

# j)
# for (i = 0; i < a; i++) {
#     for (j = 0; j < b; j++) {
#         D[i + j] = i - j;
#     }
# }
