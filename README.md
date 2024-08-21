# LISTA1-BD2

Questões sobre Funções (Functions):

1. Crie uma função chamada CalcularIdade que receba a data de nascimento de um cliente
e retorne à idade atual.

2. Crie uma função chamada VerificarEstoque que receba o ProdutoID e retorne a
quantidade em estoque daquele produto.

3. Crie uma função chamada CalcularDesconto que receba o ProdutoID e um percentual de
desconto, e retorne o preço final do produto após aplicar o desconto.

4. Crie uma função chamada ObterNomeCliente que receba o ClienteID e retorne o nome
completo do cliente.

5. Crie uma função chamada CalcularFrete que receba o valor total de um pedido e a cidade
do cliente. Se a cidade for "São Paulo", o frete deve ser 5% do valor do pedido; para outras
cidades, deve ser 10%. Use IF ELSE para definir a taxa de frete.

6. Crie uma função chamada CalcularPontos que receba um ClienteID e percorra todos os
pedidos do cliente. Para cada pedido, se o valor total for maior que R$ 100, adicione 10
pontos; se for menor ou igual, adicione 5 pontos. Retorne o total de pontos acumulados
pelo cliente. Use FOR e IF ELSE.


<H1> Questões sobre Procedimentos Armazenados (Stored Procedures): </H1>

1. Crie um procedimento chamado AtualizarEstoqueEmMassa que receba uma lista de
ProdutoID e uma quantidade a ser adicionada ao estoque de cada produto. O
procedimento deve usar um loop FOR para percorrer cada ProdutoID e atualizar o estoque.

2. Crie um procedimento chamado InserirCliente que insira um novo cliente na tabela
Clientes.

3. Crie um procedimento chamado RealizarPedido que insira um novo pedido na tabela
Pedidos e os itens correspondentes na tabela ItensPedido.

4. Crie um procedimento chamado ExcluirCliente que exclua um cliente da tabela Clientes e
todos os pedidos associados a esse cliente.

5. Crie um procedimento chamado AtualizarPrecoProduto que receba o ProdutoID e o novo
preço, e atualize o preço do produto na tabela Produtos

6. Crie um procedimento chamado InserirClienteComVerificacao que receba os dados de
um cliente (Nome, Email, DataNascimento, Cidade). Antes de inserir o cliente, verifique se
o email já existe na tabela Clientes. Se existir, não insira e retorne uma mensagem de erro.
Use DECLARE para declarar variáveis e IF ELSE para a verificação.
