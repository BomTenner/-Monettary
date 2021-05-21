
// Linking table rows from the currencies list at the "transactions index page" to the "transactions new page"

$("tr").click(function() {
  window.location = $(this).data("link")
})
