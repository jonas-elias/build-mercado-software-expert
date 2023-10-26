<template>
    <input type="checkbox" id="modal_error" class="modal-toggle" />
    <div class="modal">
        <div class="modal-box">
            <h3 class="font-bold text-lg mb-4">Mensagem de erro</h3>
            <div v-for="(mensagens, campo) in this.getMensagemErro()" :key="campo">
                <ul>
                    <li v-for="(mensagem, index) in mensagens" :key="index">
                        <div class="mt-1">
                            {{ mensagem }}
                        </div>
                    </li>
                </ul>
            </div>
            <div class="modal-action">
                <label for="modal_error" class="btn">Fechar</label>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
export default {
    props: {
        errorMessage: Array,
    },
    name: 'ErrorModal',
    methods: {
        getMensagemErro() {
            if (this.errorMessage) {
                return this.errorMessage;
            }
            return [
                {
                    mensagem: 'Ocorreu um erro ao realizar a operação. Tente novamente mais tarde!'
                }
            ]
        }
    }
};
</script>
  
<style scoped></style>
