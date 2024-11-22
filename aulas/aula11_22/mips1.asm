# int main(){... return 0;}
MAIN:
addi $s0, $0, 4
jal SOMAVET


# int somavet(int vet[], int n){
#	int ac = 0;
#	for (int i = 0; i < n; i++){
#		ac += vet[i];	
#	}
#	return ac;
# }

SOMAVET:
addi $sp, $sp, -8
sw $s0, 0($sp)
sw $s1, 4($s1) # salvando o estado antes da chamada

and $s0, $0, $0 # ac = 0
add $s1, $0, $0
LOOP:
	slt $t0, $s1, $a1 # t0 = i < n
	beq $t0, $0, EXIT # se i >= n : EXIT
	sll $t1, $s1, 2 # t1 = i * 4
	add $t1, $s1, $a0 # t1 = &vet[i]
	lw $t2, 0($t1) # t2 = vet[i]
	add $s0, $s0, $t2 # ac = ac + vet[i]
	addi $s1, $s1, 1
	j LOOP
EXIT:
add $v0, $s0, $0
lw $s0, 0($sp) # logando o estado depois da execução
lw $s1, 4($s1)
addi $sp, $sp, 8
jr $ra