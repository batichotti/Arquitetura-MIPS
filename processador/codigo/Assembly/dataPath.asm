j MAIN

SOMA:
  #Corpo da Fun��o
  add $s2, $a0, $s2
  
  #Retorno para MULT
  jr $ra

MULT:
  #Salvando Valores na Pilha
 addi $sp, $sp, -12
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
   
  #Inicializando Vari�veis
 addi $s2, $zero, 0 #int c = 0 // $s2 = c
  
  #Corpo da Fun��o
  MULT_LOOP:
  #La�o de Repeti��o MULT // while(b != 0)
  beq $a1, $zero, MULT_LOOP_EXIT # // Sai do La�o MULT se $a1 for igual a 0
   
  #Corpo do La�o
  #Chamada de SOMA
  jal SOMA
   
 addi $a1, $a1, -1 #b-- // $a1 = b
  
   #Retorno ao La�o
   j MULT_LOOP
    
  #Sa�da do La�o MULT
  MULT_LOOP_EXIT:
  
  #Sa�da da Fun��o
  #Salvamento de Vari�veis
  add $v0, $zero, $s2 #return c // $v0 = c
  
  #Recupera��o de Valores da Pilha
   lw $ra, 0($sp)
   lw $s0, 4($sp)
   lw $s1, 8($sp)
 addi $sp, $sp, 12
     
  #Retorno para MAIN
   jr $ra
   
   SHIFT_LEFT:
   #Salvando Valores na Pilha
 addi $sp, $sp, -20
  sw $s0, 0($sp)
  sw $s1, 4($sp)
  sw $s2, 8($sp)
  sw $s3, 12($sp)
  sw $s4, 16($sp)
  
  #Corpo da Fun��o
  SL_LOOP:
  #La�o de Repeti��o SL // while(n > 0)
  slt $t2, $zero, $a3 #(n > 0) // $t2 = Flag se 0 for menor que $a3(n)
  bne $t2, 1, SL_LOOP_EXIT # // Sai do La�o SL se $t2 for diferente de 1
  
  #Corpo do La�o
  sll $a2, $a2, 1 #v = v << 1 // $a2 = v
  
 addi $a3, $a3, -1 #n-- // $a3 = n
  
  #Retorno ao La�o
  j SL_LOOP
  
  #Sa�da do La�o SL
  SL_LOOP_EXIT:
  
  #Sa�da da Fun��o
  #Salvamento de Vari�veis
  add $v1, $zero, $a2 #return v // $v1 = v
  
  #Recupera��o de Valores da Pilha
   lw $s0, 0($sp)
   lw $s1, 4($sp)
   lw $s2, 8($sp)
   lw $s3, 12($sp)
   lw $s4, 16($sp)
 addi $sp, $sp, 20
     
  #Retorno para MAIN
   jr $ra

MAIN:
  #inicializando Vari�veis
 addi $s0, $zero, 7 #int a = 7 // $s0 = a
 addi $s1, $zero, 6 #int b = 6 // $s1 = b
  
  #IF b // if(b < 0)
  B_IF:
  slt $t0, $s1, $zero #(b < 0) // $t0 = Flag se $s1(b) for menor que 0
  bne $t0, 1 B_IF_EXIT # // Sai do IF b se $t0 for diferente de 1
  
  #Corpo do IF b
  sub $s1, $zero, $s1 #b *= -1 // $s1 = b

  #Sa�da do IF b
  B_IF_EXIT:
  
  #IF a // if(!(a >= 0))
  A_IF:
  slt $t1, $s0, $zero #(!(a >= 0)) // $t1 = Flag se $s0(a) for menor que 0
  beq $t1, $zero, A_IF_EXIT # // Sai do IF a se $t1 for igual a 0
  
  #Corpo do IF a
  sub $s0, $zero, $s1 #a * = -1 // $s0 = a
  
  #Sa�da do IF a
  A_IF_EXIT:
  
  #Chamada de MULT
  #Salvando Vari�veis
  add $a0, $zero, $s0 #$a0 = a
  add $a1, $zero, $s1 #$a1 = b
  
  jal MULT #mult(a, b)
  
  #Retorno de MULT
  #Recuperando Vari�veis
  add $s2, $zero, $v0 #int c = mult(a, b); // $s2 = c
  
  #Inicializando Vari�veis pt2
 addi $s3, $zero, 2 #int v = 2 // $s3 = v
 addi $s4, $zero, 5 #int n = 5 // $s4 = n
 
  #Chamada de SHIFT_LEFT
  #Salvando Vari�veis
  add $a2, $zero, $s3 #$a2 = v
  add $a3, $zero, $s4 #$a3 = n
  
  jal SHIFT_LEFT #shiftLeft(v, n)
  
  #Retorno de SHIFT_LEFT
  #Recuperando Vari�veis
  add $s5, $zero, $v1 # int d = shiftLeft(v, n) // $s5 = d