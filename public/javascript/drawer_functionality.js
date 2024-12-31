document.addEventListener("DOMContentLoaded", () => {
  let hamburgerMenu = document.getElementById("hamburger-menu");
  let drawerContainer = document.getElementById("drawer-container");
  let drawerMenu = document.getElementById("drawer-menu");

  hamburgerMenu.addEventListener('click', () => {
    drawerContainer.style.display = 'block';
    drawerMenu.classList.add('active');
  })
});
