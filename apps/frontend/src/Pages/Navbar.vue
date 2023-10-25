<template>
    <div class="navbar-center lg:flex">
        <ul class="menu menu-horizontal px-1">
            <li><router-link to="/produtos">Produtos</router-link></li>
            <li><router-link to="/tipos_produtos">Tipos de Produto</router-link></li>
            <li><router-link to="/impostos">Impostos</router-link></li>
            <li><router-link to="/vendas">Vendas</router-link></li>
        </ul>
    </div>
</template>

<script>
export default {
    name: 'Navbar',
};
</script>
  
<style scoped>
/* Estilos específicos para o componente Navbar podem ser adicionados aqui */
</style>