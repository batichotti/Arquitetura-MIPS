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
sw $s1, 4($s1)

LOOP:


j LOOP
EXIT:
lw $s0, 0($sp)
lw $s1, 4($s1)
jr $ra