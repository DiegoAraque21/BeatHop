// Check if user is logged in
function checkUserLoggedIn() {
    // Get the local user
    const localUser = JSON.parse(localStorage.getItem('beathopUser'));

    // If there is no user redirect to login
    if (!localUser?.idUser) window.location.href = "/user/login";
}

// Before render the page check if there is a user logged in
checkUserLoggedIn();