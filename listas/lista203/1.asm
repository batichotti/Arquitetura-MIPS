# $s0 = a; $s1 = b; $s2 = c; $s3 = d; $s4 = e;

# a) a = b;
add $s0, $s1, $zero

# b) a = b + c;
add $s0, $s1, $s2

# c) a = b + c + d;
add $t0, $s1, $s2
add $s0, $t0, $s3

# d) a = b - (c + d) - e;
add $t0, $s2, $s3
sub $t0, $s1, $t0
sub $s0, $t0, $s4

# e) a = b + (c - 5);
addi $t0, $s2, -5
add $s0, $s1, $t0

# f) a = (b + c) - (d - 1);
addi $t0, $s3, -1
add $t1, $s1, $s2
sub $s0, $t1, $t0

# g) a = (b - 1) + d; c = a + c;
addi $t0, $s1, -1
add $s0, $t0, $s3
add $s2, $s2, $s0

# h) a = e - (b - c); d = a + 10;
sub $t0, $s1, $s2
sub $s0, $s4, $t0
addi $s3, $s1, 10

# i) a += b - c; d = a + 10;
sub $t0, $s1, $s2
add $s0, $s0, $t0
addi $s3, $s0, 10