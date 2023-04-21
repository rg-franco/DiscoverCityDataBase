INSERT INTO categoria (categoria) VALUES
  ('Restaurante'),
  ('Pizzaria'),
  ('Bar');

INSERT INTO estabelecimento (nome, id_categoria, media_nota, descricao, site, imagem, inicio_funcionamento, fim_funcionamento, dias_funcionamento, hora_funcionamento, menu_url, tipo_pagamento) VALUES
  ('Restaurante Delícia', 1, 4.5, 'Comida caseira deliciosa', 'http://www.restaurantedelicia.com.br', 'restaurante.jpg', '08:00:00', '22:00:00', 'Segunda a sábado', '08:00 - 22:00', 'http://www.restaurantedelicia.com.br/menu', 'Dinheiro, Cartão de Crédito, Cartão de Débito'),
  ('Pizzaria Massa Fina', 2, 4.0, 'As melhores pizzas da cidade', 'http://www.pizzariamassafina.com.br', 'pizzaria.jpg', '17:00:00', '23:00:00', 'Terça a domingo', '17:00 - 23:00', 'http://www.pizzariamassafina.com.br/cardapio', 'Dinheiro, Cartão de Crédito'),
  ('Bar do João', 3, 3.5, 'Ambiente descontraído e animado', 'http://www.bardojoao.com.br', 'bar.jpg', '18:00:00', '02:00:00', 'Todos os dias', '18:00 - 02:00', 'http://www.bardojoao.com.br/cardapio', 'Dinheiro, Cartão de Crédito, Cartão de Débito');

INSERT INTO endereco (id_estabelecimento, rua, numero, cidade, cep, estado, pais) VALUES
  (1, 'Rua das Flores', 123, 'São Paulo', '01234-567', 'São Paulo', 'Brasil'),
  (2, 'Rua dos Sabores', 456, 'São Paulo', '04567-890', 'São Paulo', 'Brasil'),
  (3, 'Avenida da Alegria', 789, 'Rio de Janeiro', '23456-789', 'Rio de Janeiro', 'Brasil');

INSERT INTO contato (email, telefone, id_estabelecimento) VALUES
  ('contato@restaurantedelicia.com.br', '(11) 1234-5678', 1),
  ('contato@pizzariamassafina.com.br', '(11) 2345-6789', 2),
  ('contato@bardojoao.com.br', '(21) 3456-7890', 3);
