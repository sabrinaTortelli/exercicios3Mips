#####################################################################Disciplina: Arquitetura e Organização de Processadores
#Atividade: Avaliação 03 – Programação em Linguagem de Montagem
#Exercício 01
#Aluna: Sabrina dos Passos Tortelli
#Código em Assembly
####################################################################
# SEGMENTO DE DADOS                                                            
####################################################################

   .data                            # Informa o início do segmento de 
                                    # dados, onde declaramos todas as 
                                    # variáveis envolvidas.

msg_x:.asciiz "Entre com o valor de x: "  # mensagem para entrada do
                                          # x               
               
msg_y:.asciiz "Entre com o valor de y: "  # mensagem para entrada do
                                          # y  

msg_saida:.asciiz "A soma de x e y e igual a: " # mensagem de saída de
                                               # dados             

####################################################################
# SEGMENTO DE CÓDIGO                                                           
####################################################################

    .text                  # Informa o início do segmento de código, 
                           # onde fica o programa.

     j   main              # goto Main

sum:
       add $v1, $s0, $s1   # $v1 = x + y
       jr  $ra             # retorna do procedimento

main:                      # O início do programa

    li $v0, 4              # carrega o serviço 4 (print string)
    la $a0, msg_x          # carrega ptr para string msg_x         
    syscall                # chama o serviço

    addi $v0, $0, 5        # carrega o serviço 5 (ler inteiro)
    syscall                # chama o serviço
    add $s0, $0, $v0       # carrega o retorno em $s0

    li $v0, 4              # carrega o serviço 4 (print string)
    la $a0, msg_y          # carrega ptr para string msg_y         
    syscall                # chama o serviço

    addi $v0, $0, 5        # carrega o serviço 5 (ler inteiro)
    syscall                # chama o serviço
    add $s1, $0, $v0       # carrega o retorno em $s1

    jal sum                # chama o procedimento soma
    
    li $v0, 4              # carrega o serviço 4 (print string)
    la $a0, msg_saida      # carrega ptr para string msg_saida         
    syscall                # chama o serviço

          addi $v0, $0, 1        # carrega o serviço 1 (print inteiro)
    add $a0, $0, $v1       # carrega o retorno do procedimento em $a0
    syscall                # chama o serviço

####################################################################

