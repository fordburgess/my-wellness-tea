document.addEventListener("turbo:load", () => {
  let langMenuButton = document.getElementById("lang-menu-button");
  let langMenuDropdown = document.getElementById("lang-menu-dropdown");
  let langMenuButtonMobile = document.getElementById("lang-menu-button-mobile");
  let langMenuDropdownMobile = document.getElementById("lang-menu-dropdown-mobile");

  langMenuButton.addEventListener("click", (e) => {
    e.stopPropagation();
    langMenuDropdown.style.display = langMenuDropdown.style.display == 'block' ? 'none' : 'block';
  })

  langMenuButtonMobile.addEventListener("click", (e) => {
    e.stopPropagation();
    langMenuDropdownMobile.style.display = langMenuDropdownMobile.style.display == 'block' ? 'none' : 'block';
    console.log(langMenuDropdownMobile.style)
  })

  document.addEventListener('click', (e) => {
    if (!langMenuButton.contains(e.target) && !langMenuDropdown.contains(e.target)) {
      langMenuDropdown.style.display = 'none';
    }
  })

  document.addEventListener('click', (e) => {
    if (!langMenuButtonMobile.contains(e.target) && !langMenuDropdownMobile.contains(e.target)) {
      langMenuDropdownMobile.style.display = 'none';
    }
  })
})
