// Graph 1
let game1 = document.getElementById("game1").getContext("2d");
let myChart = new Chart(game1, {
    type: "bar",
    data: {
        labels: ['Level 1', 'Level 2', 'Level 3'],
        datasets: [{
            label: 'Average Score',
            data: [10, 9, 15],
            backgroundColor: [
                'rgb(74, 135, 72,0.5)',
                'rgb(74, 135, 72,0.5)',
                'rgb(74, 135, 72,0.5)'
            ]
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Average score per level'
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

// Graph 2
let game2 = document.getElementById("game2").getContext("2d");
let myChart2 = new Chart(game2, {
    type: "bar",
    data: {
        labels: ['Level 1', 'Level 2', 'Level 3'],
        datasets: [{
            label: 'Total Deaths',
            data: [10, 9, 15],
            backgroundColor: [
                'rgb(229, 89, 50,0.5)',
                'rgb(229, 89, 50,0.5)',
                'rgb(229, 89, 50,0.5)'
            ]
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Total deaths per level'
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

// Graph 3
let game3 = document.getElementById("game3").getContext("2d");
let myChart3 = new Chart(game3, {
    type: "bar",
    data: {
        labels: ['Level 1', 'Level 2', 'Level 3'],
        datasets: [{
            label: 'Total Tries',
            data: [10, 9, 15],
            backgroundColor: [
                'rgb(66, 134, 244,0.5)',
                'rgb(66, 134, 244,0.5)',
                'rgb(66, 134, 244,0.5)'
            ]
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Total tries per level'
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
