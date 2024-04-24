INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES (1,'João Silva',10,{'Português': 90.50, 'Matemática': 92.5, 'História': 80.4,},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (1,'10ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(2, 'Miguel Santos',11,{'Português': 55.5, 'Matemática': 82.6, 'Ciências': 90.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (2,'10ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(3, 'Manuel Pereira',12,{'Português': 91.10, 'Matemática': 10.50, 'Inglês': 82.50},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (3,'10ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(4, 'Francisco Martins',13,{'Português': 82.50, 'Matemática': 93.0, 'Ciências': 99.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (4,'11ºB');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(5, 'Pedro Oliveira',11,{'Português': 45.5, 'Matemática': 93.3, 'Inglês': 80.7},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (5,'11ºB');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(6, 'José Rodrigues',10,{'Português': 92.5, 'Matemática': 90.0, 'Ciências': 80.60},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (6,'11ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(7, 'Alexandre Almeida',12,{'Português': 70.0, 'Matemática': 73.0, 'Inglês': 75.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (7,'9ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(8, 'Bernardo Cardoso',11,{'Português': 85.5, 'Matemática': 86.5, 'Ciências': 83.4},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (8,'9ºB');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(9, 'Rafael Costa',12,{'Português': 80.0, 'Matemática': 90.0, 'Inglês': 40.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (9,'9ºC');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(10, 'Maria Silva',10,{'Português': 99.0, 'Matemática': 98.0, 'História': 90.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (10,'9ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(11, 'Ana Santos',11,{'Português': 50.0, 'Matemática': 56.6, 'Ciências': 55.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (11,'9ºB');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(12, 'Beatriz Pereira',12,{'Português': 90.0, 'Matemática': 60.0, 'Inglês': 82.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (12,'9ºC');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(13, 'Sara Martins',13,{'Português': 83.0, 'Matemática': 95.0, 'Ciências': 100.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (13,'10ºA');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(14, 'Catarina Oliveira',14,{'Português': 65.0, 'Matemática': 90.0, 'Inglês': 87.5},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (14,'9ºB');

INSERT INTO Alunos (numero_mecanografico, nome, idade, notas, data_entrada)
VALUES(15, 'Leonor Rodrigues',15,{'Português': 97.0, 'Matemática': 80.0, 'Ciências': 94.0},'2023-11-28 15:32:00');
INSERT INTO Alunos_Turma (nmec,turma)
VALUES (15,'9ºC');


INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(16, 'João Silva',35,'Matemática',{'10ºA','11ºB','11ºA'},'2020-11-28 15:32:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(17, 'Maria Pereira',40,'Português',{'10ºA','11ºB','11ºA'},'2000-11-28 15:33:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(18, 'Pedro Santos',32,'História',{'9ºA', '9ºB'},'2010-10-10 15:34:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(19, 'Ana Rodrigues',28,'Biologia',{'10ºA','11ºB'},'2010-10-10 15:35:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(20, 'Carlos Martins',37,'Física',{'9ºA', '9ºB'},'2010-10-10 15:36:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(21, 'Joana Oliveira',42,'Química',{'9ºA', '9ºB'},'2023-11-28 15:37:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(22, 'António Gomes',30,'Filosofia',{'9ºC','10ºA','11ºB'},'2000-11-20 15:38:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(23, 'Teresa Silva',26,'Inglês',{'10ºA','11ºA'},'2000-11-28 15:39:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(24, 'Luís Pereira',34,'Francês',{'10ºA', '11ºA'},'1999-11-28 15:40:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(25, 'Marta Santos',40,'Espanhol',{'10ºA','11ºB','11ºA'},'2023-11-28 15:41:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(26, 'Pedro Rodrigues',32,'Educação Física',{'10ºA','11ºB','11ºA'},'2023-11-28 15:42:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(27, 'Ana Martins',28,'Artes',{'9ºA', '9ºB','9ºC'},'2000-11-30 15:43:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(28, 'Carlos Oliveira',37,'Música',{'9ºA', '9ºB','9ºC'},'2023-11-28 15:44:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(29, 'Joana Gomes',42,'Educação Tecnológica',{'9ºA', '9ºB','9ºC'},'2023-11-28 15:45:00');

INSERT INTO Professores (numero_mecanografico, nome, idade, disciplina, lista_turmas, tempo_de_insercao)
VALUES(30, 'António Silva',30,'Informática',{'19ºA', '9ºB','9ºC'},'2023-11-28 15:46:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(31, 'Duarte Silva',35,['Diretor'],'2019-09-01 15:47:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(32, 'Maria Pereira',40,['Coordenador de docentes','Vice-Presidente'],'2016-11-01 15:48:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(33, 'Pedro Santos',32,['Diretor de Recursos Humanos'],'2021-11-01 15:49:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(34, 'Ana Rodrigues',28,['Diretora de Finanças','Professor'],'2023-11-28 15:50:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(35, 'Carlos Martins',37,['Diretor de Operações'],'2023-11-28 15:51:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(36, 'Joana Oliveira',42,['Diretora de Marketing','Vogal'],'2012-07-01 15:52:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(37, 'António Gomes',30,['Diretor de Tecnologia'],'2023-11-28 15:53:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(38, 'Teresa Silva',26,['Diretora de Inovação','Orientador','2ºVogal'],'2023-11-28 15:54:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(39, 'Luís Pereira',34,['Diretor de Sustentabilidade'],'2007-07-01 15:55:00');

INSERT INTO Diretores (numero_mecanografico, nome, idade, lista_cargos,data_inicio)
VALUES(40, 'Marta Santos',40,['Diretora de Relações Públicas'],'2016-11-01 15:56:00');


UPDATE professores SET lista_turmas = lista_turmas + { '10ºA'} WHERE numero_mecanografico= 28 and nome = 'Carlos Oliveira';
UPDATE alunos SET notas = notas + {'Música': 90.0} WHERE numero_mecanografico= 14 and nome = 'Catarina Oliveira';
UPDATE diretores SET lista_cargos = lista_cargos - ['Orientador'] WHERE numero_mecanografico= 38 and nome = 'Teresa Silva';
UPDATE alunos SET notas['Música'] = 82.0 WHERE numero_mecanografico= 14 and nome = 'Catarina Oliveira';
UPDATE alunos SET notas = notas - {'Ciências'} WHERE numero_mecanografico= 15 and nome = 'Leonor Rodrigues';

DELEtE FROM alunos WHERE numero_mecanografico= 14 and nome = 'Catarina Oliveira';
DELETE FROM professores WHERE numero_mecanografico= 27 and nome = 'Ana Martins';
DELETE FROM diretores WHERE numero_mecanografico= 40 and nome = 'Marta Santos';
DELETE FROM alunos_turma WHERE nmec = 15 and turma = '9ºC';
DELETE FROM professores WHERE numero_mecanografico= 22 and nome = 'António Gomes';
