import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'list' ];

  connect() {
    console.log(this.listTarget);
  }

  refresh() {
    setTimeout( () => {
      fetch('/contacts', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        var newContact = data.contacts.pop()

        console.log(newContact)
        const option = document.createElement("option");
        option.innerHTML = newContact.name;
        option.value = newContact.id
        this.listTarget.prepend(option);
        this.listTarget.value = newContact.id
      });
    }, 1000)
  }
}