
# 📚 Sistema de Gerenciamento de Biblioteca

## 📌 Descrição do Projeto

Este projeto tem como objetivo desenvolver um sistema de gerenciamento eficiente para bibliotecas, permitindo o controle completo de:

* 📖 Livros
* 🔄 Empréstimos
* 👥 Clientes
* 🧑‍💼 Funcionários

A solução propõe a implementação de um banco de dados robusto, capaz de armazenar, consultar e gerenciar informações de forma segura e eficiente, além de possibilitar a geração de relatórios relevantes para apoio à tomada de decisão.

---

## 🎯 Objetivos

* Centralizar o controle de dados da biblioteca
* Facilitar o gerenciamento de empréstimos
* Melhorar o acompanhamento de clientes e funcionários
* Garantir integridade e organização das informações
* Permitir consultas rápidas e geração de relatórios

---

# 🧠 Modelagem de Dados

A modelagem deste sistema foi desenvolvida em três níveis fundamentais da Engenharia de Dados:

---

## 🔵 Modelo Conceitual

Representa a visão de negócio do sistema, destacando entidades e relacionamentos principais.

<p align="center">
  <img src="docs/modelo_conceitual.png" width="700"/>
</p>

---

## 🟢 Modelo Lógico

Define a estrutura do banco de dados com atributos, chaves primárias e estrangeiras.

<p align="center">
  <img src="docs/modelo_logico.png" width="700"/>
</p>

---

## 🟣 Modelo Físico

Representa a implementação real no banco de dados, incluindo tipos de dados e constraints.

<p align="center">
  <img src="docs/modelo_fisico.png" width="700"/>
</p>

---

## 🏗️ Diagrama Geral do Banco

<p align="center">
  <img src="docs/diagrama_biblioteca.png" width="700"/>     
</p>

---

## 📌 Arquitetura do Sistema

Este sistema utiliza um modelo relacional com foco em integridade e escalabilidade.  
Os diagramas acima representam a evolução da modelagem até a implementação final no banco de dados.

---

## 🏗️ Estrutura do Sistema

O sistema é baseado em um modelo relacional, contendo as principais entidades:

* **Cliente** → Usuários da biblioteca
* **Livro** → Acervo disponível
* **Empréstimo** → Registro de retirada e devolução
* **Funcionário** → Responsáveis pelo sistema

---

## 🗄️ Modelagem do Banco de Dados (Exemplo)

```sql
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150),
    autor VARCHAR(100),
    categoria VARCHAR(50),
    estoque INT
);

CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_livro INT,
    id_funcionario INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);
````

---

## ⚙️ Funcionalidades

✔ Cadastro de clientes

✔ Cadastro de livros

✔ Controle de estoque

✔ Registro de empréstimos e devoluções

✔ Relatórios de uso da biblioteca

✔ Consulta de dados de forma rápida

---

## 📊 Exemplos de Consultas

```sql
-- Listar todos os livros
SELECT * FROM livro;

-- Empréstimos ativos
SELECT * FROM emprestimo
WHERE data_devolucao IS NULL;

-- Livros mais emprestados
SELECT id_livro, COUNT(*) AS total
FROM emprestimo
GROUP BY id_livro
ORDER BY total DESC;
```

## 📥 Downloads

- 📘 [Baixar Ebook PDF](docs/ebook_procedure_sql_profissional.pdf)


# 📘 Proceudre - Delimitadores - Transaction e Commit no SQL

<img 
src="docs/procedure_sql_profissional.png" 
alt="Procedure em SQL" 
width="1200">

<img 
src="docs/delimitadores_SQL.png" 
alt="Delimitadores em SQL" 
width="1200">

<img 
src="docs/transaction_commit.png" 
alt="Transaction e Commit no SQL" 
width="1200">

---

## 🚀 Tecnologias Utilizadas

* 🐬 MySQL (Banco de Dados)
* 💻 SQL
* 🧠 Modelagem de Dados
* BRModelo
* Draw.io

---

## 📈 Possíveis Melhorias

* Interface Web (Django ou Flask)
* API REST para integração
* Sistema de autenticação de usuários
* Dashboard com gráficos e indicadores
* Notificações de atraso de devolução

---

## 👨‍💻 Autor

**Lúcio Fábio Barbosa de Lima**
📧 [engenheirodedados.luciofabio@gmail.com](mailto:engenheirodedados.luciofabio@gmail.com)

🔗 LinkedIn: [https://linkedin.com/in/lúcio-fábio-barbosa](https://linkedin.com/in/lúcio-fábio-barbosa)

---

## 📄 Licença

Este projeto é de uso educacional e pode ser adaptado para fins acadêmicos e profissionais.









