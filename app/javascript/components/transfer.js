

const initTransfer = () => {
  const clickableRows = document.querySelectorAll('.clickable-row');
  const sendButton = document.querySelector(".send-button");
  const nextButton = document.querySelector(".next-button");
  const buttonSend = document.querySelector(".btn-send");
  const receiverAddress = document.getElementById("transaction_receiving_address_id");
  const amount = document.getElementById("transaction_sending_amount");
  const selectAll = document.querySelector(".select-balance");
  const walletSelect = document.querySelector("#transaction_sending_address_id");

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
    const message = document.querySelector(".not-valid-fb")
    const balanceValue = document.getElementById("balance-value")
    const ticker = balanceValue.dataset.ticker
    const maxValue = balanceValue.dataset.value
    const recipient = document.querySelector(".transfer-details");



    receiverAddress.addEventListener("focusout", (event) => {
      const recipient = document.querySelector(".transfer-details");

        if (parseFloat(amount.value) <= parseFloat(maxValue) && receiverAddress.value.length > 1 ) {
          message.innerHTML = '';
          receiverAddress.classList.remove("is-invalid")
          amount.classList.remove("not-valid")
          nextButton.classList.remove("disabled-link")
        }
        
    });



    selectAll.addEventListener("click", (event) => {
      amount.value = parseFloat(maxValue)
      if (parseFloat(amount.value) <= parseFloat(maxValue) && receiverAddress.value.length > 1 ) {
        message.innerHTML = '';
        receiverAddress.classList.remove("is-invalid")
        amount.classList.remove("not-valid")
        nextButton.classList.remove("disabled-link")
      }

    });



    amount.addEventListener("focusout", (event) => {
      if (parseFloat(amount.value) > parseFloat(maxValue)) {
        console.log(amount.value)
        console.log(maxValue)
        amount.classList.add("not-valid")
        message.insertAdjacentHTML("beforeEnd", `<p>Add an amound lower than your balance</p>`);
      } else {
        amount.classList.remove("not-valid")
      }

      if (receiverAddress.value.length < 1) {
        receiverAddress.classList.add("is-invalid")
        message.insertAdjacentHTML("beforeEnd", `<p>Add a receiver address</p>`);
      } else {
        receiverAddress.classList.remove("is-invalid")
      }

      if (parseFloat(amount.value) <= parseFloat(maxValue) && receiverAddress.value.length > 1 ) {
        message.innerHTML = '';
        receiverAddress.classList.remove("is-invalid")
        amount.classList.remove("not-valid")
        nextButton.classList.remove("disabled-link")
      }
    });

    nextButton.addEventListener("click", (event) => {
      event.preventDefault();
      recipient.insertAdjacentHTML("beforeEnd", `<p>Recipient: ${receiverAddress.value}</p>`);
      recipient.insertAdjacentHTML("beforeEnd", `<p>Amount: ${amount.value} ${ticker}</p>`);
      const secondBlock = document.querySelector(".second-block");
      const transferResults = document.querySelector(".currency-transfer-results");
      secondBlock.classList.add("d-none");
      transferResults.classList.remove("d-none");
    });

  }

  if (buttonSend) {
    buttonSend.addEventListener("click", (event) => {
      const thirdBlock = document.querySelector(".third-block");
      const transactionsCompleted = document.querySelector(".transaction-completed");
      thirdBlock.classList.add("d-none");
      transactionsCompleted.classList.remove("d-none");
    });
  }
}

const initConvertAmount = () => {
  const selectAllButton = document.querySelector('.select-balance');
  const amountUSD = document.querySelector('.amount-usd');
  const assetInstance = document.querySelector('.asset-instance');
  const walletBalance = document.getElementById('current-balance');
  const amountInputField = document.querySelector('#transaction_sending_amount');
  if (selectAllButton) {
    selectAllButton.addEventListener("click", (event) => {
    const asset = JSON.parse(assetInstance.innerHTML);
    const usd = walletBalance.innerHTML * asset.price;
    amountUSD.innerHTML = `${usd}`;
   });
  }
  if (amountInputField) {
    amountInputField.addEventListener("keyup", (event) => {
      const asset = JSON.parse(assetInstance.innerHTML);
      const usd = amountInputField.value * asset.price;
      amountUSD.innerHTML = `${usd}`;
    });
  }
}
















export { initTransfer, initConvertAmount }

