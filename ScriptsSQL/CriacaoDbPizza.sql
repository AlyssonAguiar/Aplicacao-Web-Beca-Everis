-- Primeiro passo criar o banco de dados

-- drop database if exists Pizza; Cuidado esse comando apaga todos os dados.

-- Esse comando deve ser usado sozinho em uma query unica ou executando apenas a linha.
-- create database Pizza;

use Pizza;

-- criar as tabelas principais que sejam idependentes de qualquer outra tabela

CREATE TABLE [dbo].[CLIENTE](
	[CPF] [varchar](11) NOT NULL,
	[NOME] [varchar](100) NOT NULL,
	[DATA_NASCIMENTO] [varchar](20) NULL,
	[TELEFONE] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ENDERECO](
	[IDENDERECO] [int] IDENTITY(1,1) NOT NULL,
	[IDCIDADE] [int] NOT NULL,
	[LOGRADOURO] [varchar](150) NOT NULL,
	[NUMERO] [int] NULL,
	[COMPLEMENTO] [varchar](150) NULL,
	[BAIRRO] [varchar](45) NOT NULL,
	[CEP] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDENDERECO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PEDIDO](
	[IDPEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](11) NOT NULL,
	[DATA_PEDIDO] [varchar](50) NULL,
	[PRECO_TOTAL] [decimal](18, 2) NOT NULL,
	[FORMA_DE_PAGAMENTO] [varchar](80) NOT NULL,
	[Status_Pedido] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PRODUTOS](
	[ID_PRODUTO] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NULL,
	[PRECO] [decimal](18, 2) NULL,
	[TAMANHO] [varchar](20) NOT NULL,
	[DESCRICAO] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PRODUTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ITEM](
	[IDITEM] [int] IDENTITY(1,1) NOT NULL,
	[IDPEDIDO] [int] NOT NULL,
	[QUANTIDADE] [int] NOT NULL,
	[PRECO_UNITARIO] [decimal](18, 0) NOT NULL,
	[ID_PRODUTO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDITEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CLIENTE_HAS_ENDERECO](
	[CPF] [varchar](11) NOT NULL,
	[IDENDERECO] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CLIENTE_HAS_ENDERECO]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO] FOREIGN KEY([IDENDERECO])
REFERENCES [dbo].[ENDERECO] ([IDENDERECO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

CREATE TABLE [dbo].[CIDADE](
	[IDCIDADE] [int] IDENTITY(1,1) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[NOME] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCIDADE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- altera��oes nas tabelas.

ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE] FOREIGN KEY([CPF])
REFERENCES [dbo].[CLIENTE] ([CPF])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [FK_CLIENTE]
GO

ALTER TABLE [dbo].[ITEM]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDO] FOREIGN KEY([IDPEDIDO])
REFERENCES [dbo].[PEDIDO] ([IDPEDIDO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ITEM] CHECK CONSTRAINT [FK_PEDIDO]
GO

ALTER TABLE [dbo].[CLIENTE_HAS_ENDERECO] CHECK CONSTRAINT [FK_ENDERECO]
GO

ALTER TABLE [dbo].[CLIENTE_HAS_ENDERECO]  WITH CHECK ADD  CONSTRAINT [FK_IDCLIENTE] FOREIGN KEY([CPF])
REFERENCES [dbo].[CLIENTE] ([CPF])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CLIENTE_HAS_ENDERECO] CHECK CONSTRAINT [FK_IDCLIENTE]
GO

-- preencher as tabelas com conteudo.

INSERT INTO CIDADE VALUES ('SC', 'Abdon Batista');
INSERT INTO CIDADE VALUES ('SC', 'Abelardo Luz');
INSERT INTO CIDADE VALUES ('SC', 'Agrolandia');
INSERT INTO CIDADE VALUES ('SC', 'Agronomica');
INSERT INTO CIDADE VALUES ('SC', 'Agua Doce');
INSERT INTO CIDADE VALUES ('SC', 'Aguas Brancas');
INSERT INTO CIDADE VALUES ('SC', 'Aguas Claras');
INSERT INTO CIDADE VALUES ('SC', 'Aguas de Chapeco');
INSERT INTO CIDADE VALUES ('SC', 'Aguas Frias');
INSERT INTO CIDADE VALUES ('SC', 'Aguas Mornas');
INSERT INTO CIDADE VALUES ('SC', 'Aguti');
INSERT INTO CIDADE VALUES ('SC', 'Aiure');
INSERT INTO CIDADE VALUES ('SC', 'Alfredo Wagner');
INSERT INTO CIDADE VALUES ('SC', 'Alto Alegre');
INSERT INTO CIDADE VALUES ('SC', 'Alto Bela Vista');
INSERT INTO CIDADE VALUES ('SC', 'Alto da Serra');
INSERT INTO CIDADE VALUES ('SC', 'Anchieta');
INSERT INTO CIDADE VALUES ('SC', 'Angelina');
INSERT INTO CIDADE VALUES ('SC', 'Anita Garibaldi');
INSERT INTO CIDADE VALUES ('SC', 'Anitapolis');
INSERT INTO CIDADE VALUES ('SC', 'Anta Gorda');
INSERT INTO CIDADE VALUES ('SC', 'Antonio Carlos');
INSERT INTO CIDADE VALUES ('SC', 'Apiuna');
INSERT INTO CIDADE VALUES ('SC', 'Arabuta');
INSERT INTO CIDADE VALUES ('SC', 'Araquari');
INSERT INTO CIDADE VALUES ('SC', 'Ararangua');
INSERT INTO CIDADE VALUES ('SC', 'Armazem');
INSERT INTO CIDADE VALUES ('SC', 'Arnopolis');
INSERT INTO CIDADE VALUES ('SC', 'Arroio Trinta');
INSERT INTO CIDADE VALUES ('SC', 'Arvoredo');
INSERT INTO CIDADE VALUES ('SC', 'Ascurra');
INSERT INTO CIDADE VALUES ('SC', 'Atalanta');
INSERT INTO CIDADE VALUES ('SC', 'Aterrado Torto');
INSERT INTO CIDADE VALUES ('SC', 'Aurora');
INSERT INTO CIDADE VALUES ('SC', 'Azambuja');
INSERT INTO CIDADE VALUES ('SC', 'Baia Alta');
INSERT INTO CIDADE VALUES ('SC', 'Balneario Arroio do Silva');
INSERT INTO CIDADE VALUES ('SC', 'Balneario Barra do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Balneario Camboriu');
INSERT INTO CIDADE VALUES ('SC', 'Balneario Gaivota');
INSERT INTO CIDADE VALUES ('SC', 'Balneario Morro dos Conventos');
INSERT INTO CIDADE VALUES ('SC', 'Bandeirante');
INSERT INTO CIDADE VALUES ('SC', 'Barra Bonita');
INSERT INTO CIDADE VALUES ('SC', 'Barra Clara');
INSERT INTO CIDADE VALUES ('SC', 'Barra da Lagoa');
INSERT INTO CIDADE VALUES ('SC', 'Barra da Prata');
INSERT INTO CIDADE VALUES ('SC', 'Barra Fria');
INSERT INTO CIDADE VALUES ('SC', 'Barra Grande');
INSERT INTO CIDADE VALUES ('SC', 'Barra Velha');
INSERT INTO CIDADE VALUES ('SC', 'Barreiros');
INSERT INTO CIDADE VALUES ('SC', 'Barro Branco');
INSERT INTO CIDADE VALUES ('SC', 'Bateias de Baixo');
INSERT INTO CIDADE VALUES ('SC', 'Bela Vista');
INSERT INTO CIDADE VALUES ('SC', 'Bela Vista do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Bela Vista do Toldo');
INSERT INTO CIDADE VALUES ('SC', 'Belmonte');
INSERT INTO CIDADE VALUES ('SC', 'Benedito Novo');
INSERT INTO CIDADE VALUES ('SC', 'Biguacu');
INSERT INTO CIDADE VALUES ('SC', 'Blumenau');
INSERT INTO CIDADE VALUES ('SC', 'Bocaina do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Boiteuxburgo');
INSERT INTO CIDADE VALUES ('SC', 'Bom Jardim da Serra');
INSERT INTO CIDADE VALUES ('SC', 'Bom Jesus');
INSERT INTO CIDADE VALUES ('SC', 'Bom Jesus do Oeste');
INSERT INTO CIDADE VALUES ('SC', 'Bom Retiro');
INSERT INTO CIDADE VALUES ('SC', 'Bom Sucesso');
INSERT INTO CIDADE VALUES ('SC', 'Bombinhas');
INSERT INTO CIDADE VALUES ('SC', 'Botuvera');
INSERT INTO CIDADE VALUES ('SC', 'Braco do Norte');
INSERT INTO CIDADE VALUES ('SC', 'Braco do Trombudo');
INSERT INTO CIDADE VALUES ('SC', 'Brunopolis');
INSERT INTO CIDADE VALUES ('SC', 'Brusque');
INSERT INTO CIDADE VALUES ('SC', 'Cacador');
INSERT INTO CIDADE VALUES ('SC', 'Cachoeira de Fatima');
INSERT INTO CIDADE VALUES ('SC', 'Cachoeira do Bom Jesus');
INSERT INTO CIDADE VALUES ('SC', 'Caibi');
INSERT INTO CIDADE VALUES ('SC', 'Calmon');
INSERT INTO CIDADE VALUES ('SC', 'Camboriu');
INSERT INTO CIDADE VALUES ('SC', 'Cambuinzal');
INSERT INTO CIDADE VALUES ('SC', 'Campeche');
INSERT INTO CIDADE VALUES ('SC', 'Campinas');
INSERT INTO CIDADE VALUES ('SC', 'Campo Alegre');
INSERT INTO CIDADE VALUES ('SC', 'Campo Belo do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Campo Ere');
INSERT INTO CIDADE VALUES ('SC', 'Campos Novos');
INSERT INTO CIDADE VALUES ('SC', 'Canasvieiras');
INSERT INTO CIDADE VALUES ('SC', 'Canelinha');
INSERT INTO CIDADE VALUES ('SC', 'Canoas');
INSERT INTO CIDADE VALUES ('SC', 'Canoinhas');
INSERT INTO CIDADE VALUES ('SC', 'Capao Alto');
INSERT INTO CIDADE VALUES ('SC', 'Capinzal');
INSERT INTO CIDADE VALUES ('SC', 'Capivari de Baixo');
INSERT INTO CIDADE VALUES ('SC', 'Caraiba');
INSERT INTO CIDADE VALUES ('SC', 'Catanduvas');
INSERT INTO CIDADE VALUES ('SC', 'Catuira');
INSERT INTO CIDADE VALUES ('SC', 'Caxambu do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Cedro Alto');
INSERT INTO CIDADE VALUES ('SC', 'Celso Ramos');
INSERT INTO CIDADE VALUES ('SC', 'Cerro Negro');
INSERT INTO CIDADE VALUES ('SC', 'Chapadao do Lageado');
INSERT INTO CIDADE VALUES ('SC', 'Chapeco');
INSERT INTO CIDADE VALUES ('SC', 'Claraiba');
INSERT INTO CIDADE VALUES ('SC', 'Cocal do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Colonia Santa Tereza');
INSERT INTO CIDADE VALUES ('SC', 'Colonia Santana');
INSERT INTO CIDADE VALUES ('SC', 'Concordia');
INSERT INTO CIDADE VALUES ('SC', 'Cordilheira Alta');
INSERT INTO CIDADE VALUES ('SC', 'Coronel Freitas');
INSERT INTO CIDADE VALUES ('SC', 'Coronel Martins');
INSERT INTO CIDADE VALUES ('SC', 'Correia Pinto');
INSERT INTO CIDADE VALUES ('SC', 'Corupa');
INSERT INTO CIDADE VALUES ('SC', 'Criciuma');
INSERT INTO CIDADE VALUES ('SC', 'Cunha Pora');
INSERT INTO CIDADE VALUES ('SC', 'Cunhatai');
INSERT INTO CIDADE VALUES ('SC', 'Curitibanos');
INSERT INTO CIDADE VALUES ('SC', 'Dal Pai');
INSERT INTO CIDADE VALUES ('SC', 'Dalbergia');
INSERT INTO CIDADE VALUES ('SC', 'Descanso');
INSERT INTO CIDADE VALUES ('SC', 'Dionisio Cerqueira');
INSERT INTO CIDADE VALUES ('SC', 'Dona Emma');
INSERT INTO CIDADE VALUES ('SC', 'Doutor Pedrinho');
INSERT INTO CIDADE VALUES ('SC', 'Engenho Velho');
INSERT INTO CIDADE VALUES ('SC', 'Enseada de Brito');
INSERT INTO CIDADE VALUES ('SC', 'Entre Rios');
INSERT INTO CIDADE VALUES ('SC', 'Ermo');
INSERT INTO CIDADE VALUES ('SC', 'Erval Velho');
INSERT INTO CIDADE VALUES ('SC', 'Espinilho');
INSERT INTO CIDADE VALUES ('SC', 'Estacao Cocal');
INSERT INTO CIDADE VALUES ('SC', 'Faxinal dos Guedes');
INSERT INTO CIDADE VALUES ('SC', 'Fazenda Zandavalli');
INSERT INTO CIDADE VALUES ('SC', 'Felipe Schmidt');
INSERT INTO CIDADE VALUES ('SC', 'Figueira');
INSERT INTO CIDADE VALUES ('SC', 'Flor do Sertao');
INSERT INTO CIDADE VALUES ('SC', 'Florianopolis');
INSERT INTO CIDADE VALUES ('SC', 'Formosa do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Forquilhinha');
INSERT INTO CIDADE VALUES ('SC', 'Fragosos');
INSERT INTO CIDADE VALUES ('SC', 'Fraiburgo');
INSERT INTO CIDADE VALUES ('SC', 'Frederico Wastner');
INSERT INTO CIDADE VALUES ('SC', 'Frei Rogerio');
INSERT INTO CIDADE VALUES ('SC', 'Galvao');
INSERT INTO CIDADE VALUES ('SC', 'Garcia');
INSERT INTO CIDADE VALUES ('SC', 'Garopaba');
INSERT INTO CIDADE VALUES ('SC', 'Garuva');
INSERT INTO CIDADE VALUES ('SC', 'Gaspar');
INSERT INTO CIDADE VALUES ('SC', 'Goio-en');
INSERT INTO CIDADE VALUES ('SC', 'Governador Celso Ramos');
INSERT INTO CIDADE VALUES ('SC', 'Grao Para');
INSERT INTO CIDADE VALUES ('SC', 'Grapia');
INSERT INTO CIDADE VALUES ('SC', 'Gravatal');
INSERT INTO CIDADE VALUES ('SC', 'Guabiruba');
INSERT INTO CIDADE VALUES ('SC', 'Guaporanga');
INSERT INTO CIDADE VALUES ('SC', 'Guaraciaba');
INSERT INTO CIDADE VALUES ('SC', 'Guaramirim');
INSERT INTO CIDADE VALUES ('SC', 'Guaruja do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Guata');
INSERT INTO CIDADE VALUES ('SC', 'Guatambu');
INSERT INTO CIDADE VALUES ('SC', 'Hercilio Luz');
INSERT INTO CIDADE VALUES ('SC', 'Herciliopolis');
INSERT INTO CIDADE VALUES ('SC', 'Herval D''oeste');
INSERT INTO CIDADE VALUES ('SC', 'Ibiam');
INSERT INTO CIDADE VALUES ('SC', 'Ibicare');
INSERT INTO CIDADE VALUES ('SC', 'Ibicui');
INSERT INTO CIDADE VALUES ('SC', 'Ibirama');
INSERT INTO CIDADE VALUES ('SC', 'Icara');
INSERT INTO CIDADE VALUES ('SC', 'Ilhota');
INSERT INTO CIDADE VALUES ('SC', 'Imarui');
INSERT INTO CIDADE VALUES ('SC', 'Imbituba');
INSERT INTO CIDADE VALUES ('SC', 'Imbuia');
INSERT INTO CIDADE VALUES ('SC', 'Indaial');
INSERT INTO CIDADE VALUES ('SC', 'Indios');
INSERT INTO CIDADE VALUES ('SC', 'Ingleses do Rio Vermelho');
INSERT INTO CIDADE VALUES ('SC', 'Invernada');
INSERT INTO CIDADE VALUES ('SC', 'Iomere');
INSERT INTO CIDADE VALUES ('SC', 'Ipira');
INSERT INTO CIDADE VALUES ('SC', 'Ipomeia');
INSERT INTO CIDADE VALUES ('SC', 'Ipora do Oeste');
INSERT INTO CIDADE VALUES ('SC', 'Ipuacu');
INSERT INTO CIDADE VALUES ('SC', 'Ipumirim');
INSERT INTO CIDADE VALUES ('SC', 'Iraceminha');
INSERT INTO CIDADE VALUES ('SC', 'Irakitan');
INSERT INTO CIDADE VALUES ('SC', 'Irani');
INSERT INTO CIDADE VALUES ('SC', 'Iraputa');
INSERT INTO CIDADE VALUES ('SC', 'Irati');
INSERT INTO CIDADE VALUES ('SC', 'Irineopolis');
INSERT INTO CIDADE VALUES ('SC', 'Ita');
INSERT INTO CIDADE VALUES ('SC', 'Itaio');
INSERT INTO CIDADE VALUES ('SC', 'Itaiopolis');
INSERT INTO CIDADE VALUES ('SC', 'Itajai');
INSERT INTO CIDADE VALUES ('SC', 'Itajuba');
INSERT INTO CIDADE VALUES ('SC', 'Itapema');
INSERT INTO CIDADE VALUES ('SC', 'Itapiranga');
INSERT INTO CIDADE VALUES ('SC', 'Itapoa');
INSERT INTO CIDADE VALUES ('SC', 'Itapocu');
INSERT INTO CIDADE VALUES ('SC', 'Itoupava');
INSERT INTO CIDADE VALUES ('SC', 'Ituporanga');
INSERT INTO CIDADE VALUES ('SC', 'Jabora');
INSERT INTO CIDADE VALUES ('SC', 'Jacinto Machado');
INSERT INTO CIDADE VALUES ('SC', 'Jaguaruna');
INSERT INTO CIDADE VALUES ('SC', 'Jaragua do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Jardinopolis');
INSERT INTO CIDADE VALUES ('SC', 'Joacaba');
INSERT INTO CIDADE VALUES ('SC', 'Joinville');
INSERT INTO CIDADE VALUES ('SC', 'Jose Boiteux');
INSERT INTO CIDADE VALUES ('SC', 'Jupia');
INSERT INTO CIDADE VALUES ('SC', 'Lacerdopolis');
INSERT INTO CIDADE VALUES ('SC', 'Lages');
INSERT INTO CIDADE VALUES ('SC', 'Lagoa');
INSERT INTO CIDADE VALUES ('SC', 'Lagoa da Estiva');
INSERT INTO CIDADE VALUES ('SC', 'Laguna');
INSERT INTO CIDADE VALUES ('SC', 'Lajeado Grande');
INSERT INTO CIDADE VALUES ('SC', 'Laurentino');
INSERT INTO CIDADE VALUES ('SC', 'Lauro Muller');
INSERT INTO CIDADE VALUES ('SC', 'Leao');
INSERT INTO CIDADE VALUES ('SC', 'Lebon Regis');
INSERT INTO CIDADE VALUES ('SC', 'Leoberto Leal');
INSERT INTO CIDADE VALUES ('SC', 'Lindoia do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Linha das Palmeiras');
INSERT INTO CIDADE VALUES ('SC', 'Lontras');
INSERT INTO CIDADE VALUES ('SC', 'Lourdes');
INSERT INTO CIDADE VALUES ('SC', 'Luiz Alves');
INSERT INTO CIDADE VALUES ('SC', 'Luzerna');
INSERT INTO CIDADE VALUES ('SC', 'Machados');
INSERT INTO CIDADE VALUES ('SC', 'Macieira');
INSERT INTO CIDADE VALUES ('SC', 'Mafra');
INSERT INTO CIDADE VALUES ('SC', 'Major Gercino');
INSERT INTO CIDADE VALUES ('SC', 'Major Vieira');
INSERT INTO CIDADE VALUES ('SC', 'Maracaja');
INSERT INTO CIDADE VALUES ('SC', 'Marari');
INSERT INTO CIDADE VALUES ('SC', 'Marata');
INSERT INTO CIDADE VALUES ('SC', 'Maravilha');
INSERT INTO CIDADE VALUES ('SC', 'Marcilio Dias');
INSERT INTO CIDADE VALUES ('SC', 'Marechal Bormann');
INSERT INTO CIDADE VALUES ('SC', 'Marema');
INSERT INTO CIDADE VALUES ('SC', 'Mariflor');
INSERT INTO CIDADE VALUES ('SC', 'Marombas');
INSERT INTO CIDADE VALUES ('SC', 'Marombas Bossardi');
INSERT INTO CIDADE VALUES ('SC', 'Massaranduba');
INSERT INTO CIDADE VALUES ('SC', 'Matos Costa');
INSERT INTO CIDADE VALUES ('SC', 'Meleiro');
INSERT INTO CIDADE VALUES ('SC', 'Mirador');
INSERT INTO CIDADE VALUES ('SC', 'Mirim');
INSERT INTO CIDADE VALUES ('SC', 'Mirim Doce');
INSERT INTO CIDADE VALUES ('SC', 'Modelo');
INSERT INTO CIDADE VALUES ('SC', 'Mondai');
INSERT INTO CIDADE VALUES ('SC', 'Monte Alegre');
INSERT INTO CIDADE VALUES ('SC', 'Monte Carlo');
INSERT INTO CIDADE VALUES ('SC', 'Monte Castelo');
INSERT INTO CIDADE VALUES ('SC', 'Morro Chato');
INSERT INTO CIDADE VALUES ('SC', 'Morro da Fumaca');
INSERT INTO CIDADE VALUES ('SC', 'Morro do Meio');
INSERT INTO CIDADE VALUES ('SC', 'Morro Grande');
INSERT INTO CIDADE VALUES ('SC', 'Navegantes');
INSERT INTO CIDADE VALUES ('SC', 'Nossa Senhora de Caravaggio');
INSERT INTO CIDADE VALUES ('SC', 'Nova Cultura');
INSERT INTO CIDADE VALUES ('SC', 'Nova Erechim');
INSERT INTO CIDADE VALUES ('SC', 'Nova Guarita');
INSERT INTO CIDADE VALUES ('SC', 'Nova Itaberaba');
INSERT INTO CIDADE VALUES ('SC', 'Nova Petropolis');
INSERT INTO CIDADE VALUES ('SC', 'Nova Teutonia');
INSERT INTO CIDADE VALUES ('SC', 'Nova Trento');
INSERT INTO CIDADE VALUES ('SC', 'Nova Veneza');
INSERT INTO CIDADE VALUES ('SC', 'Novo Horizonte');
INSERT INTO CIDADE VALUES ('SC', 'Orleans');
INSERT INTO CIDADE VALUES ('SC', 'Otacilio Costa');
INSERT INTO CIDADE VALUES ('SC', 'Ouro');
INSERT INTO CIDADE VALUES ('SC', 'Ouro Verde');
INSERT INTO CIDADE VALUES ('SC', 'Paial');
INSERT INTO CIDADE VALUES ('SC', 'Painel');
INSERT INTO CIDADE VALUES ('SC', 'Palhoca');
INSERT INTO CIDADE VALUES ('SC', 'Palma Sola');
INSERT INTO CIDADE VALUES ('SC', 'Palmeira');
INSERT INTO CIDADE VALUES ('SC', 'Palmitos');
INSERT INTO CIDADE VALUES ('SC', 'Pantano do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Papanduva');
INSERT INTO CIDADE VALUES ('SC', 'Paraiso');
INSERT INTO CIDADE VALUES ('SC', 'Passo de Torres');
INSERT INTO CIDADE VALUES ('SC', 'Passo Manso');
INSERT INTO CIDADE VALUES ('SC', 'Passos Maia');
INSERT INTO CIDADE VALUES ('SC', 'Paula Pereira');
INSERT INTO CIDADE VALUES ('SC', 'Paulo Lopes');
INSERT INTO CIDADE VALUES ('SC', 'Pedras Grandes');
INSERT INTO CIDADE VALUES ('SC', 'Penha');
INSERT INTO CIDADE VALUES ('SC', 'Perico');
INSERT INTO CIDADE VALUES ('SC', 'Peritiba');
INSERT INTO CIDADE VALUES ('SC', 'Pescaria Brava');
INSERT INTO CIDADE VALUES ('SC', 'Petrolandia');
INSERT INTO CIDADE VALUES ('SC', 'Picarras');
INSERT INTO CIDADE VALUES ('SC', 'Pindotiba');
INSERT INTO CIDADE VALUES ('SC', 'Pinhalzinho');
INSERT INTO CIDADE VALUES ('SC', 'Pinheiral');
INSERT INTO CIDADE VALUES ('SC', 'Pinheiro Preto');
INSERT INTO CIDADE VALUES ('SC', 'Pinheiros');
INSERT INTO CIDADE VALUES ('SC', 'Pirabeiraba');
INSERT INTO CIDADE VALUES ('SC', 'Piratuba');
INSERT INTO CIDADE VALUES ('SC', 'Planalto');
INSERT INTO CIDADE VALUES ('SC', 'Planalto Alegre');
INSERT INTO CIDADE VALUES ('SC', 'Poco Preto');
INSERT INTO CIDADE VALUES ('SC', 'Pomerode');
INSERT INTO CIDADE VALUES ('SC', 'Ponte Alta');
INSERT INTO CIDADE VALUES ('SC', 'Ponte Alta do Norte');
INSERT INTO CIDADE VALUES ('SC', 'Ponte Serrada');
INSERT INTO CIDADE VALUES ('SC', 'Porto Belo');
INSERT INTO CIDADE VALUES ('SC', 'Porto Uniao');
INSERT INTO CIDADE VALUES ('SC', 'Pouso Redondo');
INSERT INTO CIDADE VALUES ('SC', 'Praia Grande');
INSERT INTO CIDADE VALUES ('SC', 'Prata');
INSERT INTO CIDADE VALUES ('SC', 'Presidente Castelo Branco');
INSERT INTO CIDADE VALUES ('SC', 'Presidente Getulio');
INSERT INTO CIDADE VALUES ('SC', 'Presidente Juscelino');
INSERT INTO CIDADE VALUES ('SC', 'Presidente Kennedy');
INSERT INTO CIDADE VALUES ('SC', 'Presidente Nereu');
INSERT INTO CIDADE VALUES ('SC', 'Princesa');
INSERT INTO CIDADE VALUES ('SC', 'Quarta Linha');
INSERT INTO CIDADE VALUES ('SC', 'Quilombo');
INSERT INTO CIDADE VALUES ('SC', 'Quilometro Doze');
INSERT INTO CIDADE VALUES ('SC', 'Rancho Queimado');
INSERT INTO CIDADE VALUES ('SC', 'Ratones');
INSERT INTO CIDADE VALUES ('SC', 'Residencia Fuck');
INSERT INTO CIDADE VALUES ('SC', 'Ribeirao da Ilha');
INSERT INTO CIDADE VALUES ('SC', 'Ribeirao Pequeno');
INSERT INTO CIDADE VALUES ('SC', 'Rio Antinha');
INSERT INTO CIDADE VALUES ('SC', 'Rio Bonito');
INSERT INTO CIDADE VALUES ('SC', 'Rio D''una');
INSERT INTO CIDADE VALUES ('SC', 'Rio da Anta');
INSERT INTO CIDADE VALUES ('SC', 'Rio da Luz');
INSERT INTO CIDADE VALUES ('SC', 'Rio das Antas');
INSERT INTO CIDADE VALUES ('SC', 'Rio das Furnas');
INSERT INTO CIDADE VALUES ('SC', 'Rio do Campo');
INSERT INTO CIDADE VALUES ('SC', 'Rio do Oeste');
INSERT INTO CIDADE VALUES ('SC', 'Rio do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Rio dos Bugres');
INSERT INTO CIDADE VALUES ('SC', 'Rio dos Cedros');
INSERT INTO CIDADE VALUES ('SC', 'Rio Fortuna');
INSERT INTO CIDADE VALUES ('SC', 'Rio Maina');
INSERT INTO CIDADE VALUES ('SC', 'Rio Negrinho');
INSERT INTO CIDADE VALUES ('SC', 'Rio Preto do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Rio Rufino');
INSERT INTO CIDADE VALUES ('SC', 'Riqueza');
INSERT INTO CIDADE VALUES ('SC', 'Rodeio');
INSERT INTO CIDADE VALUES ('SC', 'Romelandia');
INSERT INTO CIDADE VALUES ('SC', 'Sai');
INSERT INTO CIDADE VALUES ('SC', 'Salete');
INSERT INTO CIDADE VALUES ('SC', 'Saltinho');
INSERT INTO CIDADE VALUES ('SC', 'Salto Veloso');
INSERT INTO CIDADE VALUES ('SC', 'Sanga da Toca');
INSERT INTO CIDADE VALUES ('SC', 'Sangao');
INSERT INTO CIDADE VALUES ('SC', 'Santa Cecilia');
INSERT INTO CIDADE VALUES ('SC', 'Santa Cruz do Timbo');
INSERT INTO CIDADE VALUES ('SC', 'Santa Helena');
INSERT INTO CIDADE VALUES ('SC', 'Santa Izabel');
INSERT INTO CIDADE VALUES ('SC', 'Santa Lucia');
INSERT INTO CIDADE VALUES ('SC', 'Santa Maria');
INSERT INTO CIDADE VALUES ('SC', 'Santa Rosa de Lima');
INSERT INTO CIDADE VALUES ('SC', 'Santa Rosa do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Santa Terezinha');
INSERT INTO CIDADE VALUES ('SC', 'Santa Terezinha do Progresso');
INSERT INTO CIDADE VALUES ('SC', 'Santa Terezinha do Salto');
INSERT INTO CIDADE VALUES ('SC', 'Santiago do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Santo Amaro da Imperatriz');
INSERT INTO CIDADE VALUES ('SC', 'Santo Antonio de Lisboa');
INSERT INTO CIDADE VALUES ('SC', 'Sao Bento Baixo');
INSERT INTO CIDADE VALUES ('SC', 'Sao Bento do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Sao Bernardino');
INSERT INTO CIDADE VALUES ('SC', 'Sao Bonifacio');
INSERT INTO CIDADE VALUES ('SC', 'Sao Carlos');
INSERT INTO CIDADE VALUES ('SC', 'Sao Cristovao');
INSERT INTO CIDADE VALUES ('SC', 'Sao Cristovao do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Sao Defende');
INSERT INTO CIDADE VALUES ('SC', 'Sao Domingos');
INSERT INTO CIDADE VALUES ('SC', 'Sao Francisco do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Sao Gabriel');
INSERT INTO CIDADE VALUES ('SC', 'Sao Joao Batista');
INSERT INTO CIDADE VALUES ('SC', 'Sao Joao do Itaperiu');
INSERT INTO CIDADE VALUES ('SC', 'Sao Joao do Oeste');
INSERT INTO CIDADE VALUES ('SC', 'Sao Joao do Rio Vermelho');
INSERT INTO CIDADE VALUES ('SC', 'Sao Joao do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Sao Joaquim');
INSERT INTO CIDADE VALUES ('SC', 'Sao Jose');
INSERT INTO CIDADE VALUES ('SC', 'Sao Jose do Cedro');
INSERT INTO CIDADE VALUES ('SC', 'Sao Jose do Cerrito');
INSERT INTO CIDADE VALUES ('SC', 'Sao Jose do Laranjal');
INSERT INTO CIDADE VALUES ('SC', 'Sao Leonardo');
INSERT INTO CIDADE VALUES ('SC', 'Sao Lourenco do Oeste');
INSERT INTO CIDADE VALUES ('SC', 'Sao Ludgero');
INSERT INTO CIDADE VALUES ('SC', 'Sao Martinho');
INSERT INTO CIDADE VALUES ('SC', 'Sao Miguel D''oeste');
INSERT INTO CIDADE VALUES ('SC', 'Sao Miguel da Boa Vista');
INSERT INTO CIDADE VALUES ('SC', 'Sao Miguel da Serra');
INSERT INTO CIDADE VALUES ('SC', 'Sao Pedro de Alcantara');
INSERT INTO CIDADE VALUES ('SC', 'Sao Pedro Tobias');
INSERT INTO CIDADE VALUES ('SC', 'Sao Roque');
INSERT INTO CIDADE VALUES ('SC', 'Sao Sebastiao do Arvoredo');
INSERT INTO CIDADE VALUES ('SC', 'Sao Sebastiao do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Sapiranga');
INSERT INTO CIDADE VALUES ('SC', 'Saudades');
INSERT INTO CIDADE VALUES ('SC', 'Schroeder');
INSERT INTO CIDADE VALUES ('SC', 'Seara');
INSERT INTO CIDADE VALUES ('SC', 'Sede Oldemburg');
INSERT INTO CIDADE VALUES ('SC', 'Serra Alta');
INSERT INTO CIDADE VALUES ('SC', 'Sertao do Maruim');
INSERT INTO CIDADE VALUES ('SC', 'Sideropolis');
INSERT INTO CIDADE VALUES ('SC', 'Sombrio');
INSERT INTO CIDADE VALUES ('SC', 'Sorocaba do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Sul Brasil');
INSERT INTO CIDADE VALUES ('SC', 'Taio');
INSERT INTO CIDADE VALUES ('SC', 'Tangara');
INSERT INTO CIDADE VALUES ('SC', 'Taquara Verde');
INSERT INTO CIDADE VALUES ('SC', 'Taquaras');
INSERT INTO CIDADE VALUES ('SC', 'Tigipio');
INSERT INTO CIDADE VALUES ('SC', 'Tigrinhos');
INSERT INTO CIDADE VALUES ('SC', 'Tijucas');
INSERT INTO CIDADE VALUES ('SC', 'Timbe do Sul');
INSERT INTO CIDADE VALUES ('SC', 'Timbo');
INSERT INTO CIDADE VALUES ('SC', 'Timbo Grande');
INSERT INTO CIDADE VALUES ('SC', 'Tres Barras');
INSERT INTO CIDADE VALUES ('SC', 'Treviso');
INSERT INTO CIDADE VALUES ('SC', 'Treze de Maio');
INSERT INTO CIDADE VALUES ('SC', 'Treze Tilias');
INSERT INTO CIDADE VALUES ('SC', 'Trombudo Central');
INSERT INTO CIDADE VALUES ('SC', 'Tubarao');
INSERT INTO CIDADE VALUES ('SC', 'Tunapolis');
INSERT INTO CIDADE VALUES ('SC', 'Tupitinga');
INSERT INTO CIDADE VALUES ('SC', 'Turvo');
INSERT INTO CIDADE VALUES ('SC', 'Uniao do Oeste');
INSERT INTO CIDADE VALUES ('SC', 'Urubici');
INSERT INTO CIDADE VALUES ('SC', 'Uruguai');
INSERT INTO CIDADE VALUES ('SC', 'Urupema');
INSERT INTO CIDADE VALUES ('SC', 'Urussanga');
INSERT INTO CIDADE VALUES ('SC', 'Vargeao');
INSERT INTO CIDADE VALUES ('SC', 'Vargem');
INSERT INTO CIDADE VALUES ('SC', 'Vargem Bonita');
INSERT INTO CIDADE VALUES ('SC', 'Vargem do Cedro');
INSERT INTO CIDADE VALUES ('SC', 'Vidal Ramos');
INSERT INTO CIDADE VALUES ('SC', 'Videira');
INSERT INTO CIDADE VALUES ('SC', 'Vila Conceicao');
INSERT INTO CIDADE VALUES ('SC', 'Vila de Volta Grande');
INSERT INTO CIDADE VALUES ('SC', 'Vila Milani');
INSERT INTO CIDADE VALUES ('SC', 'Vila Nova');
INSERT INTO CIDADE VALUES ('SC', 'Vitor Meireles');
INSERT INTO CIDADE VALUES ('SC', 'Witmarsum');
INSERT INTO CIDADE VALUES ('SC', 'Xanxere');
INSERT INTO CIDADE VALUES ('SC', 'Xavantina');
INSERT INTO CIDADE VALUES ('SC', 'Xaxim');
INSERT INTO CIDADE VALUES ('SC', 'Zortea')

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Calabresa', '26', 'Grande', 'Pizza grande com recheio de Calabresa');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Frango', '26', 'Grande', 'Pizza grande com recheio de Frango');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Lombinho', '26', 'Grande', 'Pizza grande com recheio de Lombinho');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Bacon', '29', 'Grande', 'Pizza grande com recheio de Bacon');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de 4 Queijos', '29', 'Grande', 'Pizza grande com recheio de 4 queijos');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Fil� Mignon', '29', 'Grande', 'Pizza grande com recheio de Fil� Mignon');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Carne Seca', '32', 'Grande', 'Pizza grande com recheio de Carne Seca');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Chocolate Preto', '32', 'Brotinho', 'Pizza brotinho com recheio de Chocolate Preto');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Pizza de Chocolate Branco', '32', 'Brotinho', 'Pizza brotinho com recheio de Chocolate Branco');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Refrigerante Coca-Cola', '7', '2 Litros', 'Refrigerante Coca-Cola 2 Litros');

INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('Refrigerante Guaran�', '7', '2 Litros', 'Refrigerante Guaran� 2 Litros');


INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('�gua mineral com g�s', '4', '500 ML', '�gua mineral com g�s 500 ML');


INSERT INTO [dbo].[PRODUTOS]
(NOME, PRECO, TAMANHO, DESCRICAO)
VALUES
('�gua mineral sem g�s', '4', '500 ML', '�gua mineral sem g�s 500 ML');