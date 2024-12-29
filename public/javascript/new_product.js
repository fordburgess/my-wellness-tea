document.addEventListener("DOMContentLoaded", () => {
  let currentStep = 0;

  let nextButton = document.getElementById("form-next-toggle");
  let backButton = document.getElementById("form-back-toggle");

  let preliminaryInfo = document.getElementById("preliminary-info");
  let secondaryInfo = document.getElementById("secondary-info");

  const updateDisplay = () => {
    if (currentStep === 0) {
      secondaryInfo.style.display = 'none';
      preliminaryInfo.style.display = 'block';
    }
    else {
      secondaryInfo.style.display = 'block';
      preliminaryInfo.style.display = 'none';
    }
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
