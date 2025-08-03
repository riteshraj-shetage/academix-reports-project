// Main JavaScript file for Academix

document.addEventListener("DOMContentLoaded", () => {
  // Login form validation
  const loginForm = document.querySelector(".login-form")

  if (loginForm) {
    loginForm.addEventListener("submit", (e) => {
      const username = document.getElementById("username").value.trim()
      const password = document.getElementById("password").value.trim()
      const role = document.getElementById("role").value

      if (!username || !password || !role) {
        e.preventDefault()
        window.alert("Please fill in all fields")
        return false
      }

      // Additional validation can be added here
    })
  }

  // Add smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault()

      const targetId = this.getAttribute("href")
      if (targetId === "#") return

      const targetElement = document.querySelector(targetId)
      if (targetElement) {
        targetElement.scrollIntoView({
          behavior: "smooth",
        })
      }
    })
  })
})

// Function to show alerts for unauthorized access
function showUnauthorizedAlert() {
  window.alert("Unauthorized access. Please login to continue.")
  window.location.href = "login.jsp"
}

// Function to confirm actions
function confirmAction(message) {
  return window.confirm(message)
}

// Function to prompt for input
function promptInput(message, defaultValue = "") {
  return window.prompt(message, defaultValue)
}
