-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Maio-2021 às 23:50
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `razao_social` varchar(50) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT current_timestamp(),
  `cnpj` varchar(20) DEFAULT NULL,
  `fone` varchar(20) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `codigo`, `nome`, `razao_social`, `data_cadastro`, `cnpj`, `fone`, `cidade`, `estado`) VALUES
(1, '456', 'Jorde', 'Cafe', '2021-05-23 18:46:06', '456874', '(99) 99 9 9999-9999', 'Luiz Alvez', 'JJ'),
(2, '765', 'Kau', 'Leite', '2021-05-23 18:46:06', '234234', '(88) 88 8 8888-8888', 'Kauala', 'KK'),
(3, '579', 'Luan', 'koukou', '2021-05-23 18:46:06', '87654', '(77) 77 7 7777-7777', 'Kauaka', 'MM'),
(4, '777', 'Seven', 'JayJay', '2021-05-23 18:46:06', '87905', '(66) 66 6 6666-6666', 'Jauiu', 'LL'),
(5, '666', 'Soutou', 'Shoto', '2021-05-23 18:46:06', '09865', '(55) 55 5 5555-5555', 'JoJu', 'BB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `codigo_fornecedor` varchar(10) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `razao_social` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id`, `codigo_fornecedor`, `nome`, `razao_social`, `telefone`) VALUES
(1, '876', 'Joel', 'JoelMalahas', '(22) 2 2222-2222');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `id` int(11) NOT NULL,
  `codigo_item_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `valor` float(10,2) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `desconto` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `codigo_produto` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  `situacao` varchar(1) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `codigo_venda` varchar(20) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `valor` float(10,2) DEFAULT NULL,
  `desconto` float(10,2) DEFAULT NULL,
  `date_venda` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `id` int(11) NOT NULL,
  `codigo_vendedor` varchar(10) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `razao_venda` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `n_porcvenda` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_itemvend_produto` (`id_produto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_prod_fornecedor` (`id_fornecedor`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_vend_cliente` (`id_cliente`),
  ADD KEY `fk_vend_fornecedor` (`id_fornecedor`),
  ADD KEY `fk_vend_vendedor` (`id_vendedor`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `fk_itemvend_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_prod_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_vend_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk_vend_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`),
  ADD CONSTRAINT `fk_vend_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
