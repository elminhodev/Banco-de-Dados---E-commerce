create database oficina;
use oficina;

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Identificacao VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45) NOT NULL
);

CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    ano INT NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    valorTotal VARCHAR(45) NOT NULL,
    statusPagamento VARCHAR(45) NOT NULL
);

CREATE TABLE Ordem_de_Servico (
    idOrdem_de_Servico INT AUTO_INCREMENT PRIMARY KEY,
    dataAbertura VARCHAR(45) NOT NULL,
    dataEntregaPrevista VARCHAR(45) NOT NULL,
    status VARCHAR(45) NOT NULL,
    idPagamento INT NOT NULL,
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL,
    preco FLOAT NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL,
    preco FLOAT NOT NULL
);

CREATE TABLE Mao_de_Obra (
    idMao_de_Obra INT AUTO_INCREMENT PRIMARY KEY,
    preco FLOAT NOT NULL
);

CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    especialidade VARCHAR(45) NOT NULL,
    idMao_de_Obra INT NOT NULL,
    FOREIGN KEY (idMao_de_Obra) REFERENCES Mao_de_Obra(idMao_de_Obra)
);

CREATE TABLE Equipe (
    idOrdem_de_Servico INT NOT NULL,
    idMecanico INT NOT NULL,
    PRIMARY KEY (idOrdem_de_Servico, idMecanico),
    FOREIGN KEY (idOrdem_de_Servico) REFERENCES Ordem_de_Servico(idOrdem_de_Servico),
    FOREIGN KEY (idMecanico) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE Ordem_de_Servico_has_Servico (
    idOrdem_de_Servico INT NOT NULL,
    idServico INT NOT NULL,
    PRIMARY KEY (idOrdem_de_Servico, idServico),
    FOREIGN KEY (idOrdem_de_Servico) REFERENCES Ordem_de_Servico(idOrdem_de_Servico),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);

CREATE TABLE Mecanico_has_Ordem_de_Servico (
    idMecanico INT NOT NULL,
    idOrdem_de_Servico INT NOT NULL,
    PRIMARY KEY (idMecanico, idOrdem_de_Servico),
    FOREIGN KEY (idMecanico) REFERENCES Mecanico(idMecanico),
    FOREIGN KEY (idOrdem_de_Servico) REFERENCES Ordem_de_Servico(idOrdem_de_Servico)
);
