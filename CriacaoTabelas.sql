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
    media_nota FLOAT default 0.00,
    descricao TEXT,
    site VARCHAR(100),
    imagem VARCHAR(100),
    inicio_funcionamento time,
    fim_funcionamento time,
    dias_funcionamento VARCHAR(30),
    menu_url VARCHAR(100),
    tipo_pagamento VARCHAR(100),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    PRIMARY KEY (id)
);

CREATE TABLE endereco (
    id_estabelecimento int primary key,
    rua VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro varchar(50) not null,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
    ON DELETE CASCADE
);

CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE donoEstabelecimento (
    id_usuario int not null,
    id_estabelecimento INT NOT NULL,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
    ON DELETE CASCADE,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    CONSTRAINT pk_donoEstabelecimento PRIMARY KEY clustered (id_usuario, id_estabelecimento)
);

CREATE TABLE lugaresVisitados (
    id_usuario INT NOT NULL,
    id_estabelecimento INT NOT NULL,
    favorito boolean default false,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
);

CREATE TABLE avaliacao (
    id INT NOT NULL AUTO_INCREMENT,
    id_estabelecimento INT NOT NULL,
    id_usuario int not null,
    comentarios VARCHAR(100),
    nota float,
    data_avaliacao date default null,
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
  data_inicio DATE,
  data_validade DATE,
  descricao VARCHAR(255),
  valido boolean default true,
  id_estabelecimento INT,
  FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id)
  ON DELETE CASCADE
);

