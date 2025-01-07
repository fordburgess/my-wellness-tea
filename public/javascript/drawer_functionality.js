// document.addEventListener("DOMContentLoaded", () => {
//   let hamburgerMenu = document.getElementById("hamburger-menu");
//   let navDrawerContainer = document.getElementById("nav-drawer-container");
//   let navDrawerMenu = document.getElementById("nav-drawer-menu");
//
//   let cartIcon = document.getElementById("cart-icon");
//   let cartDrawerContainer = document.getElementById("cart-drawer-container");
//   let cartDrawerMenu = document.getElementById("cart-drawer-menu");
//
//   let cartProducts = Array.from(document.querySelectorAll(".cart-product"));
//   let cartItemsDelete = document.querySelectorAll(".cart-item-delete");
//   let cartQuantity = document.getElementById("cart-quantity");
//
//   let xIcon = document.getElementById("x-icon");
//   let xIconCart = document.getElementById("x-icon-cart")
//
//   hamburgerMenu.addEventListener('click', () => {
//     navDrawerContainer.style.display = 'block';
//     navDrawerMenu.classList.add('active');
//   })
//
//   xIcon.addEventListener('click', () => {
//     navDrawerMenu.classList.remove('active');
//     navDrawerContainer.style.display = 'none';
//   })
//
//   xIconCart.addEventListener('click', () => {
//     cartDrawerMenu.classList.remove('active');
//     cartDrawerContainer.style.display = 'none';
//   })
//
//   cartIcon.addEventListener('click', () => {
//     cartDrawerContainer.style.display = 'block';
//     cartDrawerMenu.classList.add('active');
//   })
//
//   cartItemsDelete.forEach((cartItemDeleteButton) => {
//     cartItemDeleteButton.addEventListener('click', (e) => {
//       let lineItemId = cartItemDeleteButton.dataset.id;
//       let cartItem = cartProducts.find((cartProduct) => cartProduct.dataset.id == lineItemId);
//
//       cartItem.remove();
//
//       cartQuantity.innerHTML = cartQuantity.innerHTML - 1;
//     })
//   })
// });
