$(document).ready(function ($) {
  $(".option-link").click(function (e) {
    e.preventDefault(); // Prevent the link from navigating

    var selectedOption = $(this).data("option"); // Get the data-option attribute
    var accessoriesField = $("#order_item_form #order_item_accessories"); // Replace 'your-form-id' with your actual form ID

    // Append the selected option to the accessories field
    accessoriesField.val(selectedOption + ". " + accessoriesField.val());
  });
});
