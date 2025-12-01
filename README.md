<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>README — Banco de Dados Clínica Estética para Projeto de Faculdade Cruzeiro do Sul</title>
  <style>
    :root{--bg:#0f1724;--card:#0b1220;--accent:#06b6d4;--muted:#94a3b8;--text:#e6eef8}
    *{box-sizing:border-box}
    body{font-family:Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial; margin:0; background:linear-gradient(180deg,#071026 0%, #081426 100%); color:var(--text);}
    .wrap{max-width:900px;margin:40px auto;padding:28px;background:rgba(255,255,255,0.02);border-radius:12px;box-shadow:0 8px 30px rgba(2,6,23,0.7)}
    header{display:flex;align-items:center;gap:16px}
    .logo{width:62px;height:62px;border-radius:10px;background:linear-gradient(135deg,var(--accent),#7c3aed);display:flex;align-items:center;justify-content:center;font-weight:700}
    h1{margin:0;font-size:20px}
    p.lead{color:var(--muted);margin-top:8px}
    section{margin-top:20px}
    h2{font-size:16px;margin:0 0 8px}
    .card{background:var(--card);padding:14px;border-radius:10px;border:1px solid rgba(255,255,255,0.02)}
    pre{white-space:pre-wrap;overflow:auto;background:rgba(2,6,23,0.6);padding:12px;border-radius:8px;border:1px solid rgba(255,255,255,0.02);color:var(--text);font-family:SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;font-size:13px}
    code{font-family:inherit}
    .btn{display:inline-block;padding:8px 12px;border-radius:8px;background:linear-gradient(90deg,var(--accent),#7c3aed);color:#04202a;text-decoration:none;font-weight:600;margin-top:10px}
    footer{margin-top:22px;color:var(--muted);font-size:13px}
    @media (max-width:640px){.wrap{margin:20px;padding:18px}}
  </style>
</head>
<body>
  <div class="wrap">
    <header>
      <div class="logo">DB</div>
      <div>
        <h1>Banco de Dados — Clínica Estética</h1>
        <p class="lead">Script SQLite com tabelas: cliente, esteticista, consulta, medicamentos e procedimentos. README pronto para GitHub.</p>
      </div>
    </header>

    <section>
      <h2>Como usar (rápido)</h2>
      <div class="card">
        <p>1. Habilite chaves estrangeiras no SQLite:</p>
        <pre><code>PRAGMA foreign_keys = ON;</code></pre>
        <p>2. Execute o script de criação (arquivo <code>schema.sql</code>) no SQLiteStudio ou CLI:</p>
        <pre><code>sqlite3 clinica.db &lt; schema.sql</code></pre>
        <p>3. Se fornecer INSERTs, execute-os após o CREATE TABLE (ou use um arquivo <code>seed.sql</code>).</p>
      </div>
    </section>

    <section>
      <h2>Script de criação (exemplo)</h2>
      <div class="card">
        <pre><code>BEGIN TRANSACTION;

PRAGMA foreign_keys = ON;

CREATE TABLE cliente (
  id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT(100) NOT NULL,
  telefone TEXT(15)
);

CREATE TABLE esteticista (
  id_esteticista INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT(100) NOT NULL,
  telefone TEXT(15)
);

CREATE TABLE consulta (
  id_consulta INTEGER PRIMARY KEY AUTOINCREMENT,
  data_consulta TEXT NOT NULL,
  tipo_servico TEXT(100) NOT NULL,
  id_cliente INTEGER,
  id_esteticista INTEGER,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_esteticista) REFERENCES esteticista(id_esteticista)
);

CREATE TABLE medicamentos (
  id_medicamentos INTEGER PRIMARY KEY AUTOINCREMENT,
  nome_med TEXT(100) NOT NULL,
  quantidade INTEGER NOT NULL,
  data_validade TEXT NOT NULL,
  id_consulta INTEGER,
  FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

CREATE TABLE procedimentos (
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
);

COMMIT;</code></pre>
      </div>
    </section>

    <section>
      <h2>Comandos Git (adicionar README e schema)</h2>
      <div class="card">
        <pre><code># criar repositório local
git init

# adicionar arquivos
git add README.html schema.sql

# commit
git commit -m "Add README and database schema"

# adicionar remoto e enviar (exemplo GitHub)
git remote add origin https://github.com/seu-usuario/seu-repo.git
git branch -M main
git push -u origin main</code></pre>
      </div>
    </section>

    <section>
      <h2>Exemplos de consultas úteis</h2>
      <div class="card">
        <pre><code>-- JOIN cliente + consulta + esteticista
SELECT c.id_consulta, c.data_consulta, c.tipo_servico,
       cli.nome AS cliente, est.nome AS esteticista
FROM consulta c
JOIN cliente cli ON c.id_cliente = cli.id_cliente
JOIN esteticista est ON c.id_esteticista = est.id_esteticista;

-- JOIN procedimentos + medicamentos + consulta
SELECT p.nome_proced, p.data_proced, m.nome_med, c.tipo_servico
FROM procedimentos p
JOIN medicamentos m ON p.id_medicamentos = m.id_medicamentos
JOIN consulta c ON p.id_consulta = c.id_consulta;</code></pre>
      </div>
    </section>

    <footer>
      <p>Gerado por você • Projeto de exemplo para estudos em SQLite. Sinta-se livre para editar e melhorar.</p>
      <a class="btn" href="#">Baixar/Usar</a>
    </footer>
  </div>
</body>
</html>
