SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS dicas;
DROP TABLE IF EXISTS tentativas;
DROP TABLE IF EXISTS comentarios;
DROP TABLE IF EXISTS segredos;
DROP TABLE IF EXISTS usuarios;

SET FOREIGN_KEY_CHECKS = 1;

-- Tabela de segredos
CREATE TABLE segredos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    conteudo TEXT NOT NULL,
    tentativas_disponiveis INT NULL, -- NULL para tentativas infinitas
    usuario_id INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Tabela de tentativas
CREATE TABLE tentativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    segredo_id INT,
    usuario_id INT,
    total_tentativas INT DEFAULT 0, -- Contagem total de tentativas feitas
    dicas_utilizadas INT DEFAULT 0, -- Contagem de dicas usadas
    resultado ENUM('certo', 'errado') DEFAULT 'errado',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (segredo_id) REFERENCES segredos(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Tabela de comentários
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    segredo_id INT,
    usuario_id INT,
    comentario TEXT NOT NULL,
    parent_id INT DEFAULT NULL,
    status ENUM('aprovado', 'pendente') DEFAULT 'pendente',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (segredo_id) REFERENCES segredos(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (parent_id) REFERENCES comentarios(id) ON DELETE CASCADE
);

-- Tabela de dicas
CREATE TABLE dicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    segredo_id INT,
    dica TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (segredo_id) REFERENCES segredos(id) ON DELETE CASCADE
);

-- Tabela de likes
CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comentario_id INT,
    usuario_id INT,
    FOREIGN KEY (comentario_id) REFERENCES comentarios(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    UNIQUE (comentario_id, usuario_id) -- Um usuário pode dar like apenas uma vez em um comentário
);

SET FOREIGN_KEY_CHECKS = 1;
