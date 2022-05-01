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

// Build top tables
async function buildTopTables() {
  try {
    // Send request for highest
    let resHighestDB = await fetch("http://localhost:3000/graphs/highest_scores");
    let resHighest = await resHighestDB.json();

    // Send request for lowest
    let resLowestDB = await fetch("http://localhost:3000/graphs/lowest_scores");
    let resLowest = await resLowestDB.json();

    // If request fails
    if (resHighest.error) throw resHighest.error;
    if (resLowest.error) throw resLowest.error;

    // Build highest table
    const table1Body = document.querySelector("#table_1_body");
    resHighest.results.forEach((row) => {
        table1Body.innerHTML += `
                <tr>
                    <td>${row["Name of the Level"]}</td>
                    <td>${row["player"]}</td>
                    <td>${row["Score"]}</td>
                    <td>${row["Avg score of the level"]}</td>
                </tr>
            `;
    });

    // Build lowest table
    const table2Body = document.querySelector("#table_2_body");
    resLowest.results.forEach((row) => {
        table2Body.innerHTML += `
                <tr>
                    <td>${row["Name of the Level"]}</td>
                    <td>${row["player"]}</td>
                    <td>${row["Score"]}</td>
                    <td>${row["Avg score of the level"]}</td>
                </tr>
            `;
    });
      
  } catch (error) {
    console.log("BUILD TABLES ERROR:", error);
    alert("There was an error creating the tables.");
  }
}

// Build players-answers table
async function buildPlayersAnswersTables() {
    try {
        // Send request
        let resTableDB = await fetch("http://localhost:3000/graphs/players_answers");
        let resTable = await resTableDB.json();

        // If request fails
        if (resTable.error) throw resTable.error;

        // Build table
        const tableBody = document.querySelector("#table_3_body");
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
    buildTopTables();
    buildPlayersAnswersTables();
});