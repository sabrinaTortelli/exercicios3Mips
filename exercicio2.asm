#####################################################################Disciplina: Arquitetura e Organização de Processadores
#Atividade: Avaliação 03 – Programação em Linguagem de Montagem
#Exercício 02
#Aluna: Sabrina dos Passos Tortelli
#Código em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o início do segmento de 
                                    # dados, onde declaramos todas as 
                                    # variáveis envolvidas.

msg_saida:.asciiz "A soma dos numeros e igual a: " # mensagem de saída
                                                  # de dados             


####################################################################
# SEGMENTO DE CÓDIGO                                                           
####################################################################

    .text                     # Informa o início do segmento de
                              # código, onde fica o programa.

	 j   main	

sum:
       sub $sp, $sp, 12       # ajusta a pilha para 3 valores
       sw  $s2, 8($sp)        # salva o conteúdo de $s2
       sw  $s1, 4($sp)        # salva o conteúdo de $s1 
       sw  $s0, 0($sp)        # salva o conteúdo de $s0

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
      

       addi $s0, $zero, 7     # inicializa 1º parâmetro num1
       addi $s1, $zero, 8     # inicializa 2º parâmetro num2
       addi $s2, $zero, 9     # inicializa 3º parâmetro num3

       jal sum                # chama o procedimento

       li $v0, 4              # carrega o serviço 4 (print string)
       la $a0, msg_saida      # carrega ptr para string msg_saida         
       syscall                # chama o serviço

                 addi $v0, $0, 1        # carrega o serviço 1 (print inteiro)
       add $a0, $0, $v1       # carrega o serviço em $a0
       syscall                # chama o serviço

####################################################################



