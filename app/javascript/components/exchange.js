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
            <option value="${address.address_sequence}"> Balance: 5</option>
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
            <option value="${address.address_sequence}"> Balance: 5</option>
          `
        })
      }
      else {
        receiveAddress.innerHTML = '<option>No address yet</option>'
      }
    })
  }
};

export { initExchange }
