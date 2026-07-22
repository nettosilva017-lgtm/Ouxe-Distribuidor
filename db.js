
// OUXE Distribuidor - Database Helper (GitHub como Banco)
// Use: const db = await OuxeDB.load()

const OuxeDB = {
  basePath: './db/',
  cache: null,
  
  async load(file='database.json') {
    try {
      const res = await fetch(this.basePath + file + '?v=' + Date.now(), {cache: 'no-store'});
      if(!res.ok) throw new Error('HTTP '+res.status);
      const data = await res.json();
      this.cache = data;
      console.log(`✅ DB carregado: ${file} - ${data.produtos?.length || data.length} itens`);
      return data;
    } catch(e) {
      console.warn('⚠️ Falha ao carregar DB, tentando produtos.json raiz', e);
      const res2 = await fetch('./produtos.json?v='+Date.now(), {cache: 'no-store'});
      const data2 = await res2.json();
      return {produtos: data2, categorias: []};
    }
  },

  async getProdutos() {
    const db = await this.load();
    return db.produtos || db;
  },

  async getByCategory(cat) {
    const produtos = await this.getProdutos();
    if(cat==='Todos') return produtos;
    return produtos.filter(p=>p.category===cat);
  },

  async search(term) {
    const produtos = await this.getProdutos();
    const q = term.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'');
    return produtos.filter(p=>p.name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'').includes(q));
  },

  // Para admin: gera JSON para commit no GitHub
  exportForGitHub(produtos) {
    return JSON.stringify(produtos, null, 2);
  }
};

if(typeof window!=='undefined') window.OuxeDB = OuxeDB;
