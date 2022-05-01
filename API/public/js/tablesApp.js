// --- BEFORE RENDERING ---

// Check if user is logged in and user is manager
function checkUserLoggedIn() {
    // Get the local user
    const localUser = JSON.parse(localStorage.getItem('beathopUser'));

    // If there is no user redirect to login
    if (!localUser?.idUser) window.location.href = "/user/login";

    // If user isn´t manager PAS redirect to home
    if (localUser?.userType !== "PAS Admin") window.location.href = "/";
}

// Before render the page check if there is a user logged in
checkUserLoggedIn();


// --- AFTER RENDERING ---

// Close session
function closeSession() {
    // Remove user from local storage and redirect to login
    localStorage.removeItem('beathopUser');
    window.location.href = "/user/login";
}

// Render graphs navbar link
function renderAdminLinks() {
    const graphBtn = document.getElementById("graphs_link");
    const tablesBtn = document.getElementById("tables_link");
    const localUser = JSON.parse(localStorage.getItem('beathopUser'));

    // If user is not admin
    if (localUser?.userType !== "PAS Admin") {
        // Hide buttons
        graphBtn.style.display = "none";
        tablesBtn.style.display = "none";
    }
}

async function buildPlayersAnswersTables() {
    try {
        // Send request
        let resTableDB = await fetch("http://localhost:3000/graphs/players_answers");
        let resTable = await resTableDB.json();

        // If request fails
        if (resTable.error) throw resTable.error;

        // Build table
        const tableBody = document.querySelector("#table_body");
        resTable.results.forEach(row => {
            tableBody.innerHTML += `
                <tr>
                    <td>${row.name}</td>
                    <td>${row.lastName}</td>
                    <td>${row.age}</td>
                    <td>${row.answer1}</td>
                    <td>${row.answer2}</td>
                    <td>${row.answer3}</td>
                </tr>
            `;
        });

    }
    catch (error) {
        console.log("BUILD TABLES ERROR:", error);
        alert("There was an error creating the tables.");
    }
}

// When elements are loaded
window.addEventListener('DOMContentLoaded', () => {
    renderAdminLinks();
    buildPlayersAnswersTables();
});