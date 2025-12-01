UPDATE cliente
SET telefone = '99999-0000'
WHERE id_cliente = 1;

UPDATE consulta
SET tipo_servico = 'Limpeza de Pele Profunda'
WHERE id_consulta = 3;

UPDATE medicamentos
SET quantidade = quantidade - 1
WHERE id_medicamentos = 2 AND quantidade > 0;

DELETE FROM cliente
WHERE id_cliente = 5
AND id_cliente NOT IN (SELECT id_cliente FROM consulta);

DELETE FROM medicamentos
WHERE data_validade < DATE('now');

DELETE FROM procedimentos
WHERE id_consulta = 4;


SELECT 
    c.id_consulta,
    c.data_consulta,
    c.tipo_servico,
    cli.nome AS cliente,
    est.nome AS esteticista
FROM consulta c
JOIN cliente cli ON c.id_cliente = cli.id_cliente
JOIN esteticista est ON c.id_esteticista = est.id_esteticista
ORDER BY c.data_consulta ASC;

SELECT 
    p.nome_proced,
    p.data_proced,
    m.nome_med AS medicamento,
    est.nome AS esteticista_responsavel
FROM procedimentos p
JOIN medicamentos m ON p.id_medicamentos = m.id_medicamentos
JOIN esteticista est ON p.id_esteticista = est.id_esteticista
ORDER BY p.data_proced DESC;
