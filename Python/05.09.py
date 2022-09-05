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