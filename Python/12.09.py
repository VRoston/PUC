'''
CRIANDO A BIBLIOTECA PARA ROBÓTICA COMPUTACIONAL
'''

import numpy as np

#def cria_vetor3(vlist: list)->np.arrey:
def cria_vetor3(vlist):
    #testa se a lista tem no minimo tres elementos
    if len(vlist)==3:
        for item in vlist:
            try:
                n=int(item)
            except:
                raise ValueError('valores')
        #cria matriz vazia com numpy
        res=np.zeros([3,1])
        for cl in range(0, len(vlist)):
            res[c1,0]=vlist[cl]
        print('OK')
        return res
    raise ValueError("A sua lista deveria ter 3 posições")

def checa_vetor3(m):
    #Função para checa vetor não seja 3,1
    #   se não for 3,1 gerar uma excessão
    if m.shape != (3,1):
        raise ValueError("Seu vetor deve ter 3 linhas e 1 coluna")

def produto_escalar(v1,v2)
    return np.sum(v1*v2)

#if('__name__'=='__main__'):
print('Inicinado os testes')
lista=[1,2,3]
cria_vetor3(lista)
print('teste 1 finalizado\n')
lista2=[1,2,3]
cria_vetor3(lista2)
print('teste 2 finalizado\n')

try:
    lista3 = [1,2]
    cria_vetor3(lista2)
except ValueError as ve:
    print('ops, deu erro')
    print(msg)
print('Teste 3 finalizado\n')

try:
    list4 = ['case','if','else']
    cria_vetor3(list3)
except ValueError as msg:
    print(msg)
print('teste 4 finalizado\n')

try:
    list5=[0.2,3.5]
    res=cria_vetor3(lista5)
    print(res)
    checa_vetor3(res)
except ValueError as msg
    print(msg)
print('teste 5 finalizado\n')
print('Terminou os testes')