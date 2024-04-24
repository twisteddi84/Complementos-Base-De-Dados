CREATE KEYSPACE IF NOT EXISTS Escola WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};

USE Escola;

DROP TABLE IF EXISTS Alunos;
CREATE TABLE IF NOT EXISTS Alunos (
    numero_mecanografico int,
    nome text,
    idade int,
    notas map<text, float>,
    data_entrada timestamp,
    PRIMARY KEY (numero_mecanografico,nome)
);

DROP TABLE IF EXISTS Professores;
CREATE TABLE IF NOT EXISTS Professores (
    numero_mecanografico int,
    nome text,
    idade int,
    disciplina text,
    lista_turmas set<text>,
    tempo_de_insercao timestamp,
    PRIMARY KEY (numero_mecanografico,nome)
);


DROP TABLE IF EXISTS Alunos_Turma;
CREATE TABLE IF NOT EXISTS Alunos_Turma (
    nmec int,
    turma text,
    PRIMARY KEY (turma,nmec)
);


DROP TABLE IF EXISTS Diretores;
CREATE TABLE IF NOT EXISTS Diretores (
    numero_mecanografico int,
    nome text,
    idade int,
    lista_cargos list<text>,
    data_inicio timestamp,
    PRIMARY KEY (numero_mecanografico,nome)
);

CREATE INDEX tempo_de_insercao_index ON escola.professores (tempo_de_insercao);

CREATE INDEX disciplina_professor ON escola.professores (disciplina);

Create Index cargo_index on diretores (lista_cargos) ;
