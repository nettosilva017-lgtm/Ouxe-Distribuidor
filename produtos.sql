-- OUXE Distribuidor - Banco de Dados
-- Gerado em: 2026-07-22T09:03:54.017905
CREATE TABLE IF NOT EXISTS produtos (
  id INT PRIMARY KEY,
  sku VARCHAR(20),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(100),
  price DECIMAL(10,2),
  category VARCHAR(100),
  image TEXT,
  stock INT DEFAULT 100,
  active BOOLEAN DEFAULT TRUE,
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE IF NOT EXISTS categorias (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  slug VARCHAR(100)
);

INSERT INTO categorias (id, name, slug) VALUES (1, 'Alimentos', 'alimentos');
INSERT INTO categorias (id, name, slug) VALUES (2, 'Cosméticos', 'cosm-ticos');
INSERT INTO categorias (id, name, slug) VALUES (3, 'Limpeza', 'limpeza');
INSERT INTO categorias (id, name, slug) VALUES (4, 'Outros', 'outros');
INSERT INTO categorias (id, name, slug) VALUES (5, 'Produtos Naturais', 'produtos-naturais');

INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (1, 'OUXE-0001', 'BIO INSTINTO KIDS - KIT CABELOS E CORPO PH NEUTRO 4 ITENS', 'bio-instinto-kids-kit-cabelos-e-corpo-ph-neutro-4-itens', 29.76, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (2, 'OUXE-0002', 'CANELA DE VELHO BISNAGA 150G', 'canela-de-velho-bisnaga-150g', 6.99, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (3, 'OUXE-0003', 'CHICORIA COM MANA 30 ML OURINATUS', 'chicoria-com-mana-30-ml-ourinatus', 3.35, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (4, 'OUXE-0004', 'CLORETO DE MAGNÉSIA CAPSULA P.A 60', 'cloreto-de-magn-sia-capsula-p-a-60', 28.0, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (5, 'OUXE-0005', 'CLORETO DE MAGNESIO CAPSULA DUOM 60', 'cloreto-de-magnesio-capsula-duom-60', 18.99, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (6, 'OUXE-0006', 'CREME HID LAB BG AMORA CLARO 10G', 'creme-hid-lab-bg-amora-claro-10g', 19.09, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (7, 'OUXE-0007', 'CREME HID SEBO DE CARNEIRO ARGAN CACAU 200G', 'creme-hid-sebo-de-carneiro-argan-cacau-200g', 7.88, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (8, 'OUXE-0008', 'CREME PARA OS PES E MÃOS COM SEBO DE CARNEIRO 240G APINIL', 'creme-para-os-pes-e-m-os-com-sebo-de-carneiro-240g-apinil', 4.99, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (9, 'OUXE-0009', 'CREME TIRA MANACHAS 20 GR GD INDIAN', 'creme-tira-manachas-20-gr-gd-indian', 14.0, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (10, 'OUXE-0010', 'DEO COLONIA ARRAZO 100 ML', 'deo-colonia-arrazo-100-ml', 18.97, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (11, 'OUXE-0011', 'DEO COLONIA SKAND 100ML', 'deo-colonia-skand-100ml', 18.39, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (12, 'OUXE-0012', 'ENXOFRE EM PO 30G', 'enxofre-em-po-30g', 4.87, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (13, 'OUXE-0013', 'GOTAS MILAGROSA 30 ML NATTY VIDA UND', 'gotas-milagrosa-30-ml-natty-vida-und', 5.01, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (14, 'OUXE-0014', 'HIDRATANTE SEBO DE CARNEIRO 240G APINIL', 'hidratante-sebo-de-carneiro-240g-apinil', 4.99, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (15, 'OUXE-0015', 'JALAPA 30 ML PARAMED', 'jalapa-30-ml-paramed', 2.65, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (16, 'OUXE-0016', 'LOÇÃO HIDRATANTE AMEIXA 10G APINIL', 'lo-o-hidratante-ameixa-10g-apinil', 6.89, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (17, 'OUXE-0017', 'LOÇAO HIDRATANTE ROSA MOSQUETA 190G APINIL', 'lo-ao-hidratante-rosa-mosqueta-190g-apinil', 6.89, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (18, 'OUXE-0018', 'MICOSAN 30 GR NATTY VIDA', 'micosan-30-gr-natty-vida', 5.1, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (19, 'OUXE-0019', 'MOUSSE MICELAR MORANGO 150 ML', 'mousse-micelar-morango-150-ml', 13.79, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (20, 'OUXE-0020', 'MOUSSE MICELAR ROSA MOSQUETA 150 APINIL', 'mousse-micelar-rosa-mosqueta-150-apinil', 13.79, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (21, 'OUXE-0021', 'OLEO CAPILAR DE COCO 120 ML', 'oleo-capilar-de-coco-120-ml', 8.35, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (22, 'OUXE-0022', 'OLEO DE MENTA EXTRA FORTE 10 ML', 'oleo-de-menta-extra-forte-10-ml', 7.0, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (23, 'OUXE-0023', 'OLEO DE ROSA MOSQUETA 30 ML APINIL', 'oleo-de-rosa-mosqueta-30-ml-apinil', 4.96, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (24, 'OUXE-0024', 'PACOTE BALAS GENGIBRE 100 UNDS', 'pacote-balas-gengibre-100-unds', 17.96, 'Alimentos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (25, 'OUXE-0025', 'POMADA MASSAGEADORA CARTILAGEM DE TUBARÃO 150G', 'pomada-massageadora-cartilagem-de-tubar-o-150g', 5.45, 'Produtos Naturais', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (26, 'OUXE-0026', 'POMADA PRETA 240G APINIL', 'pomada-preta-240g-apinil', 4.99, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (27, 'OUXE-0027', 'POTE BALAS GENGIBRE', 'pote-balas-gengibre', 85.0, 'Alimentos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (28, 'OUXE-0028', 'SABONETE BARBATIMÃO AROMED 90G', 'sabonete-barbatim-o-aromed-90g', 2.59, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (29, 'OUXE-0029', 'SABONETE COCO AROMED 90G', 'sabonete-coco-aromed-90g', 2.34, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (30, 'OUXE-0030', 'SABONETE DE AROIERA AROMED UND 90G', 'sabonete-de-aroiera-aromed-und-90g', 2.2, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (31, 'OUXE-0031', 'SABONETE ENXOFRE AROMED 90G', 'sabonete-enxofre-aromed-90g', 2.87, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (32, 'OUXE-0032', 'SABONETE GLICERINA AROMED 90G', 'sabonete-glicerina-aromed-90g', 2.65, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (33, 'OUXE-0033', 'SABONETE INTIMO MENTA APINIL 210ML', 'sabonete-intimo-menta-apinil-210ml', 5.45, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (34, 'OUXE-0034', 'SOLUÇAO TIRA MANCHAS 100 ML GD INDIAN', 'solu-ao-tira-manchas-100-ml-gd-indian', 14.0, 'Limpeza', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (35, 'OUXE-0035', 'SPRAY REPELENTE DE INSETO 200 ML', 'spray-repelente-de-inseto-200-ml', 10.01, 'Outros', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (36, 'OUXE-0036', 'SPRAY REPELENTE DE INSETOS INFANTIL 200 ML', 'spray-repelente-de-insetos-infantil-200-ml', 10.01, 'Outros', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');
INSERT INTO produtos (id, sku, name, slug, price, category, image, stock, active, created_at, updated_at) VALUES (37, 'OUXE-0037', 'SUPER DESODORANTE CITRUS 150 ML CIMED', 'super-desodorante-citrus-150-ml-cimed', 19.34, 'Cosméticos', '', 100, TRUE, '2026-07-22T09:03:54.017905', '2026-07-22T09:03:54.017905');