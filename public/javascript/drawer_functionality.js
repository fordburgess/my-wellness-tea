document.addEventListener("DOMContentLoaded", () => {
  let hamburgerMenu = document.getElementById("hamburger-menu");
  let drawerContainer = document.getElementById("drawer-container");
  let drawerMenu = document.getElementById("drawer-menu");
  let xIcon = document.getElementById("x-icon");

  hamburgerMenu.addEventListener('click', () => {
    drawerContainer.style.display = 'block';
    drawerMenu.classList.add('active');
  })

  xIcon.addEventListener('click', () => {
    drawerMenu.classList.remove('active');
    drawerContainer.style.display = 'none';
  })
});
