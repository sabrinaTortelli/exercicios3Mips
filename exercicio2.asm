#####################################################################Disciplina: Arquitetura e Organiza��o de Processadores
#Atividade: Avalia��o 03 � Programa��o em Linguagem de Montagem
#Exerc�cio 02
#Aluna: Sabrina dos Passos Tortelli
#C�digo em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o in�cio do segmento de 
                                    # dados, onde declaramos todas as 
                                    # vari�veis envolvidas.

msg_saida:.asciiz "A soma dos numeros e igual a: " # mensagem de sa�da
                                                  # de dados             


####################################################################
# SEGMENTO DE C�DIGO                                                           
####################################################################

    .text                     # Informa o in�cio do segmento de
                              # c�digo, onde fica o programa.

	 j   main	

sum:
       sub $sp, $sp, 12       # ajusta a pilha para 3 valores
       sw  $s2, 8($sp)        # salva o conte�do de $s2
       sw  $s1, 4($sp)        # salva o conte�do de $s1 
       sw  $s0, 0($sp)        # salva o conte�do de $s0

       add $a0, $zero, $s0    # $a0 = $s0
       add $a1, $zero, $s1    # $a1 = $s1
       add $a2, $zero, $s2    # $a2 = $s2

       add $t0, $a0, $a1      # $t0 = num1 + num2
       add $v1, $t0, $a2      # $v1 = $t0 + num3 (retorna sum)

       lw  $s0, 0($sp)        # restaura $s0 da pilha
       lw  $s1, 4($sp)        # restaura $s1 da pilha
       lw  $s2, 8($sp)        # restaura $s2 da pilha
       add $sp, $sp, 12       # ajusta a pilha
       jr  $ra                # retorna do procedimento

main:    
      

       addi $s0, $zero, 7     # inicializa 1� par�metro num1
       addi $s1, $zero, 8     # inicializa 2� par�metro num2
       addi $s2, $zero, 9     # inicializa 3� par�metro num3

       jal sum                # chama o procedimento

       li $v0, 4              # carrega o servi�o 4 (print string)
       la $a0, msg_saida      # carrega ptr para string msg_saida         
       syscall                # chama o servi�o

                 addi $v0, $0, 1        # carrega o servi�o 1 (print inteiro)
       add $a0, $0, $v1       # carrega o servi�o em $a0
       syscall                # chama o servi�o

####################################################################



