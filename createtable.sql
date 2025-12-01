BEGIN TRANSACTION;


Create table cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100) NOT NULL,
    telefone TEXT(15)
);

Create table esteticista(
    id_esteticista INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100) NOT NULL,
    telefone TEXT(15)
);

Create table consulta(
    id_consulta INTEGER PRIMARY KEY AUTOINCREMENT,
    data_consulta TEXT NOT NULL,
    tipo_servico TEXT(100) NOT NULL,
    id_cliente INTEGER,
    id_esteticista INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_esteticista) REFERENCES esteticista(id_esteticista)
);

Create table medicamentos(
    id_medicamentos INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_med TEXT(100) NOT NULL,
    quantidade INTEGER NOT NULL,
    data_validade TEXT NOT NULL,
    id_consulta INTEGER,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

Create table procedimentos(
    id_procedimentos INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_proced TEXT(100) NOT NULL,
    data_proced TEXT NOT NULL,
    dose_aplicada TEXT NOT NULL,
    id_medicamentos INTEGER,
    id_esteticista INTEGER,
    id_consulta INTEGER,
    FOREIGN KEY (id_medicamentos) REFERENCES medicamentos(id_medicamentos),
    FOREIGN KEY (id_esteticista) REFERENCES esteticista(id_esteticista),
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
)

COMMIT