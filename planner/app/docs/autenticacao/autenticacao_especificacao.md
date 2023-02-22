# Funcionalidades
Notas: 
- Quando o tamanho em tela for 0 a informação não aparece na tela
- Gerado pela aplicação significa que a informação é calculado pela aplicação
- Gerenciado pela aplicação signfica que a informação é gerenciada pela aplicação sem iteração do usuário
## Entidades
### Conta de Usuário
- Efetua o CRUD das informações do usuário
### Autenticação
- Responsável pela autenticação do usuário


# Casos De Usos

## CDU01 - Autenticar
1.  Aplicação Apresenta Tela de Login com  "BD01 - Informações de Autenticação" e as ações " SF01 - Login","SF05 - Cancelar"e "SF03 - Login com Autenticação de Terceiros" e as opções "SF04 - Criar Conta" e "SF05 - Recuperar Senha"
2. Caso o Usuário informe email e senha e opte por Login<br>
    2.1. - Aplicação executa "SF06 - Obter dados de usuário de API" <br>
    2.2. - Fim
3. Caso o usuário opte por "Cancelar"<br>
    3.1 Aplicação executa SF02 - Cancelar <br>
    3.2 A aplicação retorna para o passo 1
4. Caso Usuário opte por "Login com provedor"<br>
    4.1 Aplicação executa "SF03 - Login com provedor"
5. Caso Usuário opte por "Criar usuário"
    4.1 Aplicação executa "SF04 -  Criar Conta"


### SF01 - Login 
1.


### SF02 - Cancelar 
1.


### SF03 - Login com provedor
1.


### SF04 - Criar Conta
1. Aplicação apresenta tela com as informações BD02 - Criação de Conta


### SF05 - Recuperar Senha
1.


### SF06 - Obter dados de usuário de API 
1. Aplicação envia para api as informações
2. - Aplicação obtém resposta da API
3. - Caso a aplicação exista token
    3.1 - Aplicação obtém token
    3.2 - Aplicação armazena token nas preferências
    3.3 - Aplicação executa SF06 - Obtém dados de Usuário da Api
    3.4 - Aplicação redireciona para funcionalidade Home
    3.5 - Fim


### FE01 - Dados Inválidos

### FE02 - Erro de provedor

### FE03 - Api não Disponível



#### BD01 - Informações de Autenticação
|Informação | Valor Programático | Tipo | Tamanho Tela | Tamanho em Banco|<center> Obrigatório <br> /<br>Requerido</center> | Notas |
| --| --|--|--|--|--|--|
|Login| login | String| 120| 160| Sim| email,CPF ou Usuário|
|Senha| senha | String| 20| 128| Sim| Mínimo 8 caracteres, Uma letra Maiúsculas um caracter especial|




#### BD02 - Criação de Conta

|Informação | Valor Programático | Tipo | Tamanho Tela | Tamanho em Banco|<center> Obrigatório <br> /<br>Requerido</center> | Notas |
| --| --|--|--|--|--|--|
|Id| id | String| 10| 10| Sim | |
|Nome| nome | String| 80| 160| Sim | |
|Email| email | String| 80| 160| Sim | |
|Login| login | String| 20| 120| Sim | |
|Senha| senha | String| 20| 128|  Sim | |
|Token| token | String| 0| 128|  Sim | Gerado pela aplicação|
|validade| data_validade | DateTime| 0| NA |  Sim | Data gerada pela aplicação |
|Criado em | criacao_data | DateTime| 0| 128|  Sim | Gerado pela aplicação|
|Atualizado em | atualizacao_data | DateTime| 0| 128|  Sim | Gerenciado pela aplicação|
|Situação| situacao | situacao | 0| 128|  Sim | Gerenciado pela aplicação|
