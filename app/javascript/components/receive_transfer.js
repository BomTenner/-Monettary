const initReceiveTransfer = () => {
  const receiveButton = document.querySelector(".receive-button");
  const walletReceiveSelect = document.querySelector("#bla");

  if (receiveButton) {
    receiveButton.addEventListener("click", (event) => {
      event.preventDefault();
      const mainBlock = document.querySelector(".main-block");
      const currencyReceive = document.querySelector(".currency-transfer-receive");
      mainBlock.classList.add("d-none");
      currencyReceive.classList.remove("d-none");
    })
  }

  if (walletReceiveSelect) {
    walletReceiveSelect.addEventListener("change", (event) => {
      const addressSequence = document.querySelector(".address-sequence");
      addressSequence.innerHTML = "";
      addressSequence.insertAdjacentHTML("beforeEnd",
        `<div class="address-sequence-details"><p>Address:</p>
        <p class="each-address-sequence">${walletReceiveSelect.value}</p></div>
        <div><a class="btn copy-button">Copy</a></div>`);
    });

    // const copy = () => {
    //   const copyText = document.querySelector(".each-address-sequence");
    //   copyText.select();
    //   document.execCommand("copy");
    // }

    // document.querySelector(".copy-button").addEventListener("click", copy);

  }
}

export { initReceiveTransfer }
