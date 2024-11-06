# $s0 = a; $s1 = b; $t0 = i; $t1 = j; $s2 = &D[]

# a) 
# if (a < b) {
#     i = j;
# } else {
#     i = 0;
# }
slt $t4, $s0, $s1 #retorn 1 se a for menor
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

# d)
# if (D[i] < a) {
#     D[j] += b;
# } else {
#     D[i] += b;
# }

# e)
# if (D[i+j] < D[i]) {
#     D[i] += D[i+j];
#     D[i+j] = D[i] - D[i+j];
# } else {
#     D[i] -= D[i+j];
# }

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
