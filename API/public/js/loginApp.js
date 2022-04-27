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

    // Try to log in
    let resLogInDB = await fetch("http://localhost:3000/user/login", {
      method: "POST",
      body: JSON.stringify({ email, password }),
      headers: { "Content-Type": "application/json" },
    });
    const resLogIn = await resLogInDB.json();

    // If log in failed
    if (!resLogIn.status) throw resLogIn.error;

    // Save user data in local storage
    const userLocalData = { idUser: resLogIn.idUser, email: resLogIn.email, userType: resLogIn.userType };
    localStorage.setItem('beathopUser', JSON.stringify( userLocalData ));
    
    // Redirect to home
    window.location.href = "/";

  }
  catch (error) {
    console.log("LOGIN ERROR:", error);
    alert(error);
  }
}
