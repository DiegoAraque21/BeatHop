// Go to create Account
function goToCreateAccount() {
  window.location.href = "/user/create_account";
}

// Log In
async function logIn() {
  try {
    // Get values
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    // Validate values
    if (!email.trim() || !email) throw "Please enter a valid email.";
    if (!password.trim() || !password) throw "Please enter a valid password.";

    // Create form
    let resLogInDB = await fetch("http://localhost:3000/user/login", {
      method: "POST",
      body: JSON.stringify({ email, password }),
      headers: { "Content-Type": "application/json" },
    });
    const resLogIn = await resLogInDB.json();
    // Send request
    if (!resLogIn.status) {
      alert(resLogIn.error);
    } else {
      alert(resLogIn.message);
      window.location.href = "/";
    }
  } catch (error) {
    console.log("LOGIN ERROR:", error);
    alert(error);
  }
}
