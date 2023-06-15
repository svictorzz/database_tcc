--TURMA: INF3GM
--TEMA: ESTACIONAMENTO 
--EQUIPE: 02
--INTEGRANTES: BRUNO DOS SANTOS SEVERINO, 03
--GIOVANNA ARCOVERDE DE SOUSA CONSTÂNCIO, 07
--LUCAS CALDAS DE SENNA, 19
--MONICK PEREIRA ZEITOUNIAN, 27
--VICTOR FERNANDES ASSIS DE SOUZA, 35

USE TCC_ESTACIONAMENTO;
GO

--sobre cargo--

insert into tb_Cargo values('Vigia', 'vigia', 'A')
insert into tb_Cargo values('Operador', 'operador', 'A')
insert into tb_Cargo values('Caixa', 'opera o caixa', 'A')
insert into tb_Cargo values('Gerente', 'gerência', 'A')
go

--sobre cargo--



--commit


--sobre cep--
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14781343', N'SP', N'Avenida 023 (Numeração com Zero Inicial)', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780090', N'SP', N'Rua 24 - até 1989/1990', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14783235', N'SP', N'Rua 24 - de 1991/1992 ao fim', N'Barretos', N'Fortaleza')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780640', N'SP', N'Rua 024 (Numeração com Zero Inicial)', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780330', N'SP', N'Avenida 25', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14781341', N'SP', N'Avenida 025 (Numeração com Zero Inicial)', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780630', N'SP', N'Rua 026 (Numeração com Zero Inicial)', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780340', N'SP', N'Avenida 27', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780110', N'SP', N'Rua 28 - até 1803/1804', N'Barretos', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14783218', N'SP', N'Rua 28 - de 1805/1806 ao fim', N'Barretos', N'Fortaleza')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'14780620', N'SP', N'Rua 028 (Numeração com Zero Inicial)', N'Barretos', N'Centro')

insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'06110100', N'SP', N'Av. das Flores', N'Osasco', N'Jardim das Flores')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'06013000', N'SP', N'Rua Antônio Agú', N'Osasco', N'Centro')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'06190120', N'SP', N'R. Alexandre Baptistone', N'Osasco', N'JQuitaúna')
insert [dbo].[tb_cep] ([CEP], [UF], [Descricao], [Cidade], [Bairro]) values (N'06086060', N'SP', N'Avenida Santo Antônio', N'Osasco', N'Vila Osasco')


--sobre estacionamento--
insert into tb_Estacionamento values('06110100', 'S3 Estacionamento', '616', '','60', '-23.534089', '-46.791324' )
insert into tb_Estacionamento values('06013000', 'Maxi Park', '1023', '','70', '-23.536240', '-46.780535' )
insert into tb_Estacionamento values('06190120', 'Estacionamento & Lava Rápido', '140', '','80', '-23.527066', '-46.797048' )
insert into tb_Estacionamento values('06086060', 'Ponto Certo Estacionamento', '4212', '','90', '-23.545087', '-46.775770' )

--sobre func--

insert into tb_Funcionario values( 2,  'Joaquim', '501294636', '46451330545', '551141426604', '5511984527684', 'foto', 'jojo_qui@gmail.com', '11-10-1998', 'M', 1000.00 , ' ', '16', 'A', 14780340)
insert into tb_Funcionario values( 4,  'Aline', '504975365', '43260119809', '551140028922', '5511945652313', 'foto1', 'aline_contato@gmail.com', '06-09-1999', 'F', 3500.00 , 'Bloco A', '12', 'A', 14780110)
insert into tb_Funcionario values( 3,  'Eliseu', '543469177', '25963710812', '123456789012', '1234567890123', 'foto2', 'eliseu2000@gmail.com', '10-02-2000', 'M', 1000.00 , ' ', '15', 'A', 14781343)

--sobre func--


--sobre usuario--
go
insert into tb_Usuario_Func values('Adm1234', 'Adm1234','1', 'A', 1)
insert into tb_Usuario_Func values('Adm2345', 'Adm2345','2', 'A', 2)
insert into tb_Usuario_Func values('Adm3456', 'Adm3456','1', 'A', 3)

--sobre usuario--
select * from tb_Usuario_Func where nome_usuario = 'Adm1234'
--sobre cliente--

begin transaction;
insert into tb_Cliente(nome_cli, email_cli, tel_cli, cel_cli, numero_cli, complemento_cli, status_cli, tipo_cli, qntd_vagas, cep)
values('cleber','cleber@gmail.com','551123456789','5511934567890','12','Bloco A','A','F',1, 14781343)
insert into tb_ClienteFisico(id_cli,cpf_cli,rg_cli,data_nasc_cli,sexo_cli)
values(@@identity,'12345678901','1234567890', '12-12-2000','M')
commit;

begin transaction;
insert into tb_Cliente(nome_cli, email_cli, tel_cli, cel_cli, numero_cli, complemento_cli, status_cli, tipo_cli,qntd_vagas, cep)
values('jose','jose@gmail.com','551138594565','5511975348604','13','casa','A','F',1 , 14780620)
insert into tb_ClienteFisico(id_cli,cpf_cli,rg_cli,data_nasc_cli,sexo_cli)
values(@@identity,'12345678902','1234567880', '12-12-2000','M')
commit;

begin transaction;
insert into tb_Cliente(nome_cli, email_cli, tel_cli, cel_cli, numero_cli, complemento_cli, status_cli, tipo_cli,qntd_vagas, cep)
values('carla','carlinha@gmail.com','551138594545','5511985348604','14','casa','A','F',2, 14780620)
insert into tb_ClienteFisico(id_cli,cpf_cli,rg_cli,data_nasc_cli,sexo_cli)
values(@@identity,'12345678903','1234567870', '10-11-2000','F')
commit;

begin transaction;
insert into tb_Cliente(nome_cli, email_cli, tel_cli, cel_cli, numero_cli, complemento_cli, status_cli, tipo_cli,qntd_vagas, cep)
values('cleber','cleber@gmail.com','551123456789','551123456789','12','Bloco A','A','J',1, 14781343)
insert into tb_ClienteJuridico(id_cli,razaoSocial_cli,ie_cli,cnpj_cli,webSite_cli)
values(@@identity,'1000000000','1234567850', '12345678901','cleber.com.br')
commit;

begin transaction;
insert into tb_Cliente(nome_cli, email_cli, tel_cli, cel_cli, numero_cli, complemento_cli, status_cli, tipo_cli, qntd_vagas, cep)
values('jose','jose@gmail.com','551138594565','5511975348604','13','casa','A','J',2, 14780620)
insert into tb_ClienteJuridico(id_cli,razaoSocial_cli,ie_cli,cnpj_cli,webSite_cli)
values(@@identity,'1000000000','1234567850', '12345678901','jose.com.br')
commit;

begin transaction;
insert into tb_Cliente(nome_cli, email_cli, tel_cli, cel_cli, numero_cli, complemento_cli, status_cli, tipo_cli,qntd_vagas, cep)
values('joao','joao@gmail.com','551138594545','5511985348604','14','casa','A','J',1, 14780620)
insert into tb_ClienteJuridico(id_cli,razaoSocial_cli,ie_cli,cnpj_cli,webSite_cli)
values(@@identity,'1000000000','1234567850', '12345678901','carla.com.br')
commit;

--sobre cliente--

--sobre usuario cliente--

go
insert into tb_Usuario_Mensalista values('Cli1234', 'Cli1234', 'A', 1)
insert into tb_Usuario_Mensalista values('Cli2345', 'Cli2345', 'A', 2)
insert into tb_Usuario_Mensalista values('Cli3456', 'Cli3456', 'A', 3)
go

--sobre usuario cliente--

--sobre veiculo--

insert into tb_fabricante values('fiat', 'C:\Users\nickbook\Documents\TCC\fiat_icone.png', 'A')
insert into tb_fabricante values('jeep', 'C:\Users\nickbook\Documents\TCC\jeep_icone.png', 'A')
insert into tb_fabricante values('honda', 'C:\Users\nickbook\Documents\TCC\honda_icone.png', 'A')
go

insert into tb_Modelo values('uno', 1,'A')
insert into tb_Modelo values('compass', 2,'A')
insert into tb_Modelo values('civic', 3,'A')
go

insert into tb_veiculo values('abc1234', 1, 'batido no canto inferior esquerdo frontal', 1, 'azul', '1999', 'A', 1)
insert into tb_veiculo values('bcd2345', 2, 'riscado', 2, 'vermelho', '2015', 'A', 2)
insert into tb_veiculo values('cde3456', 3, 'riscado', 3, 'preto', '2000', 'A', 3)
insert into tb_veiculo values('def4567', 3, 'riscado', 3, 'preto', '2000', 'A', 3)
insert into tb_veiculo values('efg5678', 1, 'riscado', 1, 'preto', '2000', 'A', 3)
go

--sobre veiculo--

--sobre operacao--

--quando o veículo chega no estacionamento(cliente avulso)
--permanencia e valor são incluidos apenas depois, através de um update
insert into tb_Operacao(placa_op_avulso, data_hora_entrada_op, id_modelo, cor, id_fabricante, status_op, tipo_op) values ('DIY6467', GETDATE(), 1, 'branco', 1, 'A', 'A')
insert into tb_Operacao(placa_op_avulso, data_hora_entrada_op, id_modelo, cor, id_fabricante, status_op, tipo_op) values ('ASD1234', GETDATE(), 3, 'preto', 3, 'A', 'A')
insert into tb_Operacao(placa_op_avulso, data_hora_entrada_op, id_modelo, cor, id_fabricante, status_op, tipo_op) values ('DFC3454', GETDATE(), 2, 'vermelho', 2, 'A', 'A')
go
--entrada com veículo mensalista
insert into tb_Operacao(placa_op_mensalista, data_hora_entrada_op, status_op, tipo_op) values('abc1234', GETDATE(), 'A', 'M' )
insert into tb_Operacao(placa_op_mensalista, data_hora_entrada_op, status_op, tipo_op) values('bcd2345', GETDATE(), 'A', 'M' )
insert into tb_Operacao(placa_op_mensalista, data_hora_entrada_op, status_op, tipo_op) values('cde3456', GETDATE(), 'A', 'M' )
go
--sobre operacao--

select * from tb_Veiculo
select * from tb_Operacao

select count(placa_op_mensalista) from tb_Operacao where status_op = 'I'

select count(tb_Operacao.placa_op_mensalista) from tb_Veiculo inner join tb_Operacao
on tb_Veiculo.placa_carro = tb_Operacao.placa_op_mensalista
where tb_Veiculo.id_cli = 3 and tb_Operacao.status_op = 'A'

select qntd_vagas from tb_Cliente where id_cli = 3



--sobre forma de pag--
insert into tb_Forma_Pagto values('débito', 'A')
insert into tb_Forma_Pagto values('crédito', 'A')
insert into tb_Forma_Pagto values('dinheiro', 'A')
go
--sobre forma de pag--


--sobre estacionamento--
insert into tb_Estacionamento values('14781343', '09', 'Bloco C', '50', '200', '300')
insert into tb_Estacionamento values('14780110', '21', 'Bloco G', '100', '300', '400')
insert into tb_Estacionamento values('14783235', '16', 'Bloco D', '75', '400', '500')
go
--sobre estacionamento--


--sobre vaga--
insert into tb_Vaga values('A', '1')
insert into tb_Vaga values('A', '3')
insert into tb_Vaga values('A', '2')
go
--sobre vaga--


--sobre preco--
insert into tb_Preco values(5.12, 15, 30.00, 250.00, 150.00, 15.00, 8.00)
--tabela precisa de somente um insert.
go
--sobre preco--
select * from tb_Cliente

--sobre mensalidade
select DATEDIFF(DD, data_mensalidade, data_vencimento ) from tb_Mensalidade where id_cli = 1

select (select preco_mensal_dia_todo from tb_Preco where id_preco = 1)*(select qntd_vagas from tb_Cliente where id_cli = 3)

insert into tb_Mensalidade values( 3, 3, 1, getdate(), DATEADD(MM, 1, getdate()), null, ((select preco_mensal_dia_todo from tb_Preco where id_preco = 1)*(select qntd_vagas from tb_Cliente where id_cli = 3)), 'N')

insert into tb_Mensalidade values( 3, 3, 1, getdate(), DATEADD(MM, 1, (select max(data_vencimento) from tb_Mensalidade where id_cli = 3)), null,200.00, 'N')

select * from tb_Mensalidade

--sobre mensalidade

	select * from tb_Mensalidade where id_cli = (select id_cli from tb_cliente where nome_cli = 'joao')

	select id_cli from tb_cliente where nome_cli = 'joao'

	select count(*) from tb_Usuario_Func where id_func = 1

	select * from tb_Veiculo

--sobre conta--

insert into tb_Conta values('Jorge', '10-08-2018', '100100100', 'Sabesp', 'Água', 'Conta referente ao pagemento de água', 'A', '11-08-2018', 100.00, 10.00, 1)
insert into tb_Conta values('Jaqueline', '09-08-2018', '120100100', 'Eletropaulo', 'Luz', 'Pagamento da conta de luz', 'A', '11-08-2018', 100.00, 0.00, 2)
insert into tb_Conta values('Boby', '07-08-2018', '123100100', 'Leroy Merlin', 'Ferramentas', 'Compra de ferramentas', 'A', '11-08-2018', 10.00, 0.00, 3)
go
--sobre conta--

--UPDATE tb_Operacao
--SET data_hora_saida_op = GETDATE(),
--permanencia = (SELECT DATEDIFF(MINUTE , data_hora_entrada_op, getdate()) FROM tb_Operacao WHERE id_op = 2)
--WHERE id_op = '2' --ou 2

select C.*, J.* from tb_Cliente C, tb_ClienteJuridico J where C.id_cli = J.id_cli and C.id_cli = 4
select C.*, J.* from tb_Cliente C, tb_ClienteJuridico J where C.id_cli = J.id_cli and C.id_cli = 17
select C.*, F.* from tb_Cliente C, tb_ClienteFisico F where C.id_cli = F.id_cli and C.id_cli = 16


