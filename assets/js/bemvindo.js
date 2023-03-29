const selectedClass = 'selected';
const btnContinuar = document.getElementById('continuar');



document.addEventListener('click', (event) => {
  const cliente = document.querySelector('.cliente');
  const clientetex = document.getElementById('text-cliente');
  const imgcliente = document.getElementById('img-cliente');
  const empresa = document.querySelector('.empresa');
  const empresatext = document.getElementById('text-empresa');
  const imgempresa = document.getElementById('img-emp');

  if (event.target === cliente || event.target === clientetex || event.target === imgcliente) {
    empresa.classList.remove(selectedClass);
    cliente.classList.add(selectedClass);
  } else if (event.target === empresa || event.target === empresatext || event.target === imgempresa) {
    cliente.classList.remove(selectedClass);
    empresa.classList.add(selectedClass);
  }
});

btnContinuar.addEventListener('click', () => {
  const cliente = document.querySelector('.cliente');
  const empresa = document.querySelector('.empresa');

  if (cliente.classList.contains(selectedClass)) {
    window.location.href = "cliente2.html";
  }else if(empresa.classList.contains(selectedClass)){
    window.location.href = "empresa2.html";
  }
});



