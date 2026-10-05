CREATE DATABASE IF NOT EXISTS db_empresa;
USE db_empresa;

CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    salario FLOAT,
    id_departamento INT NOT NULL,
    CONSTRAINT fk_funcionario_departamento FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Projeto (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    `data-inicio` DATE,
    `data-fim` DATE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE funcionario_e_projeto (
    id_funcionario INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_funcionario, id_projeto),
    CONSTRAINT fk_fp_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    CONSTRAINT fk_fp_projeto FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
);
USE db_empresa;

INSERT INTO Departamento (nome) VALUES
('Tecnologia da Informação'),
('Recursos Humanos'),
('Marketing');

INSERT INTO Funcionario (nome, cargo, salario, id_departamento) VALUES
('Lucas Mendes', 'Desenvolvedor Backend', 5500.00, 1),
('Fernanda Lima', 'Analista de RH', 4200.00, 2),
('Gabriel Rocha', 'Especialista em Marketing', 4800.00, 3);

INSERT INTO Projeto (`data-inicio`, `data-fim`, nome) VALUES
('2026-01-15', '2026-06-30', 'Migração de Sistema para Nuvem'),
('2026-02-01', '2026-04-15', 'Reestruturação de Cargos'),
('2026-03-10', '2026-05-20', 'Campanha Digital de Outono');

INSERT INTO funcionario_e_projeto (id_funcionario, id_projeto) VALUES
(1, 1), -- Lucas no Projeto de Migração
(2, 2), -- Fernanda no Projeto de Cargos
(3, 3); -- Gabriel no Projeto de Marketing