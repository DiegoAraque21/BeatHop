// Go to log in
function goToLogIn() {
    window.location.href = "/user/login";
}

// Create Account
async function createAccount() {
    try {
        // Get values
        const name = document.getElementById("name").value;
        const lastName = document.getElementById("lastName").value;
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;
        const userType = document.getElementById("userType").value;
        const gender = document.getElementById("gender").value;
        const age = document.getElementById("age").value;
        const answer1 = document.getElementById("answer1").value;
        const answer2 = document.getElementById("answer2").value;
        const answer3 = document.getElementById("answer3").value;

        // Validate values
        if (!name.trim() || !name) throw "Please enter a valid name."
        if (!lastName.trim() || !lastName) throw "Please enter a valid last name."
        if (!email.trim() || !email) throw "Please enter a valid email."
        if (!password.trim() || !password) throw "Please enter a valid password."
        if (!userType.trim() || !userType) throw "Please enter a valid type."
        if (!gender.trim() || !gender) throw "Please enter a valid gender."
        if (!age.trim() || !age) throw "Please enter a valid age."
        if (!answer1.trim() || !answer1) throw "Please enter a valid answer for question 1."
        if (!answer2.trim() || !answer2) throw "Please enter a valid answer for question 2."
        if (!answer3.trim() || !answer3) throw "Please enter a valid answer for question 3."

        // Create form
        let resFormDB = await fetch('http://localhost:3000/user/form', {
            method: 'POST',
            body: JSON.stringify({ answer1, answer2, answer3 }),
            headers: { 'Content-Type': 'application/json' }
        });
        const resForm = await resFormDB.json();

        // Check if there was an error
        if (resForm.error) throw resForm.error;

        // Create user
        const resUserDB = await fetch('http://localhost:3000/user/create_account', {
            method: 'POST',
            body: JSON.stringify({
                name,
                lastName,
                email,
                password,
                userType,
                age,
                gender,
                idForm: resForm.formId
             }),
            headers: { 'Content-Type': 'application/json' }
        });
        const resUser = await resUserDB.json();

        // Check if there was an error
        if (resUser.error) throw resUser.error;

        // Save user data in local storage
        const userLocalData = { idUser: resUser.idUser, email, userType };
        localStorage.setItem('beathopUser', JSON.stringify( userLocalData ));

        // Redirect to home
        window.location.href = "/";

    }

    // Manage error
    catch (error) {
        console.log("CREATE ACCOUNT ERROR:", error);
        alert(error);
    }
}