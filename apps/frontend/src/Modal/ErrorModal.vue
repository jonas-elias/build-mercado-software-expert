<template>
    <input type="checkbox" id="modal_error" class="modal-toggle" />
    <div class="modal">
        <div class="modal-box">
            <h3 class="font-bold text-lg">Mensagem</h3>
            <h4>Erro na operação. Verifique e tente novamente.</h4>
            <div class="modal-action">
                <label for="modal_error" class="btn">Fechar</label>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'ErrorModal',
};
</script>
  
<style scoped>
</style>