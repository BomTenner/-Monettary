

const initTransfer = () => {
  const clickableRows = document.querySelectorAll('.clickable-row');
  const sendButton = document.querySelector(".send-button");
  const nextButton = document.querySelector(".next-button");
  const buttonSend = document.querySelector(".btn-send");
  const selectBalance = document.querySelector('.select-balance');

  // Linking table rows from the currencies list at "transactions index page" to the "transactions new page"
  if (clickableRows) {
    clickableRows.forEach(row => {
      row.addEventListener('click', event => {
        window.location = event.currentTarget.dataset.url;
      });
    });
  }

  // Jump from main frame of transfer page to a frame where a new transfer process starts
  if (sendButton) {
    sendButton.addEventListener("click", (event) => {
      event.preventDefault();
      const mainBlock = document.querySelector(".main-block");
      const transferNew = document.querySelector(".currency-transfer-new");
      mainBlock.classList.add("d-none");
      transferNew.classList.remove("d-none");
    });
  }

   if (nextButton) {
    nextButton.addEventListener("click", (event) => {
      event.preventDefault();
      const secondBlock = document.querySelector(".second-block");
      const transferResults = document.querySelector(".currency-transfer-results");
      secondBlock.classList.add("d-none");
      transferResults.classList.remove("d-none");
    });
  }

  if (buttonSend) {
    buttonSend.addEventListener("click", (event) => {
      event.preventDefault();
      const thirdBlock = document.querySelector(".third-block");
      const transactionsCompleted = document.querySelector(".transaction-completed");
      thirdBlock.classList.add("d-none");
      transactionsCompleted.classList.remove("d-none");
    });
  }




  if (selectBalance) {
    selectBalance.addEventListener("click", (event) => {

    });
  }
}

export { initTransfer }

