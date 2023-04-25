INSERT INTO categoria (categoria) VALUES
  ('Restaurante'),
  ('Pizzaria'),
  ('Bar');

INSERT INTO estabelecimento (nome, id_categoria, descricao, site, imagem, inicio_funcionamento, fim_funcionamento, dias_funcionamento, menu_url, tipo_pagamento) VALUES
  ('Restaurante Delícia', 1, 'Comida caseira deliciosa', 'http://www.restaurantedelicia.com.br', 'restaurante.jpg', '08:00:00', '22:00:00', 'Segunda a sábado', 'http://www.restaurantedelicia.com.br/menu', 'Dinheiro, Cartão de Crédito, Cartão de Débito'),
  ('Pizzaria Massa Fina', 2, 'As melhores pizzas da cidade', 'http://www.pizzariamassafina.com.br', 'pizzaria.jpg', '17:00:00', '23:00:00', 'Terça a domingo', 'http://www.pizzariamassafina.com.br/cardapio', 'Dinheiro, Cartão de Crédito'),
  ('Bar do João', 3, 'Ambiente descontraído e animado', 'http://www.bardojoao.com.br', 'bar.jpg', '18:00:00', '02:00:00', 'Todos os dias', 'http://www.bardojoao.com.br/cardapio', 'Dinheiro, Cartão de Crédito, Cartão de Débito');

INSERT INTO endereco (id_estabelecimento, rua, numero, bairro, cidade, cep, estado, pais) VALUES
  (1, 'Rua das Flores', 123, 'Sao Joao', 'São Paulo', '01234-567', 'São Paulo', 'Brasil'),
  (2, 'Rua dos Sabores', 456, 'Bom Retiro', 'São Paulo', '04567-890', 'São Paulo', 'Brasil'),
  (3, 'Avenida da Alegria', 789, 'Limas', 'Rio de Janeiro', '23456-789', 'Rio de Janeiro', 'Brasil');
  
INSERT INTO contato (email, telefone, id_estabelecimento) VALUES
  ('contato@restaurantedelicia.com.br', '(11) 1234-5678', 1),
  ('contato@pizzariamassafina.com.br', '(11) 2345-6789', 2),
  ('contato@bardojoao.com.br', '(21) 3456-7890', 3);

INSERT INTO cupons (codigo, data_validade, descricao, id_estabelecimento)
VALUES
  ('CUPOM123', '2023-05-01', 'Desconto de 10% em qualquer prato do cardápio', 1),
  ('PIZZA456', '2023-06-30', 'Ganhe uma pizza grande na compra de uma pizza média', 2),
  ('CERVEJA789', '2023-08-31', 'Compre 3 cervejas e ganhe uma porção de batatas fritas', 3);
  
INSERT INTO usuario (nome, email, senha) VALUES 
  ('João', 'joao@gmail.com', 'senha123'),
  ('Maria', 'maria@gmail.com', 'senha456'),
  ('Pedro', 'pedro@gmail.com', 'senha789');

INSERT INTO donoEstabelecimento (id_usuario, id_estabelecimento)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);
  
INSERT INTO avaliacao 
(id_estabelecimento, id_usuario, comentarios, nota, data_avaliacao) 
VALUES 
('2', '1', 'Muito bom atendimento e ambiente agradável', '4', '2023-04-20'),
('2', '2', 'Comida saborosa e preço justo', '5', '2023-04-22'),
('1', '1', 'O lugar é bonito, mas a comida não foi tão boa', '3', '2023-04-23'),
('1', '2', 'Serviço impecável e pratos maravilhosos', '5', '2023-04-24');

insert into lugaresvisitados(id_usuario, id_estabelecimento, favorito) 
values (1, 3, true), (1, 2, false), (1, 1, true);
