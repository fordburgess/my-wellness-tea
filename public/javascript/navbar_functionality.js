document.addEventListener("turbo:load", () => {
  let langMenuButton = document.getElementById("lang-menu-button");
  let langMenuDropdown = document.getElementById("lang-menu-dropdown");

  langMenuButton.addEventListener("click", (e) => {
    e.stopPropagation();
    langMenuDropdown.style.display = langMenuDropdown.style.display == 'block' ? 'none' : 'block';
  })

  document.addEventListener('click', (e) => {
    if (!langMenuButton.contains(e.target) && !langMenuDropdown.contains(e.target)) {
      langMenuDropdown.style.display = 'none';
    }
  })
})
