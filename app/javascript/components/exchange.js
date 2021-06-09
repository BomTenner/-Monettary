const initExchange = () => {
  const sendAddress = document.querySelector('#transaction_sending_address_id');
  const sendAsset = document.querySelector('.sending-asset');
  const receiveAsset = document.querySelector('.receiving-asset');
  const receiveAddress = document.querySelector('#transaction_receiving_address_id');
  if (sendAsset) {
    sendAsset.addEventListener("change", (event) => {
      const addresses = JSON.parse(sendAddress.dataset.addresses);
      const selectedValue = event.target.value;
      const selectedAddresses = addresses[selectedValue]
      sendAddress.innerHTML = "";

      if (selectedAddresses) {
        selectedAddresses.forEach(address => {
          sendAddress.innerHTML += `
            <option value="${address.address_sequence}"> Balance: ${address.balance}</option>
          `
        })
      } else {
        sendAddress.innerHTML = '<option>No address yet</option>'
      }
    })
  }
  if (receiveAsset) {
    receiveAsset.addEventListener("change", (event) => {
      const addresses = JSON.parse(receiveAddress.dataset.addresses);
      const selectedValue = event.target.value;
      const selectedAddresses = addresses[selectedValue]
      receiveAddress.innerHTML = "";

      if (selectedAddresses) {
        selectedAddresses.forEach(address => {
          receiveAddress.innerHTML += `
            <option value="${address.address_sequence}"> Balance: ${address.balance}</option>
          `
        })
      }
      else {
        receiveAddress.innerHTML = '<option>No address yet</option>'
      }
    })
  }
};

const calculateAmount = () => {
  const sendAsset = document.querySelector('.sending-asset');
  const receiveAsset = document.querySelector('.receiving-asset');
  const sendAmount = document.querySelector('#transaction_sending_amount');
  const receiveAmount = document.querySelector('#transaction_receiving_amount');
  const assetHash = document.querySelector('.asset-hash');
  if (assetHash) {
    const assets = JSON.parse(assetHash.innerHTML);
    receiveAmount.value = (sendAmount.value / ((assets[receiveAsset.value].price/assets[sendAsset.value].price))).toFixed(2);
  }
}

const initAmountExchange = () => {
  const sendAmount = document.querySelector('#transaction_sending_amount');
  const receiveAmount = document.querySelector('#transaction_receiving_amount');
  if (sendAmount) {
    sendAmount.addEventListener("keyup", (event) => {
      window.setTimeout(() => { calculateAmount(); }, 6000);
    });
  }
};


export { initExchange, initAmountExchange }
