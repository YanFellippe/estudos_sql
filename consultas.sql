-- ﻿1. mostre o nome das gravadores em ordem alfabética
SELECT * FROM tb_gravadora
ORDER BY nome ASC;

-- 2. Mostre os disco que possuem mais que uma hora de musicas em ordem do maior para o menor
SELECT * FROM tb_disco
WHERE duracao > 60
ORDER BY duracao DESC;

-- 3. Mostre as musicas todas as musicas com tamanho iguais ou menor que 3.0 minutos
SELECT * FROM tb_musica
WHERE duracao <= '00:03:00';

-- 4. mostre os discos que são do ano 1996, 1999, 2015 em ordem crescente
SELECT * FROM tb_disco
WHERE ano_lancamento IN(1996, 1999, 2015)
ORDER BY ano_lancamento ASC;

-- 5. mostre o nome e ano dos disco do ano 2000 ate 2022
SELECT titulo, ano_lancamento FROM tb_disco
WHERE ano_lancamento BETWEEN 2000 AND 2022;

-- 6.	Mostre nome e data de nascimento dos artistas de 2003 para a frente
SELECT nome, dt_nascimento FROM tb_artista
WHERE dt_nascimento >= '2003-01-01';

-- 7.	Mostre todas as gravadoras que o ID seja diferente de 6 em ordem decrescente.
SELECT * FROM tb_gravadora
WHERE id <> 6
ORDER BY id DESC; 

-- 8.	Mostre quais são as datas de nascimento dos artistas cadastradas no banco sem repeti-las.
SELECT DISTINCT dt_nascimento
FROM tb_artista;

-- 9.	Mostre o nome e tempo das músicas que possuem o tempo menor ou igual 2, ou maior ou igual 4
SELECT nome, duracao FROM tb_musica
WHERE duracao <= 2 OR duracao >= 4;

-- 10.	Mostre o título e ano dos discos entre 1997 e 2008
SELECT titulo, ano_lancamento FROM tb_disco
WHERE ano_lancamento BETWEEN 1997 AND 2008;

-- 11.	Mostre o nome das gravadoras com a letra 'd' em qualquer parte do nome.
SELECT nome FROM tb_gravadora
WHERE nome LIKE '%d%';

-- 12.	Mostre o nome das músicas do disco 23
SELECT nome FROM tb_musica
WHERE id = 23;

-- 13.	Mostre os discos que tenham a letra 'S' no final
SELECT * FROM tb_disco
WHERE titulo LIKE '%S';

-- 14.	Mostre em ordem decrescente o nome dos artistas que tem a segunda letra 'E' e terminem com a letra 'O'
SELECT nome FROM tb_artista
WHERE SUBSTRING(nome, 2, 1) = 'E' AND RIGHT(nome, 1) = 'O'
ORDER BY nome DESC;

-- 15.	Indique o nome crescente, mas apenas das músicas que possuam menos de 3.0 minutos de duração
SELECT nome FROM tb_musica
WHERE duracao < '00:03:00'
ORDER BY nome ASC;

-- 16.	Indique os discos que iniciam com a letra A ou terminem com letra a sendo a penúltima letra.
SELECT * FROM tb_disco
WHERE titulo LIKE 'A%' 
OR (RIGHT(titulo, 2) = 'a_' AND LENGTH(titulo) >= 1);

-- 17.	Mostre o nome dos artistas que comecem com a letra C e que tenham idade superior a 23.
SELECT nome FROM tb_artista
WHERE nome LIKE 'C%' AND dt_nascimento > 23;

-- 18.	Mostre o nome das músicas, exceto as que são dos discos 6, 12 e 34.
SELECT nome FROM tb_musica
WHERE id NOT IN (6, 12, 34);

-- 19.	Pesquise todas as músicas dos discos 3, 33, 333, 3000, 66, 666, 6666 organize de forma decrescente de disco. Mostre o código do disco
SELECT id, nome FROM tb_musica
WHERE id IN (3, 33, 333, 3000, 66, 666, 6666)
ORDER BY id DESC;

-- 20.	Consulte os discos com inicial "K", deseja-se ver todas as informações menos fk's ordenado de forma alfabética de disco
SELECT id, titulo, duracao, ano_lancamento FROM tb_disco
WHERE titulo LIKE 'K%'
ORDER BY titulo ASC;

-- 21.	Consulte todos os dados dos discos que possuam duração menor que 1h.
SELECT * FROM tb_disco
WHERE duracao < '01:00:00';

-- 22.	Consulte todos os gêneros que não se iniciam com vogais.
SELECT nome FROM tb_genero
WHERE nome NOT REGEXP '^[aeiouAEIOU]';

-- 23.	Consulte todos os artistas que se iniciam com vogais de forma alfabética de nome, deseja-se ver todos os dados dos artistas.
SELECT * FROM tb_artista
WHERE nome REGEXP '^[aeiouAEIOU]'
ORDER BY nome ASC;

-- 24.	Consulte apenas os nomes dos artistas que possuem 'SILVA' em qualquer lugar do nome e que tenha idade superior a 25 e organize em ordem crescente.
SELECT nome FROM tb_artista
WHERE nome LIKE '%SILVA%' AND dt_nascimento > 25
ORDER BY nome ASC;

-- 25.	Consulte apenas o nome e idade dos artistas que possuem idade entre 18 e 35 anos ou que possuam o nome iniciado com a letra 'P' e terminado com a letra 'Y' e organize em ordem crescente de idade.
SELECT nome, dt_nascimento FROM tb_artista
WHERE (dt_nascimento BETWEEN 18 AND 35) OR (nome LIKE 'P%Y')
ORDER BY dt_nascimento ASC;

-- 26.	Consulte o título dos discos do artista 54 e no resultado mostre o título apenas daqueles que tiverem de 20 minutos para cima e organize em ordem decrescente de minutos.
SELECT tb_disco.titulo FROM tb_disco WHERE tb_disco.id_artista = 54 AND tb_disco.duracao >= 20
ORDER BY tb_disco.duracao DESC;

-- 27.	Consulte o título e ano de lançamento de todos os discos exceto os que estão entre 1998 e 2006 e organize por ano
SELECT titulo, ano_lancamento FROM tb_disco
WHERE ano_lancamento NOT BETWEEN 1998 AND 2006
ORDER BY ano_lancamento;

-- 28.	Consulte o nome dos artistas que tenham o nome iniciado com 'C' e terminado com 'A’, organize por ordem alfabética de nome.
SELECT nome FROM tb_artista
WHERE nome LIKE 'C%A'
ORDER BY nome ASC;

-- 29.	Consulte o nome e minutos de cada disco exceto dos artistas 3 e 7 e mostre no resultado apenas aqueles que possuem o tempo entre 35 e 75 minutos
SELECT d.titulo, d.duracao AS minutos FROM tb_disco d
JOIN tb_artista a ON d.id_artista = a.id
WHERE a.id NOT IN (3, 7) AND d.duracao BETWEEN '00:35:00' AND '01:15:00';

-- 30.	Consulte o ano de lançamento dos discos cadastrados mostre quantos discos cada ano possui, porém mostre apenas dos anos 2010 a 2020
 SELECT DISTINCT ano_lancamento, titulo, duracao FROM tb_disco
 WHERE ano_lancamento BETWEEN 2010 AND 2020
 ORDER BY ano_lancamento;
 
-- 31.	Busque a data de nascimento mais antiga.
SELECT MIN(dt_nascimento) AS dt_nascimento
FROM tb_artista;

-- 32.	Busque a média de duração dos discos
SELECT AVG(duracao) AS media_de_duracao FROM tb_disco;

-- 33.	Busque a menor musica
SELECT nome, duracao FROM tb_musica
ORDER BY duracao ASC LIMIT 1;

-- 34.	Indique quantas músicas possuem a mesma duração ordenado pela maior
SELECT duracao, nome FROM tb_musica
GROUP BY duracao, Nome
HAVING COUNT(6881) > 1
ORDER BY duracao DESC;

-- 35.	Indique quantos discos foram lançados no mesmo ano ordenado pelo que tem mais
SELECT ano_lancamento, titulo
FROM tb_disco
WHERE ano_lancamento = (SELECT ano_lancamento FROM tb_disco GROUP BY ano_lancamento ORDER BY COUNT(5414) DESC LIMIT 1)
ORDER BY ano_lancamento;

-- 36.	Indique quantas vezes cada música se repete ordenado em de forma alfabética e numérica de quantidade
SELECT nome, COUNT(6881) AS quantidade FROM tb_musica
GROUP BY nome
ORDER BY nome, quantidade DESC;

-- 37.	Indique quantos artistas nasceram no mesmo dia ordenado por data crescente e quantidade decrescente, porem somente das datas que tiverem pelo menos 2 artistas e faça isso para as datas de 1890 a 2023
SELECT dt_nascimento, COUNT(28328) AS quantidade_artistas
FROM tb_artista
WHERE dt_nascimento BETWEEN '1890-01-01' AND '2023-12-31'
GROUP BY dt_nascimento
HAVING COUNT(*) >= 2
ORDER BY dt_nascimento ASC, quantidade_artistas DESC;

-- 38.	Busque o maior id de gravadoras
SELECT MAX(id) AS id_gravadora FROM tb_disco;

-- 39.	Busque o maior id de musica
SELECT MAX(id) AS id_musica FROM tb_disco;

-- 40.	Busque o maior id de disco
SELECT MAX(id) AS id_disco FROM tb_musica;

-- 41.	Deseja-se saber quantos discos cada gravadora possui
SELECT g.nome, COUNT(d.id) AS total_discos
FROM tb_gravadora g
LEFT JOIN tb_disco d ON g.id = d.id_gravadora
GROUP BY g.nome;

-- 42.	Deseja-se saber quantos discos são de cada gênero
SELECT g.nome, COUNT(d.id) AS total_discos
FROM tb_genero g
LEFT JOIN tb_disco d ON g.id = d.id_genero
GROUP BY g.nome;

-- 43.	Deseja-se saber quantos discos cada gênero possui, porém somente dos que vieram do ano 2000 para a frente e dos que possuírem mais que um disco
SELECT g.nome, COUNT(d.id) AS total_discos
FROM tb_genero g
JOIN tb_disco d ON g.id = d.id_genero
WHERE d.ano_lancamento >= 2000
GROUP BY g.nome
HAVING COUNT(d.id) > 1;

-- 44.	Indique o tempo de duração total de cada disco usando a tabela música.
SELECT d.titulo, SEC_TO_TIME(SUM(TIME_TO_SEC(m.duracao))) AS duracao_total FROM tb_disco d
JOIN tb_musica m ON d.id = m.id_disco
GROUP BY d.id;
 
-- 45.	Consulte a duração de todos os discos usando a tabela música e mostre somente os discos que tenham duração entre 1 a 3 horas
SELECT d.titulo, SEC_TO_TIME(SUM(TIME_TO_SEC(m.duracao))) AS duracao_total FROM tb_disco d
JOIN tb_musica m ON d.id = m.id_disco
GROUP BY d.id
HAVING SUM(TIME_TO_SEC(m.duracao)) BETWEEN 3600 AND 10800;

-- 46.	Consulte a quantidade de discos de cada artista, mas contabilize apenas aqueles que tiverem mais que uma hora e iniciem seu título com consoantes.
SELECT a.nome, COUNT(d.id) AS quantidade_discos FROM tb_artista a
JOIN tb_disco d ON a.id = d.id_artista
WHERE TIME_TO_SEC(d.duracao) > 3600 AND LOWER(SUBSTRING(d.titulo, 1, 1)) REGEXP '^[bcdfghjklmnpqrstvwxyz]'
GROUP BY a.id;

-- 47.	Consulte a duração total das músicas da tabela
SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(duracao))) AS duracao_total FROM tb_musica;

-- 48.	Consulte a duração das músicas dos discos pares.
SELECT m.nome AS nome_musica, m.duracao FROM tb_musica m
JOIN tb_disco d ON m.id_disco = d.id
WHERE d.id % 2 = 0;

-- 49.	Mostre o nome do disco e da gravadora porem mostre somente aqueles que estão relacionados
SELECT d.titulo, g.nome FROM tb_disco d
INNER JOIN tb_gravadora g ON d.id_gravadora = g.id;

-- 50.	Mostre o nome de todos os discos e quando disponível o nome das gravadoras de cada um
SELECT d.titulo, COALESCE(g.nome, 'Sem gravadora') AS nome_gravadora FROM tb_disco d
LEFT JOIN tb_gravadora g ON d.id_gravadora = g.id;
 
-- 51.	Mostre o nome do disco 32 e todas as músicas desse disco.
SELECT d.titulo, m.nome AS nome_musica FROM tb_disco d
JOIN tb_musica m ON d.id = m.id_disco
WHERE d.id = 32;

-- 52.	Consulte o nome do disco 80252 mostrando todas as suas músicas e mostre também o nome da gravadora
SELECT  d.titulo, m.nome AS nome_musica, g.nome FROM tb_disco d
JOIN tb_musica m ON d.id = m.id_disco
LEFT JOIN tb_gravadora g ON d.id_gravadora = g.id
WHERE d.id = 80252;

-- 53.	Mostre o nome de todos os discos e todas as gravadoras e dos discos mostre também o ano de lançamento.
SELECT d.titulo, d.ano_lancamento, g.nome FROM tb_disco d
LEFT JOIN tb_gravadora g ON d.id_gravadora = g.id;

-- 54.	Mostre quantas músicas cada disco possui. E deseja-se saber também o nome do disco.
SELECT d.titulo, COUNT(m.id) AS quantidade_musicas FROM tb_disco d
LEFT JOIN tb_musica m ON d.id = m.id_disco
GROUP BY d.id, d.titulo;

-- 55.  Mostre o nome das músicas e o nome do disco dessas musicas
SELECT m.nome AS nome_musica, d.titulo AS nome FROM tb_musica m
JOIN tb_disco d ON m.id_disco = d.id;

-- 56.	Mostre o nome dos discos e o nome do artista ordenado por artista, deseja-se saber todos os artistas e todos os discos
SELECT a.nome, d.titulo FROM tb_artista a
CROSS JOIN tb_disco d
ORDER BY a.nome;

-- 57.	Mostre o nome do disco, da gravadora e do artista ordenado por gravadora
SELECT d.titulo, g.nome, a.nome FROM tb_disco d
JOIN tb_gravadora g ON d.id_gravadora = g.id
JOIN tb_artista a ON d.id_artista = a.id
ORDER BY g.nome;

-- 58.	Mostre nome do disco, ano de lançamento, tempo, nome da gravadora e nome completo do artista, junto a sua idade, ordenado por artista
SELECT d.titulo AS nome_disco, d.ano_lancamento, d.duracao AS tempo, g.nome, a.nome AS nome_completo_artista, TIMESTAMPDIFF(YEAR, a.dt_nascimento, CURDATE()) AS idade FROM tb_disco d
JOIN tb_gravadora g ON d.id_gravadora = g.id
JOIN tb_artista a ON d.id_artista = a.id
ORDER BY nome_completo_artista; 

-- 59.	Mostre o nome do disco e todos os dados da música, exceto fk’s, porem somente dos   discos 1, 10, 100, 1000, 10000, 100000 ordenado por disco.
SELECT d.titulo, m.nome AS nome, m.duracao, m.id AS id_musica FROM tb_disco d
JOIN tb_musica m ON d.id = m.id_disco
-- WHERE d.id IN(1, 10, 100, 1000, 10000, 100000)
ORDER BY d.id;

-- 60.	Mostre nome da gravadora, todos os dados do artista, exceto fk’s, todos os dados do disco exceto fk’s, e todos os dados das músicas relacionados, ordenado por artista porem mostre apenas dos discos de 1000 a 15000.
SELECT g.nome, a.nome, a.dt_nascimento AS data_nascimento_artista, d.titulo, d.ano_lancamento AS ano_lancamento_disco, d.duracao AS duracao_disco, m.nome AS nome_musica, m.duracao AS duracao_musica
FROM tb_disco d
JOIN tb_gravadora g ON d.id_gravadora = g.id
JOIN tb_artista a ON d.id_artista = a.id
JOIN tb_musica m ON d.id = m.id_disco
WHERE d.id BETWEEN 1000 AND 15000
ORDER BY a.nome;

-- 61.	Mostre quantas músicas estão cadastradas.
SELECT COUNT(*) AS total_musicas FROM tb_musica;

-- 62.	Mostre a maior música.
SELECT * FROM tb_musica
ORDER BY duracao DESC LIMIT 1;

-- 63.	Mostre a menor disco.
SELECT * FROM tb_disco
ORDER BY duracao LIMIT 1;

-- 64.	Mostre quantos discos cada gravadora possui em ordem decrescente deseja-se saber o nome da gravadora
SELECT g.nome, COUNT(d.id) AS total_discos FROM tb_gravadora g
LEFT JOIN tb_disco d ON g.id = d.id_gravadora
GROUP BY g.nome
ORDER BY total_discos DESC;

-- 65.	Mostre quantos discos cada gênero possui em ordem decrescente 
SELECT g.nome, COUNT(d.id) AS total_discos FROM tb_genero g
LEFT JOIN tb_disco d ON g.id = d.id_genero
GROUP BY g.nome
ORDER BY total_discos DESC;

-- 66.	Deseja-se saber o nome do gênero
SELECT nome FROM tb_genero;

-- 67.	Mostre o tempo total de cada disco, porém mostre apenas os que possuem tempo superior a 1 hora, ordenado de forma decrescente (faça usando a tabela musica).
SELECT d.titulo, SEC_TO_TIME(SUM(TIME_TO_SEC(m.duracao))) AS tempo_total FROM tb_disco d
JOIN tb_musica m ON d.id = m.id_disco
GROUP BY d.id, d.titulo
HAVING SUM(TIME_TO_SEC(m.duracao)) > 3600
ORDER BY tempo_total DESC;

-- 68.	Mostre quantos discos cada gravadora possui, mostre apenas as que possuem mais que 500 discos e que o ano de lançamento seja de 2000 para a frente ordenado de forma crescente de ano
SELECT g.nome, COUNT(d.id) AS total_discos FROM tb_gravadora g
JOIN tb_disco d ON g.id = d.id_gravadora
WHERE d.ano_lancamento >= 2000
GROUP BY g.id
HAVING total_discos > 500;

-- 69.	Deseja-se saber o nome da gravadora.
SELECT nome FROM tb_gravadora;

-- 70.	Mostre quantos discos cada artista possui filtrando apenas os que tem mais que 10 e tenha e não estejam presentes os anos 1985, 1998 e 2002.
SELECT a.nome AS artista, COUNT(d.id) AS total_discos FROM tb_artista a
JOIN tb_disco d ON a.id = d.id_artista
WHERE d.ano_lancamento NOT IN (1985, 1998, 2002)
GROUP BY a.id
HAVING COUNT(d.id) > 10;

