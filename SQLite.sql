--Tabelass

CREATE TABLE Clientes (
    ClienteID INTEGER PRIMARY KEY,
    Nome TEXT NOT NULL,
    Email TEXT NOT NULL,
    DataNascimento DATE NOT NULL,
    Cidade TEXT NOT NULL
);

CREATE TABLE Produtos (
    ProdutoID INTEGER PRIMARY KEY,
    NomeProduto TEXT NOT NULL,
    Categoria TEXT NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INTEGER NOT NULL
);

CREATE TABLE Pedidos (
    PedidoID INTEGER PRIMARY KEY,
    ClienteID INTEGER,
    DataPedido DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensPedido (
    ItemID INTEGER PRIMARY KEY,
    PedidoID INTEGER,
    ProdutoID INTEGER,
    Quantidade INTEGER NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);


-- Questões sobre Funções (Functions)
-- CalcularIdade


SELECT Nome, 
       strftime('%Y', 'now') - strftime('%Y', DataNascimento) - 
       (strftime('%m-%d', 'now') < strftime('%m-%d', DataNascimento)) AS Idade 
FROM Clientes;

-- VerificarEstoque
SELECT NomeProduto, Estoque 
FROM Produtos 
WHERE ProdutoID = 1;

-- CalcularDesconto
SELECT NomeProduto, 
       Preco, 
       Preco * (1 - 0.10) AS PrecoComDesconto
FROM Produtos 
WHERE ProdutoID = 1;

-- ObterNomeCliente
SELECT Nome 
FROM Clientes 
WHERE ClienteID = 1;

-- CalcularFrete
SELECT PedidoID, 
       CASE 
           WHEN Cidade = 'cedro' THEN ValorTotal * 0.05
           ELSE ValorTotal * 0.10
       END AS Frete
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

-- CalcularPontos
SELECT ClienteID, 
       SUM(CASE 
               WHEN ValorTotal > 100 THEN 10
               ELSE 5
           END) AS PontosAcumulados
FROM Pedidos
GROUP BY ClienteID;


-- Questões sobre Procedimentos Armazenados (Stored Procedures)
-- AtualizarEstoqueEmMassa


UPDATE Produtos
SET Estoque = Estoque + 10
WHERE ProdutoID IN (1, 2, 3);

-- InserirCliente
INSERT INTO Clientes (Nome, Email, DataNascimento, Cidade)
VALUES ('Maria Eduarda', 'mariaeduardaaires@gmail.com', '2003-10-05', 'cedro');

-- RealizarPedido
INSERT INTO Pedidos (ClienteID, DataPedido, ValorTotal)
VALUES (1, '2024-08-21', 150.00);

-- ExcluirCliente
INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario)
VALUES (1, 1, 2, 50.00);

-- AtualizarPrecoProduto
DELETE FROM ItensPedido WHERE PedidoID IN (SELECT PedidoID FROM Pedidos WHERE ClienteID = 1);
DELETE FROM Pedidos WHERE ClienteID = 1;
DELETE FROM Clientes WHERE ClienteID = 1;

-- InserirClienteComVerificacao
UPDATE Produtos
SET Preco = 75.00
WHERE ProdutoID = 1;
-- verificação de email
INSERT INTO Clientes (Nome, Email, DataNascimento, Cidade)
SELECT 'Marcos', 'marcoswillian@gmail.com', '2003-06-07', 'cedro'
WHERE NOT EXISTS (SELECT 1 FROM Clientes WHERE Email = 'marcoswillian4000@gmail.com');
