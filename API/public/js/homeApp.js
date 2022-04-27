// Check if user is logged in
function checkUserLoggedIn() {
    // Get the local user
    const localUser = JSON.parse(localStorage.getItem('beathopUser'));

    // If there is no user redirect to login
    if (!localUser?.idUser) window.location.href = "/user/login";
}

// Before render the page check if there is a user logged in
checkUserLoggedIn();

// Close session
function closeSession() {
    // Remove user from local storage and redirect to login
    localStorage.removeItem('beathopUser');
    window.location.href = "/user/login";
}

// Render graphs navbar link
function renderGraphLink() {
    const graphBtn = document.getElementById("graphs_link");
    const localUser = JSON.parse(localStorage.getItem('beathopUser'));

    // If user is not admin
    if (localUser?.userType !== "PAS Admin") {
        // Hide button
        graphBtn.style.display = "none";
    }
}

//Send userID to game Build



// When elements are loaded
window.addEventListener('DOMContentLoaded', () => {
    renderGraphLink();
});