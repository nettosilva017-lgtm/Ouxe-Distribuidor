# OUXE Distribuidor - Banco de Dados GitHub

Banco de dados em JSON hospedado no GitHub Pages - funciona como fonte única para todos os terminais.

## 📦 Arquivos

- `produtos.json` (raiz) -> Usado pelo site (compatível). **OBRIGATÓRIO no GitHub**
- `db/database.json` -> Banco completo com info, categorias, empresa e produtos
- `db/produtos.json` -> Só produtos com IDs, SKU, etc
- `db/categorias.json` -> Categorias
- `db/empresa.json` -> Dados da empresa
- `db/produtos.csv` -> Para Excel / Google Sheets
- `db/produtos.sql` -> Para MySQL / Postgres
- `db/db.js` -> Helper JS para carregar o banco

## 📊 Estatísticas
- Total produtos: 37
- Categorias: Alimentos, Cosméticos, Limpeza, Outros, Produtos Naturais
- Gerado em: 2026-07-22T09:03:54.017905

## 🚀 Como usar no site

O site já está configurado para carregar `./produtos.json`:

```js
fetch('./produtos.json?v='+Date.now())
  .then(r=>r.json())
  .then(produtos=>{ renderProdutos(produtos) })
```

Para usar o banco completo:

```js
const db = await OuxeDB.load('database.json');
console.log(db.produtos.length);
```

## 🔄 Fluxo de atualização (GitHub como Banco)

1. Admin cadastra/edita no painel do site
2. Clica em "Exportar produtos.json"
3. Faz commit do novo `produtos.json` no repositório
4. GitHub Pages atualiza em 1-2 min
5. Todos os terminais veem os novos produtos (sem localStorage)

## 🔧 Se você tem mais produtos no navegador

No PC onde os produtos aparecem certos:
1. Abra o site > 7 cliques no logo > senha admin
2. Backup > Exportar backup completo
3. Me envie o JSON ou use o botão "Exportar produtos.json" da nova versão

## 📱 Vantagens
- ✅ Mesmo catálogo em todos os dispositivos
- ✅ Versionamento no GitHub
- ✅ Backup automático
- ✅ Funciona offline (PWA)
- ✅ Sem servidor / sem custo
