INSERT INTO categoria (categoria) VALUES
('Comida Japonesa'),
('Comida Italiana'),
('Comida Brasileira'),
('Comida Mexicana'),
('Comida Indiana'),
('Comida Árabe'),
('Cafeteria'),
('Churrascaria'),
('Pizzaria'),
('Hamburgueria');

/* Inserindo os endereços */
INSERT INTO endereco (rua, numero, cidade, cep, estado, pais) VALUES
('Rua A', 123, 'São Paulo', '01234-567', 'São Paulo', 'Brasil'),
('Rua B', 456, 'Rio de Janeiro', '98765-432', 'Rio de Janeiro', 'Brasil'),
('Rua C', 789, 'Belo Horizonte', '45678-901', 'Minas Gerais', 'Brasil'),
('Rua D', 321, 'Curitiba', '76543-210', 'Paraná', 'Brasil'),
('Rua E', 654, 'Salvador', '54321-098', 'Bahia', 'Brasil'),
('Rua F', 987, 'Recife', '21098-765', 'Pernambuco', 'Brasil'),
('Rua G', 246, 'Porto Alegre', '89012-345', 'Rio Grande do Sul', 'Brasil'),
('Rua H', 135, 'Fortaleza', '32109-876', 'Ceará', 'Brasil'),
('Rua I', 864, 'Natal', '65432-109', 'Rio Grande do Norte', 'Brasil'),
('Rua J', 279, 'Brasília', '10987-654', 'Distrito Federal', 'Brasil');

/* Inserindo os estabelecimentos */
INSERT INTO estabelecimento (id_endereco, nome, id_categoria, media_nota, descricao, site, imagem, data_abertura, hora_funcionamento, menu_url, tipo_pagamento) VALUES
(1, 'Restaurante do Japa', 1, 0, 'Restaurante japonês com opções de sushi, sashimi e pratos quentes.', 'www.restaurantedojapa.com.br', 'www.restaurantedojapa.com.br/menu', '2020-01-01', '11:00 - 23:00', 'menujapa.pdf', 'Cartão de crédito, débito e dinheiro'),
(2, 'Pasta & Vino', 2, 0, 'Restaurante italiano com massas artesanais e carta de vinhos selecionados.', 'www.pastaevino.com.br', 'www.pastaevino.com.br/menu', '2019-05-15', '12:00 - 22:00', 'menupastaevino.pdf', 'Cartão de crédito e débito'),
(3, 'Bar do Mineiro', 3, 0, 'Restaurante de comida brasileira com opções de pratos típicos mineiros.', 'www.bardomineiro.com.br', 'www.bardomineiro.com.br/menu', '2018-07-30', '11:30 - 00:00', 'menubardomineiro.pdf', 'Cartão de crédito, débito e dinheiro');



