document.addEventListener("turbo:load", () => {
  let langMenuButton = document.getElementById("lang-menu-button");
  let langMenuDropdown = document.querySelector(".lang-menu-dropdown");

  console.log(langMenuDropdown)
  langMenuButton.addEventListener("click", (e) => {
    e.stopPropagation();
    langMenuDropdown.classList.toggle('active-dropdown')
    // langMenuDropdown.style.display = langMenuDropdown.style.display == 'block' ? 'none' : 'block';
  })

  document.addEventListener('click', (e) => {
    if (!langMenuButton.contains(e.target) && !langMenuDropdown.contains(e.target)) {
      langMenuDropdown.classList.remove('active-dropdown')
    }
  })
})
