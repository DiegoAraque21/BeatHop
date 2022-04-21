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
        if (!email.trim() || !email) throw "Please enter a valid email."
        if (!password.trim() || !password) throw "Please enter a valid password."

        // Send request
        console.log("LOGIN", email, password);
    }
    catch (error) {
        console.log("LOGIN ERROR:", error);
        alert(error);
    }
}