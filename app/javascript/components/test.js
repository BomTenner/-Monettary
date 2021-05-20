const initTest = () => {
  const sendAmount = document.getElementById('sending_amount');
  const button = document.querySelector('.continue-button');
  const asset = document.querySelector('.sending-asset');
  const insert = document.querySelector('.testing');
  const selectAddress = document.querySelector('#transaction_sending_address');
  const selectAsset = document.querySelector('#transaction_assets');
  if (selectAsset) {
    selectAsset.addEventListener("change", (event) => {
      const addresses = JSON.parse(selectAddress.dataset.addresses);
      const selectedValue = event.target.value;
      const selectedAddresses = addresses[selectedValue]
      selectAddress.innerHTML = "";

      if (selectedAddresses) {
        selectedAddresses.forEach(address => {
          selectAddress.innerHTML += `
            <option value="${address.address_sequence}"> Balance: 5</option>
          `
        })
      } else {
        selectAddress.innerHTML = '<option>No address yet</option>'
      }
    })
  }


  if (button) {
    button.addEventListener("click", (event) => {

    });
  }
};

export { initTest }
