const friendsToggle = () => {
  const createContact = document.getElementById("add-contact")

  if (createContact) {
    const friendsList = document.querySelector(".contact-list")
    const friendsForm = document.querySelector(".new-contact")
    createContact.addEventListener( "click", event => {
      friendsList.classList.add("d-none")
      friendsForm.classList.remove("d-none")
    })
  }
}

export { friendsToggle }