--1 Ver notas de Matematica dos alunos
SELECT numero_mecanografico, nome, notas['Matemática'] AS matematica_grade FROM Alunos;

--2 Procurar um professor adicionado numa data especifica
-- CREATE INDEX tempo_de_insercao_index ON escola.professores (tempo_de_insercao);
SELECT * FROM professores WHERE tempo_de_insercao = '2000-11-20 15:38:00.000000+0000';


--3 Ver os professores de Matematica.
--CREATE INDEX disciplina_professor ON escola.professores (disciplina);
Select * From professores where disciplina = 'Matemática';

--4 Numero de alunos por turma
SELECT turma, COUNT(*) as num_alunos
FROM Alunos_Turma
GROUP BY turma;

--5 Professores que menos de 30 anos
Select * from professores where idade < 30 ALLOW FILTERING;


--6 Ver os 2 alunos com maior numero mecanografico de uma turma 
Select * From alunos_turma where turma = '10ºA' ORDER BY nmec DESC LIMIT 2;

--7 Ver qual dos membros da direcao tem o cargo de Diretor
--Create Index cargo_index on diretores (lista_cargos) ;
SELECT * from diretores WHERE lista_cargos CONTAINS 'Diretor';


--8 Media de todas as notas de Portugues
SELECT AVG(notas['Português']) AS media_matematica FROM Alunos;

--9 Ver todos os alunos 
SELECT * FROM Alunos;

--10 Ver todos os professores
SELECT * FROM professores;
