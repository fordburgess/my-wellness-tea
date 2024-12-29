document.addEventListener("DOMContentLoaded", () => {
  let currentStep = 0;

  let nextButton = document.getElementById("form-next-toggle");
  let backButton = document.getElementById("form-back-toggle");

  let preliminarySection = document.getElementById("0");
  let detailsSection = document.getElementById("1");
  let finalSection = document.getElementById("2");

  let sections = [preliminarySection, detailsSection, finalSection]

  const updateDisplay = () => {
    sections.forEach((section, index) => {
      if (index == currentStep) {
        section.style.display = 'block';
      }
      else {
        section.style.display = 'none';
      }
    })
  }

  nextButton.addEventListener('click', (e) => {
    e.preventDefault();
    if (currentStep < 2) {
      currentStep++;
      updateDisplay();
    }
  })

  backButton.addEventListener('click', (e) => {
    e.preventDefault();
    if (currentStep > 0) {
      currentStep--;
      updateDisplay();
    }
  })

  updateDisplay();
})
