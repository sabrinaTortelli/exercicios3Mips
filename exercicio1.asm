#####################################################################Disciplina: Arquitetura e Organiza��o de Processadores
#Atividade: Avalia��o 03 � Programa��o em Linguagem de Montagem
#Exerc�cio 01
#Aluna: Sabrina dos Passos Tortelli
#C�digo em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o in�cio do segmento de 
                                    # dados, onde declaramos todas as 
                                    # vari�veis envolvidas.

msg_x:.asciiz "Entre com o valor de x: "  # mensagem para entrada do
                                          # x               
               
msg_y:.asciiz "Entre com o valor de y: "  # mensagem para entrada do
                                          # y  

msg_saida:.asciiz "A soma de x e y e igual a: " # mensagem de sa�da de
                                               # dados             

####################################################################
# SEGMENTO DE C�DIGO                                                           
####################################################################

    .text                  # Informa o in�cio do segmento de c�digo, 
                           # onde fica o programa.

     j   main              # goto Main

sum:
       add $v1, $s0, $s1   # $v1 = x + y
       jr  $ra             # retorna do procedimento

main:                      # O in�cio do programa

    li $v0, 4              # carrega o servi�o 4 (print string)
    la $a0, msg_x          # carrega ptr para string msg_x         
    syscall                # chama o servi�o

    addi $v0, $0, 5        # carrega o servi�o 5 (ler inteiro)
    syscall                # chama o servi�o
    add $s0, $0, $v0       # carrega o retorno em $s0

    li $v0, 4              # carrega o servi�o 4 (print string)
    la $a0, msg_y          # carrega ptr para string msg_y         
    syscall                # chama o servi�o

    addi $v0, $0, 5        # carrega o servi�o 5 (ler inteiro)
    syscall                # chama o servi�o
    add $s1, $0, $v0       # carrega o retorno em $s1

    jal sum                # chama o procedimento soma
    
    li $v0, 4              # carrega o servi�o 4 (print string)
    la $a0, msg_saida      # carrega ptr para string msg_saida         
    syscall                # chama o servi�o

          addi $v0, $0, 1        # carrega o servi�o 1 (print inteiro)
    add $a0, $0, $v1       # carrega o retorno do procedimento em $a0
    syscall                # chama o servi�o

####################################################################

