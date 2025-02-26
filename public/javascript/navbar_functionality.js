document.addEventListener("turbo:load", () => {
  let langMenuButton = document.getElementById("lang-menu-button");
  let langMenuDropdown = document.getElementById("lang-menu-dropdown");

  langMenuButton.addEventListener("click", (e) => {
    e.stopPropagation();
    console.log("Lang menu clicked")

    // langMenuDropdown.classList.toggle('.active-dropdown')
    // langMenuDropdown.style.display = langMenuDropdown.style.display == 'block' ? 'none' : 'block';
  })

  document.addEventListener('click', (e) => {
    if (!langMenuButton.contains(e.target) && !langMenuDropdown.contains(e.target)) {
      langMenuDropdown.classList.remove('active-dropdown')
    }
  })
})
