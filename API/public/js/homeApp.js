// Check if user is logged in
function checkUserLoggedIn() {
    saveUser();
    // Get the local user
    const localUser = JSON.parse(localStorage.getItem('beathopUser'));
    // If there is no user redirect to login
    if (!localUser?.id) window.location.href = "/user/login";
}


function saveUser() {
    const data = {id: 1, email: "abc@gmail.com"}
    localStorage.setItem('beathopUser', JSON.stringify(data));
}

function deleteUser() {
    localStorage.removeItem('beathopUser');
}


// Before render the page check if there is a user logged in
checkUserLoggedIn();