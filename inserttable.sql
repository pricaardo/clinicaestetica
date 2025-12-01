INSERT INTO cliente (nome, telefone) VALUES
('Maria Silva', '11988887777'),
('João Pereira', '11977776666'),
('Ana Souza', '11999995555');

INSERT INTO esteticista (nome, telefone) VALUES
('Carla Mendes', '11955554444'),
('Roberta Lima', '11944443333');

INSERT INTO consulta (data_consulta, tipo_servico, id_cliente, id_esteticista) VALUES
('2025-01-10', 'Limpeza de Pele', 1, 1),
('2025-01-15', 'Peeling Químico', 2, 2),
('2025-01-20', 'Microagulhamento', 3, 1);

INSERT INTO medicamentos (nome_med, quantidade, data_validade, id_consulta) VALUES
('Ácido Hialurônico', 2, '2026-12-31', 1),
('Vitamina C Derivada', 1, '2026-05-20', 2),
('Sérum Regenerador', 3, '2027-08-10', 3);

INSERT INTO procedimentos (nome_proced, data_proced, dose_aplicada, id_medicamentos, id_esteticista, id_consulta) VALUES
('Aplicação de Ácido Hialurônico', '2025-01-10', '1 ml', 1, 1, 1),
('Peeling Superficial', '2025-01-15', 'Camada única', 2, 2, 2),
('Microagulhamento Facial', '2025-01-20', '0.5 mm', 3, 1, 3);
