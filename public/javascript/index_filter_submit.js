document.addEventListener("DOMContentLoaded", () => {
  let filterForm = document.getElementById("filter-section");
  let categorySelect = document.getElementById("category-select");

  categorySelect.addEventListener("change", (e) => {
    e.preventDefault();
    filterForm.submit();
  })

})
