

const initTransfer = () => {
  const clickableRows = document.querySelectorAll('.clickable-row');
  const sendButton = document.querySelector(".send-button");
  const nextButton = document.querySelector(".next-button");
  const buttonSend = document.querySelector(".btn-send");
  const receiverAddress = document.getElementById("transaction_receiving_address_id");
  const senderAddress = document.getElementById("transaction_sending_address_id");
  const amount = document.getElementById("transaction_sending_amount");
  const selectAll = document.querySelector(".select-balance");
  const walletSelect = document.querySelector("#transaction_sending_address_id");
  const currentBalance = document.querySelector("#current-balance");
  const feeOptions = document.querySelectorAll(".fee-options");
  const btnSendTransfer = document.querySelector(".btn-send-transfer");



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
    let maxValue = balanceValue.dataset.value
    const recipient = document.querySelector(".transfer-details");

    selectAll.addEventListener("click", (event) => {
      maxValue = balanceValue.dataset.value
      amount.value = parseFloat(maxValue)
      if (parseFloat(amount.value) <= parseFloat(maxValue) && receiverAddress.value.length > 1 ) {
        message.innerHTML = '';
        receiverAddress.classList.remove("is-invalid")
        amount.classList.remove("not-valid")
        nextButton.classList.remove("disabled-link")
      }

    });



    nextButton.addEventListener("click", (event) => {
      event.preventDefault();
      message.innerHTML = '';
      var errorMessages = ""

      if (amount.value.length < 1) {
        amount.classList.add("not-valid")
        var currentMessage = `<p>Add an amound</p>`
        if (!errorMessages.includes(currentMessage) ) {
          errorMessages += currentMessage
        }
      } else {
        amount.classList.remove("not-valid")
      }

      if (parseFloat(amount.value) > parseFloat(maxValue)) {
        console.log(amount.value)
        console.log(maxValue)
        amount.classList.add("not-valid")
        var currentMessage = `<p>Add an amound lower than your balance</p>`
        if (!errorMessages.includes(currentMessage) ) {
          errorMessages += currentMessage
        }
      } else {
        amount.classList.remove("not-valid")
      }

      if (receiverAddress.value.length < 1) {
        receiverAddress.classList.add("is-invalid")
        var currentMessage = `<p>Add a receiver address</p>`
        if (!errorMessages.includes(currentMessage) ) {
          errorMessages += currentMessage
        } 
      } else {
        receiverAddress.classList.remove("is-invalid")
      }

      if (senderAddress.value.length < 1) {
        senderAddress.classList.add("is-invalid")
        var currentMessage = `<p>Select a wallet</p>`
        if (!errorMessages.includes(currentMessage) ) {
          errorMessages += currentMessage
        } 
      } else {
        senderAddress.classList.remove("is-invalid")
      }

      if (errorMessages.length > 0  ) {
        message.insertAdjacentHTML("beforeEnd", errorMessages);
      } else {
        message.innerHTML = '';
        receiverAddress.classList.remove("is-invalid")
        senderAddress.classList.remove("is-invalid")
        amount.classList.remove("not-valid")
        nextButton.classList.remove("disabled-link")

        recipient.insertAdjacentHTML("beforeEnd", `<p>Recipient: ${receiverAddress.value}</p>`);
        recipient.insertAdjacentHTML("beforeEnd", `<p>Amount: ${amount.value} ${ticker}</p>`);
        const secondBlock = document.querySelector(".second-block");
        const transferResults = document.querySelector(".currency-transfer-results");
        secondBlock.classList.add("d-none");
        transferResults.classList.remove("d-none");
      }

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

  if (walletSelect) {
    walletSelect.addEventListener("change", (event) => {
      const allBalances = JSON.parse(document.querySelector(".balance-hash").innerHTML)
      var myBalance = allBalances[walletSelect.value]
      currentBalance.innerText = myBalance;
      console.log(myBalance)
      currentBalance.parentElement.dataset.value = myBalance
    })
  }

  if (feeOptions) {
    feeOptions.forEach(option => {
      // console.log(option);
      option.addEventListener("click", (event) => {
        feeOptions.forEach(option => {
          option.classList.remove("selected")
        });
        option.classList.add("selected");
      });
    });
  }
}

const initConvertAmount = () => {
  const selectAllButton = document.querySelector('.select-balance');
  const amountUSD = document.querySelector('.amount-usd');
  const assetInstance = document.querySelector('.asset-instance');
  const walletBalance = document.getElementById('current-balance');

  if (selectAllButton) {
    selectAllButton.addEventListener("click", (event) => {
    const asset = JSON.parse(assetInstance.innerHTML);
    const usd = walletBalance.innerHTML * asset.price;
    amountUSD.innerHTML = `${usd}`;
   });
  }
  if (amountUSD) {
    const amountInputField = document.querySelector('#transaction_sending_amount');
    amountInputField.addEventListener("keyup", (event) => {
      const asset = JSON.parse(assetInstance.innerHTML);
      const usd = amountInputField.value * asset.price;
      amountUSD.innerHTML = `${usd}`;
    });
  }
}



export { initTransfer, initConvertAmount }

