<!-- // @ts-ignore -->

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

        <input type="checkbox" id="modal_insert_impostos" class="modal-toggle" />
        <div class="modal">
            <div class="modal-box">
                <h3 class="font-bold text-lg">{{ this.titulo_modal }}</h3>
                <div class="form-control w-full">
                    <label class="label">
                        <span class="label-text">Valor:</span>
                    </label>
                    <input type="number" v-model="this.valor" placeholder="Valor" class="input input-bordered w-full" />
                </div>
                <div class="form-control w-full">
                    <label class="label">
                        <span class="label-text">Tipo produto:</span>
                    </label>
                    <select v-model="this.id_tipo_produto" class="select select-bordered w-full">
                        <option value="0">Selecione um tipo de produto</option>
                        <option v-for="tipo in this.tipos_produtos" :key="tipo.id" :value="tipo.id">{{ tipo.nome }}</option>
                    </select>
                </div>
                <div class="modal-action">
                    <label for="modal_insert_impostos" class="btn">Fechar</label>
                    <label for="modal_insert_impostos" class="btn"
                        @click="this.insert ? this.saveImposto() : this.updateImposto()">Salvar</label>
                </div>
            </div>
        </div>

        <input type="checkbox" id="modal_delete" class="modal-toggle" />
        <div class="modal">
            <div class="modal-box">
                <h3 class="font-bold text-lg">Mensagem</h3>
                <h4>Você tem certeza que deseja excluir o item?</h4>
                <div class="modal-action">
                    <label for="modal_delete" class="btn">Fechar</label>
                    <label for="modal_delete" class="btn" @click="this.deleteImposto()">Excluir</label>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <div class="flex justify-between items-center">
                <h1 class="text-lg">Impostos</h1>
                <div>
                    <label @click="this.create()" class="btn btn-md btn-primary" for="modal_insert_impostos">
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
                                <th>Valor (porcentagem)</th>
                                <th>Tipo de produto</th>
                                <th class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in this.items" :key="item.id">
                                <td>{{ item.id }}</td>
                                <td>{{ item.valor }}%</td>
                                <td>{{ item.nome }}</td>
                                <td class="text-center">
                                    <label for="modal_insert_impostos" class="btn btn-info mr-2" @click="this.edit(item.id)"><svg
                                            xmlns="http://www.w3.org/2000/svg" height="1em"
                                            viewBox="0 0 512 512">
                                            <path
                                                d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z" />
                                        </svg></label>
                                    <label for="modal_delete" class="btn btn-info" @click="this.openDelete(item.id)"><svg
                                            xmlns="http://www.w3.org/2000/svg" height="1em"
                                            viewBox="0 0 448 512">
                                            <path
                                                d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z" />
                                        </svg></label>
                                </td>
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
import ModalSuccess from '../Modal/SuccessModal.vue'
import ModalError from '../Modal/ErrorModal.vue'
import axios from 'axios'

export default {
    data() {
        return {
            api: 'http://localhost:8000/api/imposto',
            items: [],
            valor: null,
            id_imposto: null,
            id_tipo_produto: 0,
            nome_tipo_produto: '',
            tipos_produtos: [],
            insert: true,
            titulo_modal: 'Adicione o imposto',
            apiTipoProdutos: 'http://localhost:8000/api/tipoProduto',
            mensagem_erro: '',
        }
    },
    components: {
        Navbar,
        ModalSuccess,
        ModalError,
    },
    mounted() {
        this.getTipoProdutos()
        this.getImpostos()
    },
    methods: {
        getImpostos() {
            axios.get(this.api).then((res: any) => {
                this.items = res.data['dados']
            }).catch((error: any) => {
                this.mensagem_erro = error.response.data.detalhes_erro
            });
        },
        getTipoProdutos() {
            axios.get(this.apiTipoProdutos).then((res: any) => {
                this.tipos_produtos = res.data['dados']
            }).catch((error: any) => {
                this.mensagem_erro = error.response.data.detalhes_erro
            });
        },
        create() {
            this.resetAttributes()
            titulo_modal: 'Adicione o imposto'
            this.insert = true
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
        saveImposto() {
            axios.post(this.api, JSON.stringify({
                valor: this.valor,
                id_tipo_produto: this.id_tipo_produto,
            })).then(() => {
                this.openModalSuccess()
                this.resetAttributes()
                this.getImpostos()
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            })
        },
        edit(id: number) {
            this.titulo_modal = 'Edite o imposto'
            this.id_imposto = id
            this.insert = false
            axios.get(this.api + '/' + this.id_imposto).then((res: any) => {
                this.valor = res.data['dados'][0]['valor']
                this.id_tipo_produto = res.data['dados'][0]['id_tipo_produto']
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            });
        },
        updateImposto() {
            axios.put(this.api + '/' + this.id_imposto, JSON.stringify({
                valor: this.valor,
                id_tipo_produto: this.id_tipo_produto,
            })).then(() => {
                this.openModalSuccess()
                this.resetAttributes()
                this.getImpostos()
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            });
        },
        openDelete(id: number) {
            this.id_imposto = id
        },
        resetAttributes() {
            this.valor = null
            this.id_tipo_produto = 0
        },
        deleteImposto() {
            axios.delete(this.api + '/' + this.id_imposto).then(() => {
                this.openModalSuccess()
                this.getImpostos()
                this.getTipoProdutos()
            }).catch((error) => {
                this.mensagem_erro = error.response.data.detalhes_erro
                this.openModalError()
            });
        },
    }
};
</script>