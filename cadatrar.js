const btn = document.querySelector('#salvar')

btn.addEventListener('click', () => {
    const empresa = getDadosForms()
    enviarDadosParaApi(empresa);

} )

function getDadosForms(){
    const inputEmail = document.querySelector('#email')
    const inputCnpj = document.querySelector('#cnpj')
    if(inputNome.value === null || inputSobrenome.value === null || inputEmail.value === null || inputSenha.value === null) {
        console.log('campos vazios')
        retutn 
    }
    const cadastro = {
        nome: inputNome.value,
        sobrenome: inputSobrenome.value,
        email: inputEmail.value,
        senha: inputSenha.value,
    }
    return cadastro;
}

async function enviarDadosParaApi (cadastro) {
    const reposta = await fetch('http://localhost:300/criaconta', {
        method: 'POST',
        headers: {
            Accept: 'application/json'
        },
        body: JSON.stringify(cadastro)
    })
    if(resposta.status === 201) {
        limparCampos()
        window.location.href = 'FazerLogin.html'
    }else{
        console.log('Erro ao adicionar empresa')
    }
}

function limparCampos() {
    document.querySelector('#email').value = ''
    document.querySelector('#cnpj').value = ''
}