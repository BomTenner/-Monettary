const labelActive = () => {
  const labels = document.querySelectorAll(".card-action");

  if (labels) {
    labels.forEach(label => {
      label.addEventListener("click", (event) => {
        console.log(label)
        labels.forEach(label => label.classList.remove('active'));
        event.target.classList.add('active');
      });
    });
  }
}

export { labelActive }
