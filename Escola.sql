CREATE DATABASE escola;
USE escola;

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    cpf VARCHAR(11)
);

CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    disciplina VARCHAR(100) NOT NULL,
    id_aluno INT,
    CONSTRAINT fk_curso_aluno FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    idCURSOS INT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    cpf VARCHAR(11),
    CONSTRAINT fk_professor_curso FOREIGN KEY (idCURSOS) REFERENCES Curso(id_curso)
);
USE escola;

INSERT INTO Aluno (nome, email, cpf) VALUES
('Ana Silva', 'ana.silva@email.com', '12345678901'),
('Bruno Oliveira', 'bruno.oliveira@email.com', '23456789012'),
('Carla Souza', 'carla.souza@email.com', '34567890123');

INSERT INTO Curso (disciplina, id_aluno) VALUES
('Banco de Dados', 1),
('Programação Web', 2),
('Estrutura de Dados', 3);

INSERT INTO Professor (idCURSOS, nome, email, cpf) VALUES
(1, 'Prof. Carlos Eduardo', 'carlos.prof@email.com', '45678901234'),
(2, 'Profa. Mariana Costa', 'mariana.prof@email.com', '56789012345'),
(3, 'Prof. Roberto Alves', 'roberto.prof@email.com', '67890123456');