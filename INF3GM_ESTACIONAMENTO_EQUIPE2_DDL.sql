--TURMA: INF3GM
--TEMA: ESTACIONAMENTO 
--EQUIPE: 02
--INTEGRANTES: BRUNO DOS SANTOS SEVERINO, 03
--GIOVANNA ARCOVERDE DE SOUSA CONSTÂNCIO, 07
--LUCAS CALDAS DE SENNA, 19
--MONICK PEREIRA ZEITOUNIAN, 27
--VICTOR FERNANDES ASSIS DE SOUZA, 35

USE master;

IF EXISTS(SELECT * FROM sys.databases WHERE NAME='TCC_ESTACIONAMENTO')
DROP DATABASE TCC_ESTACIONAMENTO
GO

CREATE DATABASE TCC_ESTACIONAMENTO
GO

USE TCC_ESTACIONAMENTO
GO


CREATE TABLE tb_Cargo (
id_cargo INT NOT NULL PRIMARY KEY identity(1,1),
nome_cargo VARCHAR(20) NOT NULL,
descricao_cargo VARCHAR(100) NOT NULL,
status_cargo char(1) not null,
)

GO

CREATE TABLE tb_Cep (
cep CHAR(8) primary key,
uf NVARCHAR(2) NOT NULL,
Descricao NVARCHAR(100) NOT NULL,
cidade NVARCHAR(40) NOT NULL,
bairro NVARCHAR(50) NOT NULL
)

GO

CREATE TABLE tb_Funcionario (
id_func INT NOT NULL PRIMARY KEY identity(1,1),
id_cargo INT NOT NULL,
nome_func VARCHAR(100) NOT NULL,
rg_func VARCHAR(10) NOT NULL,--
cpf_func CHAR(11) NOT NULL,
tel_func char(12) not null, 
cel_func char(13)  null,
foto_func VARCHAR(MAX) NOT NULL,--
email_func VARCHAR(60) NOT NULL,--
data_nasc_func DATE NOT NULL,
sexo_func CHAR(1) NOT NULL,
salario_func decimal(8,2) NOT NULL,
complemento_func VARCHAR(50) NULL,
numero_func varchar(10) NOT NULL,
status_func char(1) NOT NULL,
cep char(8) NOT NULL,
CONSTRAINT FK_ID_CARGO FOREIGN KEY (id_cargo) REFERENCES tb_Cargo(id_cargo),
CONSTRAINT fk_cep_func FOREIGN KEY (cep) REFERENCES tb_Cep(cep),

)

GO

CREATE TABLE tb_Usuario_Func (
id_usu INT NOT NULL PRIMARY KEY identity(1,1),
nome_usuario VARCHAR(30) NOT NULL,
senha_usuario VARCHAR(40) NOT NULL,
niveldeacesso char(1) not null, 
status_usu char(1) not null,
id_func INT NOT NULL,
CONSTRAINT FK_ID_FUNC FOREIGN KEY (id_func) REFERENCES tb_Funcionario(id_func)
)

GO


CREATE TABLE tb_Cliente (
id_cli INT PRIMARY KEY identity(1,1),
nome_cli VARCHAR(100) not null,
email_cli VARCHAR(40) NOT NULL,
tel_cli varchar(12) not null,		
cel_cli varchar(13)  null,
numero_cli varchar(10) NOT NULL,
complemento_cli VARCHAR(50) NULL,
status_cli char(1) not null,
tipo_cli CHAR(1) NOT NULL,
qntd_vagas smallint not null,
cep char(8) NOT NULL,
CONSTRAINT fk_cep_cli FOREIGN KEY (cep) REFERENCES tb_Cep(cep),
)
GO


GO
CREATE TABLE tb_ClienteJuridico (
id_cli INT FOREIGN KEY REFERENCES tb_Cliente,
razaoSocial_cli VARCHAR(100) not null,
ie_cli VARCHAR(20) NULL,
cnpj_cli CHAR(14) NOT NULL,
webSite_cli VARCHAR(40) NOT NULL,
)

GO
CREATE TABLE tb_ClienteFisico (
id_cli INT FOREIGN KEY REFERENCES tb_Cliente,
cpf_cli CHAR(11) NOT NULL,
rg_cli VARCHAR(10) NOT NULL,
data_nasc_cli DATE NOT NULL,
sexo_cli CHAR(1) NOT NULL,
)

GO

CREATE TABLE tb_Usuario_Mensalista (
id_usu INT NOT NULL PRIMARY KEY identity(1,1),
nome_usuario VARCHAR(30) NOT NULL,
senha_usuario VARCHAR(40) NOT NULL,
status_usu char(1) not null,
id_cli INT NOT NULL FOREIGN KEY REFERENCES tb_Cliente
)

GO


CREATE TABLE tb_Fabricante (
id_fabricante INT NOT NULL PRIMARY KEY identity(1,1),
nome_fabricante VARCHAR(50) NOT NULL,
logo_fabricante VARCHAR(max) NOT NULL,
status_fabricante char(1) not null,
)
go

CREATE TABLE tb_Modelo (
id_modelo INT NOT NULL PRIMARY KEY identity(1,1),
nome_modelo VARCHAR(20) NOT NULL,
id_fabricante INT FOREIGN KEY REFERENCES tb_fabricante NOT NULL,
status_modelo char(1) not null,
)
go

CREATE TABLE tb_Veiculo (
placa_carro CHAR(7) NOT NULL PRIMARY KEY,
id_fabricante INT FOREIGN KEY REFERENCES tb_fabricante,
descricao_carro VARCHAR(max) NULL,
id_modelo INT FOREIGN KEY REFERENCES tb_Modelo,
cor_carro VARCHAR(30) NOT NULL,
ano_carro CHAR(4) NULL,
status_vei char(1) not null,
id_cli INT NOT NULL FOREIGN KEY REFERENCES tb_Cliente
)



CREATE TABLE tb_Operacao(
id_op INT NOT NULL PRIMARY KEY identity(1,1),
placa_op_mensalista CHAR(7) FOREIGN KEY REFERENCES tb_veiculo null,
placa_op_avulso char(7) null, 
data_hora_entrada_op DATETIME NOT NULL,
data_hora_saida_op DATETIME NULL,--
id_modelo INT FOREIGN KEY REFERENCES tb_Modelo null, 
cor VARCHAR(20) null, 
id_fabricante INT FOREIGN KEY REFERENCES tb_Fabricante null,
valor_op DECIMAL(8,2) NULL,
permanencia VARCHAR(10) null,
status_op CHAR(1) NOT NULL,
tipo_op char(1) not null, 
descricao varchar(100) null --se o carro está batido ou algo do tipo

)

GO

CREATE TABLE tb_Forma_Pagto (
id_forma_pagto INT NOT NULL PRIMARY KEY identity(1,1),
nome_formaPGTO VARCHAR(50) NOT NULL,
status_forma_pagto char(1) not null,
)
go

CREATE TABLE tb_Preco (
id_preco INT NOT NULL PRIMARY KEY identity(1,1),
hora_preco decimal(8,2) NOT NULL,
min_tolerancia smallint not null,
diaria_preco decimal(8,2) not null, 
preco_mensal_dia_todo decimal(8,2) not null, 
preco_mensal_metade_dia decimal(8,2) not null,
metade_dia decimal(8,2) not null, 
valor_inicial decimal(8,2) not null
)
go

CREATE TABLE tb_Mensalidade (
id_mensal INT NOT NULL PRIMARY KEY identity(1,1),
--placa_carro char(7) NOT NULL, -- retirar placa e alterar inserts
id_cli INT NOT NULL,
id_forma_pagto INT NULL,
id_preco int not null, 
data_mensalidade date not null,
data_vencimento date not null,
data_pagto date null,
valor_total decimal(8,2) not null,
--qtd_vagas smallint not null, --adicionado quantidade de vagas para mensalidade MODIFICADO PARA A TABELA CLIENTE
status_mensalidade char(1) not null,
--CONSTRAINT FK_CAR FOREIGN KEY (placa_carro) REFERENCES tb_Veiculo(placa_carro),
CONSTRAINT FK_CLI_MENSAL FOREIGN KEY (id_cli) REFERENCES tb_Cliente(id_cli),
CONSTRAINT FK_FORMA_PAGTO FOREIGN KEY (id_forma_pagto) REFERENCES tb_Forma_Pagto(id_forma_pagto),
CONSTRAINT FK_PRECO FOREIGN KEY (id_preco) REFERENCES tb_Preco(id_preco)
)

GO


CREATE TABLE tb_Estacionamento (
id_esta INT PRIMARY KEY identity(1,1),
cep char(8) NOT NULL,
nome_esta VARCHAR(100) NOT NULL, --alterei
numero_esta VARCHAR(10) NOT NULL,
complemento_esta VARCHAR(50) NULL,
qtde_Vagas INT NOT NULL,
latitude VARCHAR(30) NOT NULL,
longitude VARCHAR(30) NOT NULL,
CONSTRAINT fk_cep_esta FOREIGN KEY (cep) REFERENCES tb_Cep(cep),
)





GO

CREATE TABLE tb_Vaga (
id_vaga INT NOT NULL PRIMARY KEY identity(1,1),
status_vaga CHAR(1) NOT NULL,
id_esta INT NOT NULL,
CONSTRAINT FK_ID_ESTA FOREIGN KEY (id_esta) REFERENCES tb_Estacionamento(id_esta)
)

go

CREATE TABLE tb_Conta (
id_conta INT NOT NULL PRIMARY KEY identity(1,1),
responsavel varchar(50) NOT NULL,
data_pagt DATE NOT NULL,
numero_doc_conta INT NOT NULL,
forn_conta VARCHAR(50) NOT NULL,
catgo_conta int NOT NULL,
descricao_conta VARCHAR(50) NULL,
status_conta CHAR(1) NOT NULL,
data_venc_conta DATE NOT NULL,
juros_conta decimal(8,2) null,
valor_conta decimal(8,2) not null,
id_esta INT NOT NULL
CONSTRAINT FK_ESTA_CONTA FOREIGN KEY (id_esta) REFERENCES tb_Estacionamento(id_esta)
)

go




CREATE TABLE tb_Reserva (
id_reserva INT NOT NULL PRIMARY KEY identity(1,1),
nome_reserva VARCHAR(150) NOT NULL,
email_reserva VARCHAR(60) NOT NULL,
cel_reserva CHAR(11) NOT NULL,
cpf_reserva varchar(11) NOT NULL, --alterei
status_reserva char(1) null,
marca_carro_reserva VARCHAR(30) NOT NULL,
modelo_carro_reserva VARCHAR(70) NOT NULL,
placa_carro_reserva CHAR(7) NOT NULL,
cor_carro_reserva VARCHAR(20) NOT NULL,
esta_reserva VARCHAR(100) NOT NULL, --alterei
data_hora_entrada_reserva DATETIME NOT NULL,
data_hora_saida_reserva DATETIME NOT NULL
)

go



CREATE TABLE tb_Contato (
id_contato INT NOT NULL PRIMARY KEY identity(1,1),
email_contato VARCHAR(100) NOT NULL,
mensagem_contato VARCHAR(max) NOT NULL,
nome_contato VARCHAR(100) NOT NULL,
status_mensagem_contato CHAR(1) NULL--Monick mudou
)
 
--select * from tb_Reserva

--select * from tb_Contato

--select * from tb_Estacionamento
