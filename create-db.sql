CREATE TABLE produto ( 
 id SERIAL PRIMARY KEY,  
 nome VARCHAR(255) NOT NULL,  
 descricao VARCHAR(255),  
 id_tipo_produto INT,  
 preco FLOAT,
 CHECK (id IS NOT NULL)
); 

CREATE TABLE tipo_produto 
( 
 id SERIAL PRIMARY KEY,  
 nome VARCHAR(255) NOT NULL, 
 descricao VARCHAR(255)
); 

CREATE TABLE imposto 
( 
 id SERIAL PRIMARY KEY,  
 id_tipo_produto INT,  
 valor FLOAT NOT NULL
); 

CREATE TABLE venda 
( 
 id SERIAL PRIMARY KEY,  
 total_venda FLOAT NOT NULL,  
 total_impostos FLOAT NOT NULL,  
 data_venda DATE DEFAULT now() NOT NULL
); 

CREATE TABLE itens_venda 
( 
 id SERIAL PRIMARY KEY,  
 id_venda INT,  
 id_produto INT,  
 valor_item FLOAT NOT NULL,  
 valor_imposto INT NOT NULL
);

ALTER TABLE produto ADD CONSTRAINT fk_produto_tipo_produto FOREIGN KEY (id_tipo_produto) REFERENCES tipo_produto (id);
ALTER TABLE imposto ADD CONSTRAINT fk_imposto_tipo_produto FOREIGN KEY (id_tipo_produto) REFERENCES tipo_produto (id);
ALTER TABLE itens_venda ADD CONSTRAINT fk_itens_venda_venda FOREIGN KEY (id_venda) REFERENCES venda (id);
ALTER TABLE itens_venda ADD CONSTRAINT fk_itens_venda_produto FOREIGN KEY (id_produto) REFERENCES produto (id);
