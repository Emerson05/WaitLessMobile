const entrar = document.querySelector('.btn')
const email = document.getElementById('email')
const senha = document.getElementById('password')
const resultado = document.querySelector('.resultado')

entrar.addEventListener('click', (e) => {
  e.preventDefault();

  if (!senha.value || senha.value === 0) {
    const p = document.createElement('p');
    p.textContent = 'Senha inválida';
    resultado.appendChild(p);

    setTimeout(()=>{
      window.location.href = "FazerLogin.html";
    },3000)
    return  
  }

  if (isNaN(email.value)) {
    window.location.href = "clienteloja.html";
    
  }else{
    window.location.href = "principalemp.html";
  }
});




