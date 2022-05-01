// Dataset
const formsDataset = [
    {
        title: "Have you played any percussion instrument?",
        canvasId: "forms1",
        answers: [
            {
                num: 1,
                label: "Yes",
                color: "rgba(54, 162, 235, 0.2)",
                border: "rgb(54, 162, 235)"
            },
            {
                num: 1,
                label: "A little bit",
                color: "rgba(255, 205, 86, 0.2)",
                border: "rgb(255, 205, 86)"
            },
            {
                num: 1,
                label: "No",
                color: "rgba(255, 99, 132, 0.2)",
                border: "rgb(255, 99, 132)"
            }
        ]
    },
    {
        title: "Can you identify the musical notes?",
        canvasId: "forms2",
        answers: [
            {
                num: 1,
                label: "Yes",
                color: "rgba(54, 162, 235, 0.2)",
                border: "rgb(54, 162, 235)"
            },
            {
                num: 1,
                label: "Some of them",
                color: "rgba(255, 205, 86, 0.2)",
                border: "rgb(255, 205, 86)"
            },
            {
                num: 1,
                label: "No",
                color: "rgba(255, 99, 132, 0.2)",
                border: "rgb(255, 99, 132)"
            }
        ]
    },
    {
        title: "Can you identify all the different tempo notes?",
        canvasId: "forms3",
        answers: [
            {
                num: 1,
                label: "Yes",
                color: "rgba(54, 162, 235, 0.2)",
                border: "rgb(54, 162, 235)"
            },
            {
                num: 1,
                label: "Some of them",
                color: "rgba(255, 205, 86, 0.2)",
                border: "rgb(255, 205, 86)"
            },
            {
                num: 1,
                label: "No",
                color: "rgba(255, 99, 132, 0.2)",
                border: "rgb(255, 99, 132)"
            }
        ]
    }
]

// Build forms graphs
async function buildFormsGraphs() {
    try {
        // Send request
        let resFormsDB = await fetch("http://localhost:3000/graphs/forms");
        let resForms = await resFormsDB.json();

        // If request fails
        if (resForms.error) throw resForms.error;

        // Set answers of graph 1
        formsDataset[0].answers[0].num = resForms.results[0].Q1_A1;
        formsDataset[0].answers[1].num = resForms.results[0].Q1_A2;
        formsDataset[0].answers[2].num = resForms.results[0].Q1_A3;

        // Set answers of graph 2
        formsDataset[1].answers[0].num = resForms.results[0].Q2_A1;
        formsDataset[1].answers[1].num = resForms.results[0].Q2_A2;
        formsDataset[1].answers[2].num = resForms.results[0].Q2_A3;

        // Set answers of graph 3
        formsDataset[2].answers[0].num = resForms.results[0].Q3_A1;
        formsDataset[2].answers[1].num = resForms.results[0].Q3_A2;
        formsDataset[2].answers[2].num = resForms.results[0].Q3_A3;

        // Build graphs with the dataset
        formsDataset.forEach((graph, i) => {
            
            // Get the canvas
            let canvas = document.getElementById(graph.canvasId).getContext("2d");

            // Create chart
            let chart = new Chart(canvas, {
                type: "pie",
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
                    maintainAspectRatio: true
                }
            });
        });
    }
    catch (error) {
        console.log("GET FORMS DATA ERROR:", error);
        alert(error);
    }
};

// Build forms graphs
buildFormsGraphs();
















// Graph 1
// let forms1 = document.getElementById("forms1").getContext("2d");
// let myChart4 = new Chart(forms1, {
//     type: "pie",
//     data: {
//         labels: ['Yes', 'No'],
//         datasets: [{
//             label: 'Num datos',
//             data: [
//                 formsDataset.question1.yes,
//                 formsDataset.question1.no
//             ],  
//             backgroundColor: [
//                 'rgb(74, 135, 72,0.5)',
//                 'rgb(229, 89, 50,0.5)'
//             ]
//         }]
//     },
//     options: {
//         title: {
//             display: true,
//             text: 'Have you played any percussion instrument?'
//         },
//         maintainAspectRatio: true
//     }
// });

// // Graph 2
// let forms2 = document.getElementById("forms2").getContext("2d");
// let myChart5 = new Chart(forms2, {
//     type: "pie",
//     data: {
//         labels: ['Yes', 'Some of them', 'No'],
//         datasets: [{
//             label: 'Num datos',
//             data: [
//                 formsDataset.question2.yes,
//                 formsDataset.question2.someOfThem,
//                 formsDataset.question2.no
//             ],  
//             backgroundColor: [
//                 'rgb(74, 135, 72,0.5)',
//                 'rgb(66, 134, 244,0.5)',
//                 'rgb(229, 89, 50,0.5)'
//             ]
//         }]
//     },
//     options: {
//         title: {
//             display: true,
//             text: 'Can you identify the musical notes?'
//         },
//         maintainAspectRatio: true
//     }
// });

// // Graph 3
// let forms3 = document.getElementById("forms3").getContext("2d");
// let myChart6 = new Chart(forms3, {
//     type: "pie",
//     data: {
//         labels: ['Yes', 'Some of them', 'No'],
//         datasets: [{
//             label: 'Num datos',
//             data: [
//                 formsDataset.question3.yes,
//                 formsDataset.question3.someOfThem,
//                 formsDataset.question3.no
//             ],  
//             backgroundColor: [
//                 'rgb(74, 135, 72,0.5)',
//                 'rgb(66, 134, 244,0.5)',
//                 'rgb(229, 89, 50,0.5)'
//             ]
//         }]
//     },
//     options: {
//         title: {
//             display: true,
//             text: 'Can you identify all the different tempo notes?'
//         },
//         maintainAspectRatio: true
//     }
// });