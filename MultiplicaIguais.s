.data
    Medida_01: .asciiz "Primeira Medida: "
    Medida_02: .asciiz " e Segunda Medida: "
    Pular_Linha: .asciiz "\n"
    Taxa_Aprendizado: .asciiz "Qual a taxa de aprendizado? "
    Mostrar_Taxa_Aprendizado: .asciiz "Taxa de Aprendizado - "
    Numero_Geracoes: .asciiz "Qual numero de gerações de teste? "
    Mostrar_Numero_Geracoes: .asciiz "Numero de gerações de teste - "
    Operacao: .asciiz " * " 
    Resultado: .asciiz " = " 
    
.text
    li $v0,4
    la $a0,Medida_01
    syscall
    
    li $v0,43
    syscall
    
    mov.s $f1,$f0
    
    li $v0,2 
    mov.s $f12,$f1
    syscall
  
    li $v0,4
    la $a0,Medida_02
    syscall
    
    li $v0,43 
    syscall
    
    mov.s $f2,$f0
    
    li $v0,2
    mov.s $f12,$f2 
    syscall
    
    li $v0,4
    la $a0,Pular_Linha
    syscall 

    li $v0,4
    la $a0,Taxa_Aprendizado 
    syscall
    
    li $v0,6
    syscall
    
    mov.s $f3,$f0
    
    li $v0,4
    la $a0,Mostrar_Taxa_Aprendizado
    syscall
    
    li $v0,2
    mov.s $f12,$f3
    syscall
    
    li $v0,4
    la $a0,Pular_Linha
    syscall

    li $v0,4
    la $a0,Numero_Geracoes
    syscall
    
    li $v0,5
    syscall
    
    move $s1,$v0
    
    li $v0,4
    la $a0,Mostrar_Numero_Geracoes
    syscall
    
    li $v0,1
    move $a0,$s1
    syscall
    
    li $v0,4
    la $a0,Pular_Linha
    syscall
    
    li $v0,4
    la $a0,Pular_Linha
    syscall  

    li $s0, 1
    addi $s1, $s1, 1
    	
    LACO1:
    slt $t0, $s0, $s1
    beq $t0, $zero, FIM_LACO1

    mtc1 $s0, $f12
    cvt.s.w $f12, $f12
    
    mul.s $f4, $f1, $f12
    mul.s $f5, $f2, $f12
    mul.s $f6, $f4, $f5
    mul.s $f7, $f12, $f12
    
    sub.s $f8, $f7, $f6

    mul.s $f9, $f3, $f12
    mul.s $f9, $f9, $f8
    add.s $f1, $f1, $f9

    mul.s $f10, $f3, $f12 
    mul.s $f10, $f10, $f8
    add.s $f2, $f2, $f10

    li $v0,4
    la $a0,Medida_01
    syscall
        
    li $v0,2
    mov.s $f12,$f1
    syscall   
    
    li $v0,4
    la $a0,Medida_02
    syscall
       
    li $v0,2
    mov.s $f12,$f2
    syscall 
    
    li $v0,4
    la $a0,Pular_Linha
    syscall     

    addi $s0, $s0, 1
    j LACO1
        
    FIM_LACO1:
    
    li $v0,4
    la $a0,Pular_Linha
    syscall

    li $s0, 1	
    LACO2:
    slt $t0, $s0, $s1
    beq $t0, $zero, FIM_LACO2

    mtc1 $s0, $f12
    cvt.s.w $f12, $f12
    
    mul.s $f4, $f1, $f12
    mul.s $f5, $f2, $f12
    mul.s $f6, $f4, $f5
         
    li $v0,1
    move $a0,$s0
    syscall   
    
    li $v0,4
    la $a0,Operacao
    syscall
       
    li $v0,1
    move $a0,$s0
    syscall
    
    li $v0,4
    la $a0,Resultado
    syscall
    
    li $v0,2
    mov.s $f12,$f6
    syscall       
    
    li $v0,4
    la $a0,Pular_Linha
    syscall

    addi $s0, $s0, 1
    j LACO2
        
    FIM_LACO2: