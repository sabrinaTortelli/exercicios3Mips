#####################################################################Disciplina: Arquitetura e Organização de Processadores
#Atividade: Avaliação 03 – Programação em Linguagem de Montagem
#Exercício 03
#Aluna: Sabrina dos Passos Tortelli
#Código em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o início do segmento de 
                                    # dados, onde declaramos todas as 
                                    # variáveis envolvidas.

vetor_A: .word 0,0,0,0,0,0,0,0      #declaração do vetor

msg_entrada:.asciiz "\nLEITURA DOS ELEMENTOS DO VETOR:"  # mensagem
                                                         # de chamada                                                
               
msg_vetor_A:.asciiz "\nEntre com vetor_A["# mensagem para entrada dos
                                          # elementos do vetor_A 

msg_vetor_A2:.asciiz "]: "          # mensagem para entrada dos
                                    # elementos do vetor_A

msg_saida:.asciiz "\nNumero de elementos nulos do vetor:" # mensagem
                                                          # saída 
                                                    
####################################################################
# SEGMENTO DE CÓDIGO                                                           
####################################################################

    .text                  # Informa o início do segmento de código, 
                           # onde fica o programa.

    j   main	            # goto main

nullElements:                 #procedimento nullElements

       sub $sp, $sp, 8        # ajusta a pilha para 2 valores 
       sw  $t2, 4($sp)        # salva o conteúdo de $t2(endereço base
                        # do vetor       
       sw  $s0, 0($sp)        # salva o conteúdo de $s0(length)

LoopNull:

       slt  $t0, $s2, $s0     #se i($s2)<$s0 então $t0=1 senão $t0=0
       beq  $t0, $zero, ExitNull # se $t0=0 então goto ExitNull
     
       lw $t2, 0($t1)         # $t2 = vetor_A[0]
      
       bne  $t2, $zero, Exit  # se $t2!=0 goto Exit
       addi $s1, $s1, 1       # cont++
       j   	Exit              # goto Exit

Exit:
       addi $s2, $s2, 1       # i++ (do laço for)
       add $t1, $s2, $s2      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s3      # $t1 = end. Base + 4*i = end. absoluto   
       
       j LoopNull             # goto LoopNull

ExitNull: 
     
       add $v1, $zero, $s1    # return cont

       lw  $s0, 0($sp)        # restaura $s0 da pilha
       lw  $t2, 4($sp)        # restaura $t2 da pilha
       add $sp, $sp, 8        # ajusta a pilha
       jr  $ra                # retorna do procedimento

main:                         # O início do programa

       la $s3, vetor_A        # carrega o vetor para $s3
	 addi $s0, $zero, 8     # declaração da variável $s0(length=8)
       addi $s1, $zero, 0     # declaração da variável $s1(cont=0)
       addi $s2, $zero, 0     # declaração da variável $s2(i=0)

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_entrada    # carrega ptr para string msg_entrada         
       syscall                # chama o serviço

LoopA: 
       slt $t0, $s2, $s0       # se i($s2)<$s0 então $t0=1 senão $t0=0
       beq  $t0, $zero, ExitA # se $t0=0 então goto ExitA

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_vetor_A    # carrega ptr para string msg_vetor_A         
       syscall                # chama o serviço

	 li $v0, 1              # carrega o serviço 1 (print inteiro)
       move $a0, $s2          # carrega int em $a0         
 syscall                # chama o serviço
       
       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_vetor_A2   # carrega ptr para string msg_vetor_A2         
       syscall                # chama o serviço
       
       add $t1, $s2, $s2      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s3      # $t1 = end. Base + 4*i = end. absoluto
       lw $t2, 0($t1)         # $t2 = A[0]
       
       li $v0, 5              # carrega o serviço 5 (lê inteiro)
       syscall                # chama o serviço
       add $t2, $v0, $0       # carrega leitura em $t2

       sw $t2, 0($t1)         # A[i] = $t2

       addi $s2, $s2, 1       # i++ (do laço for)
       j    LoopA             # goto LoopA

ExitA:  nop

       addi $s2, $zero, 0     # declaração da variável $s2(i=0)
       add $t1, $s2, $s2      # $t1 = 2*1
       add $t1, $t1, $t1      # $t1 = 4*1
       add $t1, $t1, $s3      # $t1 = end. Base + 4*i = end. absoluto
       lw $t2, 0($t1)         # $t2 = A[0]

       jal nullElements       # chama o procedimento nullElements

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_saida      # carrega ptr para string msg_saida         
       syscall                # chama o serviço

       addi $v0, $0, 1        # carrega o serviço 1 (print inteiro)
       add $a0, $0, $v1       # carrega o serviço em $a0
       syscall                # chama o serviço
 ####################################################################


