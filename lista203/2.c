// s0 = a; s1 = b; s2 = c; s3 = d; s4 = e;

// a)
// add $s0, $s1, $s2
// add $s0, $s3, $s0 


// b) 
// sub $s0, $s1, $s2    
// add $s0, $s3, $s0       
// addi $s0, $s0, 4      
// sll $s0, $s0, 2

// c) 
// addi $s0, $s0, -1     
// sll $s1, $s1, 2        
// add $s2, $s0, $s1     

// d) 
// add $s0, $s1, $s2     
// addi $s0, $s0, 5       
// addi $s1, $s2, -4     
// sll $s3, $s4, 2 
// sub $s0, $s3, $s1