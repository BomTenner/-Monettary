
const tabToggle = () => {
  const homepage = document.querySelector(".homepage-container");
  const balanceButton = document.querySelector(".balance-button");
  const priceButton = document.querySelector(".price-button");
  const chartsButton = document.querySelector(".charts-button");
  const tabs = document.querySelectorAll(".page-link");

  if (homepage && balanceButton && priceButton && chartsButton) {
    console.log("HP!")


    const balance = document.querySelector(".balance-container");
    const price = document.querySelector(".price-container");
    const charts = document.querySelector(".charts");

    balanceButton.addEventListener("click", (event) => {
      event.preventDefault();
      price.classList.add("d-none");
      charts.classList.add("d-none");
      balance.classList.remove("d-none");
    });


    priceButton.addEventListener("click", (event) => {
      event.preventDefault();
      price.classList.remove("d-none");
      balance.classList.add("d-none");
      charts.classList.add("d-none");
    });

    chartsButton.addEventListener("click", (event) => {
      event.preventDefault();
      price.classList.add("d-none");
      balance.classList.add("d-none");
      charts.classList.remove("d-none");
    });
  } else {
    console.log("other")
  }

  if (tabs) {
    tabs.forEach(tab => {
      tab.addEventListener("click", (event) => {
        tabs.forEach(tab => tab.classList.remove('active'));
        event.target.classList.add('active');
      });
    });
  }
}


export { tabToggle }
