drop schema if exists db_discoveryCity;

create schema db_discoveryCity;

use db_discoveryCity;

CREATE TABLE categoria (
    id INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE endereco (
    id INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE estabelecimento (
    id INT NOT NULL AUTO_INCREMENT,
    id_endereco INT NOT NULL,
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
    FOREIGN KEY (id_endereco) REFERENCES endereco(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    PRIMARY KEY (id)
);

CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_categoria int,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    PRIMARY KEY (id)
);

CREATE TABLE login (
	usuario_id int not null,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    PRIMARY KEY (usuario_id)
);

CREATE TABLE donoEstabelecimento (
    id_usuario int not null,
    id_estabelecimento INT NOT NULL,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id),
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
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    PRIMARY KEY (id)
);

CREATE TABLE contato (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    id_estabelecimento INT NOT NULL,
    FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento(id),
    PRIMARY KEY (id)
);
