

const tabToggle = () => {
  const homepage = document.querySelector(".homepage-container");
  if (homepage) {
    console.log("HP!")
    const balanceButton = document.querySelector(".balance-button");
    const priceButton = document.querySelector(".price-button");
    const chartsButton = document.querySelector(".charts-button");

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
};

tabToggle()