document.addEventListener("turbo:load", () => {
  let categorySelect = document.getElementById("category-select");
  let products = document.querySelectorAll(".product-container");

  const params = new URLSearchParams(window.location.search);
  const initialCategory = params.get('category');
  if (initialCategory) {
    categorySelect.value = initialCategory;
    products.forEach((product) => {
      if (product.dataset.category == initialCategory) {
        product.style.display = 'block';
      }
      else {
        product.style.display = 'none';
      }
    })
  }

  categorySelect.addEventListener("change", (e) => {
    console.log("Hello")
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
