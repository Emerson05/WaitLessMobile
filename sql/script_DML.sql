INSERT INTO endereco (Cidade, Cep, Bairro, Logradouro, Numero, Complemento)
VALUES	('Recife', 520010140, 'Derby', 'Praça do Derby', 201, ''),
		('Recife', 50110727, 'Ipsep', 'Av. Recife', 2677, '' ),
        ('Recife', 50090310, 'Cabanga', 'Av. Saturnino de Brito', 385, ''),
        ('Recife', 50791430, 'Coqueiral', 'Rua Maquiné', 115, ''),
		('Recife', 51350350, 'Ipsep', 'Rua Teresópolis', 102, 'Proximo da Avenida Recife'),
        ('Recife', 52031213, 'Campo Grande', 'Travessa da Fronteira', 222, '');

INSERT INTO empresa (Cnpj, Nome, Tipo, Telefone, Hora_func, Dia_func, Endereco_id_Endereco)
VALUES	
		('34242464000126', 'Gildo Lanches', 'Lanchonete', '81986616896', '17:00 - 03:00' , 'Segunda - Domingo', 1), 
		('12784559000210', 'Pizzaria Atlantico', 'Restaurante', '8114313744', '11:00 - 23:00', 'Segunda - Domingo', 2),
		('31599146000200', 'Estelita Bar', 'Bar', '81989592973', '22:00 - 05:00' , 'Quinta - Domingo', 3);



INSERT INTO cliente (Cpf, Nome, Sobrenome, Email, Senha, Endereco_id_Endereco)
VALUES	(58900268449, 'Jaqueline', 'Cardoso', 'jaquelinesandracardoso@homail.com', 'HoIKM2wR8w', 4),
		(26733155435, 'Vinicius', 'Manuel da Costa', 'vinicius_dacosta@segplanet.com.br', 'drbfEL5X3z', 5),
        (89959710459, 'Raul', 'Fernando Santos', 'raul.fernando.santos@unicohost.com.br', '2XoksoxBfO', 6);



INSERT INTO lotacao (Empresa_Cnpj, Capacidade_total,Qtd_lugares, Data)
VALUES	('34242464000126', 40, 20, '2023-03-24'),
		('12784559000210', 120, 50, '2023-03-24'),
        ('31599146000200', 85, 20, '2023-03-24');
