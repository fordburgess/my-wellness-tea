document.addEventListener("turbo:load", () => {
  let hamburgerMenu = document.getElementById("hamburger-menu");
  let navDrawerContainer = document.getElementById("nav-drawer-container");
  let navDrawerMenu = document.getElementById("nav-drawer-menu");

  let cartIcon = document.getElementById("cart-icon");
  let cartDrawerContainer = document.getElementById("cart-drawer-container");
  let cartDrawerMenu = document.getElementById("cart-drawer-menu");

  let xIcon = document.getElementById("x-icon");
  let xIconCart = document.getElementById("x-icon-cart")

  hamburgerMenu.addEventListener('click', () => {
    navDrawerContainer.style.display = 'block';
    navDrawerMenu.classList.add('active');
  })

  xIcon.addEventListener('click', () => {
    navDrawerMenu.classList.remove('active');
    navDrawerContainer.style.display = 'none';
  })

  xIconCart.addEventListener('click', () => {
    cartDrawerMenu.classList.remove('active');
    cartDrawerContainer.style.display = 'none';
  })

  cartIcon.addEventListener('click', () => {
    console.log("cart icon clicked")
    cartDrawerContainer.style.display = 'block';
    cartDrawerMenu.classList.add('active');
  })






  let langMenuButton = document.getElementById("lang-menu-button");
  let langMenuDropdown = document.getElementById("lang-menu-dropdown");

  langMenuButton.addEventListener("click", (e) => {
    e.stopPropagation();
    console.log("Lang menu clicked")

    langMenuDropdown.classList.toggle('active-dropdown')
    // langMenuDropdown.style.display = langMenuDropdown.style.display == 'block' ? 'none' : 'block';
  })

  document.addEventListener('click', (e) => {
    if (!langMenuButton.contains(e.target) && !langMenuDropdown.contains(e.target)) {
      langMenuDropdown.classList.remove('active-dropdown')
    }
  })
});
