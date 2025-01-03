document.addEventListener("DOMContentLoaded", () => {
  let categorySelect = document.getElementById("category-select");
  let products = document.querySelectorAll(".product-container");

  categorySelect.addEventListener("change", (e) => {
    let category = e.currentTarget.value;
    products.forEach((product) => {
      if (product.dataset.category == category) {
        product.style.display = 'block';
      }
      else {
        product.style.display = 'none';
      }
    })
  })
})
