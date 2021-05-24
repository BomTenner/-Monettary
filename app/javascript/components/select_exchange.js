const initClickSelect = () => {
  const button1 = document.querySelector('.select-1');
  const button2 = document.querySelector('.select-2');
  const button3 = document.querySelector('.select-3');
  if (button1) {
    button1.addEventListener("click", (event) => {
      button1.classList.toggle('color-change');
      button2.classList.remove('color-change');
      button3.classList.remove('color-change');
     });
  }
  if (button2) {
    button2.addEventListener("click", (event) => {
      button1.classList.remove('color-change');
      button2.classList.toggle('color-change');
      button3.classList.remove('color-change');
     });
  }
  if (button3) {
    button3.addEventListener("click", (event) => {
      button1.classList.remove('color-change');
      button2.classList.remove('color-change');
      button3.classList.toggle('color-change');
     });
  }
};

const initExecuteExchange = () => {
  const divExchangeButton = document.querySelector('.disable-button');
  const buttonExchange = document.querySelector('.execute-button');
  const button1 = document.querySelector('.select-1');
  const button2 = document.querySelector('.select-2');
  const button3 = document.querySelector('.select-3');
  window.addEventListener("click", (event) => {
   if (button1.classList.contains('color-change') || button2.classList.contains('color-change') || button3.classList.contains('color-change')) {
     divExchangeButton.classList.remove('disable-button');
     buttonExchange.classList.remove('pointer-none');
   } else {
     divExchangeButton.classList.add('disable-button');
     buttonExchange.classList.add('pointer-none');
    }
  });
};

const confirmation = () => {
  const processingPage = document.querySelector('.container-exchange-processing');
  const lastPage = document.querySelector('.container-exchange-confirmation');
  processingPage.classList.add('d-none');
  lastPage.classList.remove('d-none');
};

const initMoveNext = () => {
  const button = document.querySelector('.execute-button');
  const nextPage = document.querySelector('.container-exchange-processing');
  const thisPage = document.querySelector('.container-select-exchange');
  if (button) {
    button.addEventListener("click", (event) => {
      thisPage.classList.add('d-none');
      nextPage.classList.remove('d-none');
      window.setTimeout(() => { confirmation(); }, 7000);
    });
  }
};

export { initClickSelect, initExecuteExchange, initMoveNext }
