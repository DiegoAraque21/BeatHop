// Dataset
const gameDataset = [
    {
        title: "Average score per level",
        label: "Average Score",
        canvasId: "game1",
        answers: [
            {
                num: 10,
                label: "Level 1",
                color: "rgba(54, 162, 235, 0.2)",
                border: "rgb(54, 162, 235)"
            },
            {
                num: 8,
                label: "Level 2",
                color: "rgba(54, 162, 235, 0.2)",
                border: "rgb(54, 162, 235)"
            },
            {
                num: 7,
                label: "Level 3",
                color: "rgba(54, 162, 235, 0.2)",
                border: "rgb(54, 162, 235)"
            }
        ]
    },
    {
        title: "Total deaths per level",
        label: "Total Deaths",
        canvasId: "game2",
        answers: [
            {
                num: 10,
                label: "Level 1",
                color: "rgba(255, 99, 132, 0.2)",
                border: "rgb(255, 99, 132)"
            },
            {
                num: 8,
                label: "Level 2",
                color: "rgba(255, 99, 132, 0.2)",
                border: "rgb(255, 99, 132)"
            },
            {
                num: 7,
                label: "Level 3",
                color: "rgba(255, 99, 132, 0.2)",
                border: "rgb(255, 99, 132)"
            }
        ]
    },
    {
        title: "Total tries per level",
        label: "Total Tries",
        canvasId: "game3",
        answers: [
            {
                num: 10,
                label: "Level 1",
                color: "rgba(255, 205, 86, 0.2)",
                border: "rgb(255, 205, 86)"
            },
            {
                num: 8,
                label: "Level 2",
                color: "rgba(255, 205, 86, 0.2)",
                border: "rgb(255, 205, 86)"
            },
            {
                num: 7,
                label: "Level 3",
                color: "rgba(255, 205, 86, 0.2)",
                border: "rgb(255, 205, 86)"
            }
        ]
    }
]

// Build game graphs
async function buildGameGraphs() {
    try {
        // Send request
        let resGameDB = await fetch("http://localhost:3000/game/all_level");
        let resGame = await resGameDB.json();

        // If request fails
        if (resGame.error) throw resGame.error;

        // Modify datasets
        for (let i = 0; i < 3; i++){
            gameDataset[0].answers[i].num = resGame.levels[i].avgScore;
            gameDataset[1].answers[i].num = resGame.levels[i].totalDeaths;
            gameDataset[2].answers[i].num = resGame.levels[i].totalTries;
        }

        // Build graphs with the dataset
        gameDataset.forEach(graph => {
            
            // Get the canvas
            let canvas = document.getElementById(graph.canvasId).getContext("2d");

            // Create chart
            let chart = new Chart(canvas, {
                type: "bar",
                data: {
                    labels: [
                        graph.answers[0].label,
                        graph.answers[1].label,
                        graph.answers[2].label
                    ],
                    datasets: [{
                        label: graph.label,
                        data: [
                            graph.answers[0].num,
                            graph.answers[1].num,
                            graph.answers[2].num
                        ],
                        backgroundColor: [
                            graph.answers[0].color,
                            graph.answers[1].color,
                            graph.answers[2].color
                        ],
                        borderColor: [
                            graph.answers[0].border,
                            graph.answers[1].border,
                            graph.answers[2].border
                        ],
                        borderWidth: 1.5
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: graph.title
                    },
                    maintainAspectRatio: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        })

    }
    catch (error) {
        console.log("GET LEVEL DATA ERROR:", error);
        alert(error);
    }
};

// Build game graphs
buildGameGraphs();
