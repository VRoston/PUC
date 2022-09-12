'''
CRIANDO A BIBLIOTECA PARA ROBÓTICA COMPUTACIONAL
'''

import numpy as np

#def cria_vetor(vlist: list)->np.arrey:

def cria_vetor3(vlist):
    #testa se a lista tem no minimo tres elementos
    if len(vlist)==3:
        print('OK')
        return

    raise ValueError("A sua lista dewveria ter 3 posições")


#if('__name__'=='__main__'):
print('Inicinado os tesstes')
lista=[1,2,3]
cria_vetor3(lista)

try:
    lista2 = [1,2]
    cria_vetor3(lista2)
except ValueError as ve:
    print('ops, deu erro')
    print(ve)

print('Terminou os testes')