import { createRouter, createWebHistory } from 'vue-router';

import Produtos from './Pages/Produtos.vue';
import TiposProdutos from './Pages/TiposProdutos.vue';
import Impostos from './Pages/Impostos.vue';
import Vendas from './Pages/Vendas.vue';

const routes = [
  { path: '/produtos', component: Produtos },
  { path: '/tipos_produtos', component: TiposProdutos },
  { path: '/impostos', component: Impostos },
  { path: '/vendas', component: Vendas },
  { path: '/:catchAll(.*)', redirect: '/produtos' },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;