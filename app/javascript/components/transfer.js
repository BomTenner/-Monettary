
// Linking table rows from the currencies list at "transactions index page" to the "transactions new page"

const initTransfer = () => {
  const clickableRows = document.querySelectorAll('.clickable-row');

  if (clickableRows) {
    clickableRows.forEach(row => {
      row.addEventListener('click', event => {
        window.location = event.currentTarget.dataset.url;
      });
    });
  }
}

export { initTransfer }

