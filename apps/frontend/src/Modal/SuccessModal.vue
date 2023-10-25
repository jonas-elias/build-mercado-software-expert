<template>
    <input type="checkbox" id="modal_success" class="modal-toggle" />
    <div class="modal">
        <div class="modal-box">
            <h3 class="font-bold text-lg">Mensagem</h3>
            <h4>Operação realizada com sucesso.</h4>
            <div class="modal-action">
                <label for="modal_success" class="btn">Fechar</label>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'SuccessModal',
};
</script>
  
<style scoped>
</style>