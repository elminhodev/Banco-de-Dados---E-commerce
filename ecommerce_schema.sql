create database ecommerce;
use ecommerce;

CREATE TABLE idCliente (
  idCliente INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Endereço VARCHAR(255) NOT NULL,
  Pessoa_Física_idPessoa_Física INT NOT NULL,
  Pessoa_Jurídica_idPessoa_Jurídica INT NOT NULL,
  PRIMARY KEY (idCliente)
);

CREATE TABLE idPedido (
  idPedido INT NOT NULL AUTO_INCREMENT,
  Status_do_Pedido VARCHAR(50) NOT NULL,
  Descrição TEXT NOT NULL,
  Cliente_idCliente INT NOT NULL,
  Frete DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idPedido),
  FOREIGN KEY (Cliente_idCliente) REFERENCES idCliente(idCliente)
);

CREATE TABLE idProduto (
  idProduto INT NOT NULL AUTO_INCREMENT,
  Categoria VARCHAR(100) NOT NULL,
  Descrição TEXT NOT NULL,
  Valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idProduto)
);

CREATE TABLE idFornecedor (
  idFornecedor INT NOT NULL AUTO_INCREMENT,
  Razão_Social VARCHAR(255) NOT NULL,
  CNPJ VARCHAR(18) NOT NULL UNIQUE,
  PRIMARY KEY (idFornecedor)
);

CREATE TABLE Estoque (
  idEstoque INT NOT NULL AUTO_INCREMENT,
  Produto_idProduto INT NOT NULL,
  Quantidade INT NOT NULL,
  Localização VARCHAR(255) NOT NULL,
  PRIMARY KEY (idEstoque),
  FOREIGN KEY (Produto_idProduto) REFERENCES idProduto(idProduto)
);

CREATE TABLE Terceiro_Vendedor (
  idTerceiro_Vendedor INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  CNPJ VARCHAR(18) NOT NULL UNIQUE,
  PRIMARY KEY (idTerceiro_Vendedor)
);

CREATE TABLE Pessoa_Física (
  idPessoa_Física INT NOT NULL AUTO_INCREMENT,
  CPF VARCHAR(14) NOT NULL UNIQUE,
  Nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (idPessoa_Física)
);

CREATE TABLE Pessoa_Jurídica (
  idPessoa_Jurídica INT NOT NULL AUTO_INCREMENT,
  CNPJ VARCHAR(18) NOT NULL UNIQUE,
  Razão_Social VARCHAR(255) NOT NULL,
  PRIMARY KEY (idPessoa_Jurídica)
);