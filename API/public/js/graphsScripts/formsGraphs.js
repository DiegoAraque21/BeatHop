// Graph 1
let forms1 = document.getElementById("forms1").getContext("2d");
let myChart4 = new Chart(forms1, {
    type: "pie",
    data: {
        labels: ['Yes', 'No'],
        datasets: [{
            label: 'Num datos',
            data: [10, 9],  
            backgroundColor: [
                'rgb(74, 135, 72,0.5)',
                'rgb(229, 89, 50,0.5)'
            ]
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Have you played any percussion instrument?'
        },
        maintainAspectRatio: true
    }
});

// Graph 2
let forms2 = document.getElementById("forms2").getContext("2d");
let myChart5 = new Chart(forms2, {
    type: "pie",
    data: {
        labels: ['Yes', 'Some of them', 'No'],
        datasets: [{
            label: 'Num datos',
            data: [10, 9, 15],
            backgroundColor: [
                'rgb(74, 135, 72,0.5)',
                'rgb(66, 134, 244,0.5)',
                'rgb(229, 89, 50,0.5)'
            ]
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Can you identify the musical notes?'
        },
        maintainAspectRatio: true
    }
});

// Graph 3
let forms3 = document.getElementById("forms3").getContext("2d");
let myChart6 = new Chart(forms3, {
    type: "pie",
    data: {
        labels: ['Yes', 'Some of them', 'No'],
        datasets: [{
            label: 'Num datos',
            data: [10, 9, 15],
            backgroundColor: [
                'rgb(74, 135, 72,0.5)',
                'rgb(66, 134, 244,0.5)',
                'rgb(229, 89, 50,0.5)'
            ]
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Can you identify all the different tempo notes?'
        },
        maintainAspectRatio: true
    }
});