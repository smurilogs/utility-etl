CREATE TABLE tb_safra (
 id_safra INT NOT NULL,
 safra CHAR(10)
);

ALTER TABLE tb_safra ADD CONSTRAINT PK_tb_safra PRIMARY KEY (id_safra);


CREATE TABLE tb_platio (
 id_plantio INT NOT NULL,
 id_safra INT NOT NULL,
 numero INT,
 contrato_juridico VARCHAR(50)
);

ALTER TABLE tb_platio ADD CONSTRAINT PK_tb_platio PRIMARY KEY (id_plantio);


CREATE TABLE tb_operacao (
 id_operacao INT NOT NULL,
 id_plantio INT NOT NULL,
 data_inicio VARCHAR(50),
 data_fim VARCHAR(50)
);

ALTER TABLE tb_operacao ADD CONSTRAINT PK_tb_operacao PRIMARY KEY (id_operacao);


CREATE TABLE tb_registro (
 id_registro INT NOT NULL,
 id_operacao INT NOT NULL,
 data_registro VARCHAR(50),
 amostra VARCHAR(50)
);

ALTER TABLE tb_registro ADD CONSTRAINT PK_tb_registro PRIMARY KEY (id_registro);


ALTER TABLE tb_platio ADD CONSTRAINT FK_tb_platio_0 FOREIGN KEY (id_safra) REFERENCES tb_safra (id_safra);


ALTER TABLE tb_operacao ADD CONSTRAINT FK_tb_operacao_0 FOREIGN KEY (id_plantio) REFERENCES tb_platio (id_plantio);


ALTER TABLE tb_registro ADD CONSTRAINT FK_tb_registro_0 FOREIGN KEY (id_operacao) REFERENCES tb_operacao (id_operacao);


