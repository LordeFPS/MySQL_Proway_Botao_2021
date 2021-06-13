-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Jun-2021 às 22:16
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
(4, '777', 'Seven', 'JayJay', '2021-05-23 18:46:06', '87905', '(66) 66 6 6666-6666', 'Jauiu', 'LL');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `cliente_venda`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `cliente_venda` (
`Razão Social Cliente` varchar(50)
,`Nome Cliente` varchar(50)
,`CNPJ Cliente` varchar(20)
,`Valor` float(10,2)
,`Data Venda` datetime
,`Codigo Cliente` varchar(10)
);

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
(1, '876', 'Joel', 'JoelMalahas', '(22) 2 2222-2222'),
(2, '123', 'Jorge', 'JorgeCarros', '(11) 1 1111-1111'),
(3, '321', 'Carlos', 'CarlosFestas', '(33) 3 3333-3333'),
(4, '645', 'Ramos', 'RamosGalho', '(44) 4 4444-4444'),
(5, '767', 'Santos', 'SantosCorredor', '(55) 5 5555-5555');

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

--
-- Extraindo dados da tabela `item_venda`
--

INSERT INTO `item_venda` (`id`, `codigo_item_venda`, `id_produto`, `valor`, `qtde`, `desconto`) VALUES
(1, 1, 1, 100.00, 10, 0.00),
(2, 2, 2, 10.00, 15, 0.00),
(3, 3, 3, 15.00, 10, 0.00),
(4, 4, 4, 70.00, 5, 0.00),
(5, 5, 5, 10000.00, 1, 0.00);

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

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `codigo_produto`, `descricao`, `valor`, `situacao`, `id_fornecedor`) VALUES
(1, 'B1', 'Roupa', 100.00, 'P', 1),
(2, 'B2', 'Chinelo', 10.00, 'P', 2),
(3, 'B3', 'Camas', 15.00, 'P', 3),
(4, 'B4', 'Banho', 70.00, 'P', 4),
(5, 'B5', 'Carro', 10000.00, 'P', 5);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `rel_produtos_ativos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `rel_produtos_ativos` (
`id` int(11)
,`codigo_produto` varchar(20)
,`descricao` varchar(100)
,`valor` float(10,2)
,`Fornecedor` varchar(20)
);

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
  `date_venda` datetime DEFAULT current_timestamp(),
  `id_item_venda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `codigo_venda`, `id_cliente`, `id_fornecedor`, `id_vendedor`, `valor`, `desconto`, `date_venda`, `id_item_venda`) VALUES
(1, '10', 1, 1, 1, 1000.00, 0.00, '2021-06-13 17:45:25', 1),
(2, '11', 2, 2, 2, 150.00, 0.00, '2021-06-13 17:45:25', 2),
(3, '12', 3, 3, 3, 150.00, 0.00, '2021-06-13 17:45:25', 3),
(4, '13', 4, 4, 4, 350.00, 0.00, '2021-06-13 17:45:25', 4),
(5, '14', 5, 5, 5, 10000.00, 0.00, '2021-06-13 17:45:25', 5);

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
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`id`, `codigo_vendedor`, `nome`, `razao_venda`, `telefone`, `n_porcvenda`) VALUES
(1, 'A1', 'Carlos', 'Prestador de Serviço', '(11) 1 1111-1111', 10.00),
(2, 'A2', 'Samuel', 'Prestador de Serviço', '(22) 2 2222-2222', 10.00),
(3, 'A3', 'Rebeca', 'Prestador de Serviço', '(33) 3 3333-3333', 10.00),
(4, 'A4', 'Sara', 'Prestador de Serviço', '(44) 4 4444-4444', 10.00),
(5, 'A5', 'Luan', 'Prestador de Serviço', '(55) 5 5555-5555', 10.00);

-- --------------------------------------------------------

--
-- Estrutura para vista `cliente_venda`
--
DROP TABLE IF EXISTS `cliente_venda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cliente_venda`  AS SELECT `c`.`razao_social` AS `Razão Social Cliente`, `c`.`nome` AS `Nome Cliente`, `c`.`cnpj` AS `CNPJ Cliente`, `v`.`valor` AS `Valor`, `v`.`date_venda` AS `Data Venda`, `c`.`codigo` AS `Codigo Cliente` FROM (`cliente` `c` join `venda` `v` on(`v`.`id_cliente` = `c`.`id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `rel_produtos_ativos`
--
DROP TABLE IF EXISTS `rel_produtos_ativos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rel_produtos_ativos`  AS SELECT `p`.`id` AS `id`, `p`.`codigo_produto` AS `codigo_produto`, `p`.`descricao` AS `descricao`, `p`.`valor` AS `valor`, (select `f`.`nome` from `fornecedor` `f` where `f`.`id` = `p`.`id_fornecedor`) AS `Fornecedor` FROM `produto` AS `p` WHERE `p`.`situacao` = 'P' ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `idx_cliente_cnpj` (`cnpj`),
  ADD KEY `idx_cliente_id` (`id`);

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
  ADD KEY `fk_vend_vendedor` (`id_vendedor`),
  ADD KEY `fk_itvenda_venda` (`id_item_venda`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `fk_itvenda_venda` FOREIGN KEY (`id_item_venda`) REFERENCES `item_venda` (`id`),
  ADD CONSTRAINT `fk_vend_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk_vend_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`),
  ADD CONSTRAINT `fk_vend_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
