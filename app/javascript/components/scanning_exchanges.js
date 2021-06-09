const test = () => {
  const container = document.querySelector('.container-select-exchange');
  const scanning = document.querySelector('.container-scanning-exchanges');
  scanning.classList.add("d-none");
  container.classList.remove("d-none");
};

const initScanExchanges = () => {
  const container = document.querySelector('.container-exchange');
  const button = document.querySelector('.continue-button');
  const scanning = document.querySelector('.container-scanning-exchanges');
  const sendAsset = document.querySelector('.sending-asset');
  const receiveAsset = document.querySelector('.receiving-asset');
  const assetHash = document.querySelector('.asset-hash');
  const sendAmount = document.querySelector('#transaction_sending_amount');
  const receiveAmount = document.querySelector('#transaction_receiving_amount');
  if (button) {
    button.addEventListener("click", (event) => {
    event.preventDefault();
    const assets = JSON.parse(assetHash.innerHTML);
    const exchangePair = document.querySelector('.exchange-pair');
    const exchangePairHeader = document.querySelector('.exchange-pair-header');
    const finalExchangeAmount1 = document.querySelector('.final-exchange-amount1');
    const finalExchangeAmount2 = document.querySelector('.final-exchange-amount2');
    const finalExchangeAmount3 = document.querySelector('.final-exchange-amount3');
    // const processingAssetInfo = document.querySelector('.processing-asset-info');
    // const assetNameSummary = document.querySelector('.asset-name-summary');
    // const assetSoldSummary = document.querySelector('.asset-sold-summary');
    // const assetReceivedSummary = document.querySelector('.asset-received-summary');
    const exchangeRateShow1 = document.querySelector('.exchange-rate-show1');
    const exchangeRateShow2 = document.querySelector('.exchange-rate-show2');
    const exchangeRateShow3 = document.querySelector('.exchange-rate-show3');
    console.log(sendAmount.value); // Send Amount
    console.log(sendAsset.value); //Asset id
    console.log(assets[sendAsset.value].ticker); //Asset ticker
    console.log((assets[receiveAsset.value].price/assets[sendAsset.value].price).toFixed(3)); // Asset price
    exchangePair.innerHTML = `${assets[receiveAsset.value].ticker}/${assets[sendAsset.value].ticker}`;
    exchangePairHeader.innerHTML = `${assets[receiveAsset.value].ticker}/${assets[sendAsset.value].ticker}`;
    finalExchangeAmount1.innerHTML = `${(sendAmount.value / ((assets[receiveAsset.value].price/assets[sendAsset.value].price) * 1.006)).toFixed(2)} ${assets[receiveAsset.value].ticker}`;
    finalExchangeAmount2.innerHTML = `${(sendAmount.value / ((assets[receiveAsset.value].price/assets[sendAsset.value].price))).toFixed(2)} ${assets[receiveAsset.value].ticker}`;
    finalExchangeAmount3.innerHTML = `${(sendAmount.value / ((assets[receiveAsset.value].price/assets[sendAsset.value].price) * 1.01)).toFixed(2)} ${assets[receiveAsset.value].ticker}`;
    // processingAssetInfo.innerHTML = `${sendAmount.value} ${assets[sendAsset.value].name} for ${receiveAmount.value} ${assets[receiveAsset.value].name} on`;
    // assetNameSummary.innerHTML += `${assets[sendAsset.value].name} for ${assets[receiveAsset.value].name}`;
    // assetSoldSummary.innerHTML += `${sendAmount.value} ${assets[sendAsset.value].ticker}`;
    // assetReceivedSummary.innerHTML += `${receiveAmount.value} ${assets[receiveAsset.value].ticker}`;
    var processInfo = `${sendAmount.value} ${assets[sendAsset.value].name} for ${receiveAmount.value} ${assets[receiveAsset.value].name} on`;
    localStorage.setItem("processInfo", processInfo);
    var rate1 = ((assets[receiveAsset.value].price/assets[sendAsset.value].price) * 1.006).toFixed(3);
    localStorage.setItem("rate1", rate1)
    exchangeRateShow1.innerHTML = rate1
    var rate2 = (assets[receiveAsset.value].price/assets[sendAsset.value].price).toFixed(3);
    localStorage.setItem("rate2", rate2)
    exchangeRateShow2.innerHTML = rate2
    var rate3 = (assets[receiveAsset.value].price/assets[sendAsset.value].price * 1.01).toFixed(3);
    localStorage.setItem("rate3", rate3)
    exchangeRateShow3.innerHTML = rate3

    container.classList.add("d-none");
    scanning.classList.remove("d-none");
    scanning.classList.add("joker");
    window.setTimeout(() => { test(); }, 2000);
  });
}
};

let radius = 100; // adjust to move items in and out

const initMoveIt = () => {
  let fields = $('.item'),
    container = $('#container'),
    width = container.width(),
    height = container.height();
  let angle = 0,
    step = (2 * Math.PI) / fields.length;
  fields.each(function() {
    let x = Math.round(width / 2 + radius * Math.cos(angle) - $(this).width() / 2);
    let y = Math.round(height / 2 + radius * Math.sin(angle) - $(this).height() / 2);
    if (window.console) {
      console.log($(this).text(), x, y);
    }
    $(this).css({
      left: x + 'px',
      top: y + 'px'
    });
    angle += step;
  });
};

const initTimer = () => {
  const container = document.querySelector('.joker');
  if (container) {
    console.log(container);
  }
};



export { initScanExchanges, initMoveIt, initTimer }
