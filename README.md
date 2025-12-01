📌 Banco de Dados – Clínica Estética

Este projeto contém a modelagem e o script SQL de um banco de dados para gerenciamento de uma clínica estética.
O objetivo é organizar informações sobre clientes, esteticistas, consultas, medicamentos e procedimentos realizados.

📂 Estrutura do Banco de Dados

O banco contém as seguintes tabelas:

cliente – cadastro de clientes

esteticista – profissionais da clínica

consulta – registros das consultas realizadas

medicamentos – medicamentos utilizados

procedimentos – procedimentos aplicados aos clientes

Cada tabela utiliza chaves primárias (PK) e chaves estrangeiras (FK) para manter integridade referencial.

🛠️ Tecnologias Utilizadas


SQLiteStudio (opcional para visualização)


▶️ Como usar

Instale ou abra o SQLiteStudio.

Importe o arquivo .sql do projeto.

Execute o script para criar todas as tabelas:

BEGIN TRANSACTION;
-- CREATE TABLE...
COMMIT;


(Opcional) Execute também os INSERTs fornecidos para popular o banco.

🔍 Exemplo de consulta JOIN
SELECT 
    c.data_consulta,
    cli.nome AS cliente,
    est.nome AS esteticista
FROM consulta c
JOIN cliente cli ON c.id_cliente = cli.id_cliente
JOIN esteticista est ON c.id_esteticista = est.id_esteticista;

🎯 Objetivo

Este projeto foi criado para estudo e prática de:

Modelagem relacional

Criação de tabelas

Uso de chaves estrangeiras

Consultas SQL com JOINs

📄 Licença

Projeto para Faculdade Cruzeiro do Sul
