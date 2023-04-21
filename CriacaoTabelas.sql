drop schema if exists db_discoveryCity;

create schema db_discoveryCity;

use db_discoveryCity;

CREATE TABLE categoria (
    id INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE estabelecimento (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_categoria INT NOT NULL,
    media_nota FLOAT,
    descricao TEXT,
    site VARCHAR(100),
    imagem VARCHAR(100),
    inicio_funcionamento time,
    fim_funcionamento time,
    dias_funcionamento VARCHAR(30),
    hora_funcionamento VARCHAR(50),
    menu_url VARCHAR(100),
    tipo_pagamento VARCHAR(100),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    PRIMARY KEY (id)
);

CREATE TABLE endereco (
    id INT NOT NULL AUTO_INCREMENT,
    id_estabelecimento int,
    rua VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro varchar(50) not null,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
    ON DELETE CASCADE
);

CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE donoEstabelecimento (
    id_usuario int not null,
    id_estabelecimento INT NOT NULL,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
    ON DELETE CASCADE,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    CONSTRAINT pk_donoEstabelecimento PRIMARY KEY (id_usuario, id_estabelecimento)
);

CREATE TABLE lugaresVisitados (
    id_usuario INT NOT NULL,
    id_estabelecimento INT NOT NULL,
    favorito boolean,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
);

CREATE TABLE avaliacao (
    id INT NOT NULL AUTO_INCREMENT,
    id_estabelecimento INT NOT NULL,
    id_usuario int not null,
    comentarios VARCHAR(100),
    nota float,
    data_avaliacao date,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
    ON DELETE CASCADE,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    PRIMARY KEY (id)
);

CREATE TABLE contato (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    id_estabelecimento INT NOT NULL,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
    ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE cupons (
  id INT PRIMARY KEY auto_increment,
  codigo VARCHAR(10),
  data_validade DATE,
  descricao VARCHAR(255),
  id_estabelecimento INT,
  FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
  ON DELETE CASCADE
);

