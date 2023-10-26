<script setup>
</script>

<template>
    <div class="container mx-auto">
        <div class="navbar bg-base-100">
            <div class="navbar-start">
                <div class="dropdown">
                    <label tabindex="0" class="btn btn-ghost lg:hidden">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h8m-8 6h16" />
                        </svg>
                    </label>
                </div>
                <a href="https://www.softexpert.com/">
                    <img class="btn btn-ghost normal-case text-xl"
                        src="https://www.softexpert.com/wp-content/themes/Zephyr-child/icon-softexpert-site.png"
                        alt="SoftExpert Logo">
                </a>
            </div>
            <Navbar />
            <ModalSuccess />
            <ModalError :error-message="this.mensagem_erro" />
            <div class="navbar-end">
                <a href="https://github.com/jonas-elias/mercado-software-expert-frontend.git" class="btn">GitHub</a>
            </div>
        </div>

        <input type="checkbox" id="modal_insert_venda" class="modal-toggle" />
        <div class="modal">
            <div class="modal-box">
                <h3 class="font-bold text-lg">Adicione uma nova venda</h3>

                <div v-for="(item, index) in this.produtosGrupo" :key="index">
                    <div class="form-control w-full">
                        <label class="label">
                            <span class="label-text">Produto:</span>
                        </label>
                        <select @click="this.getValorProduto(item)" v-model="item.id_produto"
                            class="select select-bordered w-full">
                            <option value="0">Selecione um produto</option>
                            <option v-for="tipo in this.produtos" :key="tipo.id" :value="tipo.id">{{ tipo.nome }}</option>
                        </select>
                    </div>
                    <div class="form-control w-full">
                        <label class="label">
                            <span class="label-text">Quantidade:</span>
                        </label>
                        <input @keyup="this.getValorTotalProduto(item)" v-model="item.quantidade" type="number"
                            placeholder="Quantidade" class="input input-bordered w-full" />
                    </div>
                    <div class="flex justify-between mt-2">
                        <div>
                            <button @click="this.addProduct" class="mr-3 text-md">Adicionar</button>
                            <button @click="this.removeProduct(index)">Remover</button>
                        </div>
                        <span class="text-md">Total produto (com impostos): {{ item.total }}</span>
                    </div>
                </div>

                <div class="mt-5">
                    <span class="text-md">Total venda (sem impostos): R${{ this.total_venda }}</span>
                </div>
                <div>
                    <span class="text-md">Total impostos: R${{ this.total_impostos }}</span>
                </div>
                <div class="modal-action">
                    <label for="modal_insert_venda" class="btn">Fechar</label>
                    <label for="modal_insert_venda" class="btn" @click="this.saveVenda()">Salvar</label>
                </div>
            </div>
        </div>
        <div class="mt-5">
            <div class="flex justify-between items-center">
                <h1 class="text-lg">Vendas</h1>
                <div>
                    <label @click="create()" class="btn btn-md btn-primary" for="modal_insert_venda">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                            <path
                                d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z" />
                        </svg>
                    </label>
                </div>
            </div>
            <div class="overflow-x-auto">
                <div v-if="this.items[0]">
                    <table class="table table-zebra">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Total da Compra</th>
                                <th>Total Impostos</th>
                                <th>Data venda</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in this.items" :key="item.id">
                                <td>{{ item.id }}</td>
                                <td>R${{ item.total_venda }}</td>
                                <td>R${{ item.total_impostos }}</td>
                                <td>{{ item.data_venda }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else>
                    <div class="flex items-center justify-center h-32">
                        <p class="text-lg">Nenhum item encontrado.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import Navbar from './Navbar.vue';
import ModalError from '../Modal/ErrorModal.vue'
import ModalSuccess from '../Modal/SuccessModal.vue'
import axios from 'axios'

export default {
    components: {
        Navbar,
        ModalSuccess,
        ModalError,
    },
    data() {
        return {
            produtosGrupo: [
                {
                    produto: "", quantidade: 0, total: 0,
                    valor_item: 0, valor_total: 0, valor_imposto: 0, id_produto: 0
                }
            ],
            apiProdutos: 'http://localhost:8000/api/produto',
            apiVendas: 'http://localhost:8000/api/venda',
            apiItensVenda: 'http://localhost:8000/api/itemVenda',
            produtos: [],
            total_venda: 0,
            total_impostos: 0,
            items: [],
            mensagem_erro: '',
        };
    },
    mounted() {
        this.getVendas();
        this.getProdutos();
    },
    methods: {
        getProdutos() {
            axios.get(this.apiProdutos).then((res: any) => {
                this.produtos = res.data['dados']
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            });
        },
        getVendas() {
            axios.get(this.apiVendas).then((res: any) => {
                this.items = res.data['dados']
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            });
        },
        addProduct() {
            this.produtosGrupo.push({ produto: "", quantidade: 0, total: 0, valor_item: 0, valor_total: 0, valor_imposto: 0, id_produto: 0 });
        },
        removeProduct(index: number) {
            this.produtosGrupo.splice(index, 1);
        },
        saveVenda() {
            axios.post(this.apiItensVenda, JSON.stringify({
                venda: {
                    total_venda: this.total_venda,
                    total_impostos: this.total_impostos
                },
                itens_venda: this.produtosGrupo
            })).then(() => {
                this.openModalSuccess()
                this.resetAttributes()
                this.getVendas()
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            })
        },
        create() {
            this.resetAttributes()
        },
        getValorProduto(objeto: any) {
            objeto.valor_total = 0

            if (objeto.id_produto) {
                axios.get(this.apiProdutos + '/' + objeto.id_produto).then((res: any) => {
                    objeto.valor_total = res.data['dados'][0]['total'] == '0.00' ? res.data['dados'][0]['preco'] : res.data['dados'][0]['total']
                    objeto.valor_imposto = res.data['dados'][0]['valor_imposto']
                    objeto.valor_item = res.data['dados'][0]['preco']
                    this.getValorTotalProduto(objeto)
                }).catch((error) => {
                    this.mensagem_erro = error.response.data.detalhes_erro
                    this.openModalError()
                });
            }
        },
        getValorTotalProduto(objeto: any) {
            objeto.total = objeto.quantidade * (objeto.valor_total ? objeto.valor_total : objeto.valor_item)
            objeto.total = Number(objeto.total).toFixed(2)
            this.calculaTotalVenda()
        },
        calculaTotalVenda() {
            let total_impostos = 0
            let total_venda = 0
            this.produtosGrupo.forEach((element: any) => {
                total_impostos += element.valor_imposto * element.quantidade
                total_venda += element.valor_item * element.quantidade
            });

            this.total_impostos = total_impostos.toFixed(2)
            this.total_venda = total_venda.toFixed(2)
        },
        openModalSuccess() {
            let labelElement: any = document.querySelector('label[for="modal_success"]');
            if (labelElement) {
                labelElement.click();
            }
        },
        openModalError() {
            let labelElement: any = document.querySelector('label[for="modal_error"]');
            if (labelElement) {
                labelElement.click();
            }
        },
        resetAttributes() {
            this.produtosGrupo = [
                {
                    produto: "", quantidade: 0, total: 0,
                    valor_item: 0, valor_total: 0, valor_imposto: 0, id_produto: 0
                }
            ]

            this.total_impostos = 0
            this.total_venda = 0
        }
    }
};
</script>