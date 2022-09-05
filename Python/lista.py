print("Listas")

lista = []       #Lista vazia

lista.append(10)
lista.insert(1,20)
print(lista)
lista.append(10)
lista.insert(1,20)
print(lista)
#percorre a lista

print(len(lista))
for i in range(0,len(lista)):
    print(list[i], end=' ')
print()

for item in lista:
    print(item , end=' ')

'''
Criando procedimentos e funcoes
'''

def multiplica(a,b=10):
    c=a*b
    print(f',valor de c e:{c}')


multiplica(10,40)
multiplica(b=20,a=10)
import funcoes
print(funcoes.soma(20,40))
import funcoes as fc
print(fc.soma(8,8))
from funcoes import soma
print(soma(9,8))
import math

vet=(10,20,30)
print(vet*3)
import numpy as np
vet2 = np.array([10,20,30])
print(vet2.shape)
print(vet2)

a=np.array([1],[2],[3])
print(a)