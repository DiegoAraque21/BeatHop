let ctx= document.getElementById("myChart").getContext("2d");

        let myChart= new Chart(ctx,{
            type:"bar",
            data:{
                labels:['col1','col2','col3'],
                datasets:[{
                        label:'Num datos',
                        data:[10,9,15],
                        backgroundColor:[
                            'rgb(66, 134, 244,0.5)',
                            'rgb(74, 135, 72,0.5)',
                            'rgb(229, 89, 50,0.5)'
                        ]
                }]
            },
            options:{
                title: {
                    display: true,
                    text: 'Bar graph 1'
                },
                maintainAspectRatio: true,
                scales:{
                    
                    yAxes:[{
                            ticks:{
                                beginAtZero:true
                            }
                    }]
                }
            }
        });

let ctx2= document.getElementById("myChart2").getContext("2d");

let myChart2= new Chart(ctx2,{
    type:"bar",
    data:{
        labels:['col1','col2','col3'],
        datasets:[{
                label:'Num datos',
                data:[10,9,15],
                backgroundColor:[
                    'rgb(66, 134, 244,0.5)',
                    'rgb(74, 135, 72,0.5)',
                    'rgb(229, 89, 50,0.5)'
                ]
        }]
    },
    options:{
        title: {
            display: true,
            text: 'Bar Graph 2'
        },
        maintainAspectRatio: true,
        scales:{
            
            yAxes:[{
                    ticks:{
                        beginAtZero:true
                    }
            }]
        }
    }
});

let ctx3= document.getElementById("myChart3").getContext("2d");

let myChart3= new Chart(ctx3,{
    type:"pie",
    data:{
        labels:['col1','col2','col3'],
        datasets:[{
                label:'Num datos',
                data:[10,9,15],
                backgroundColor:[
                    'rgb(66, 134, 244,0.5)',
                    'rgb(74, 135, 72,0.5)',
                    'rgb(229, 89, 50,0.5)'
                ]
        }]
    },
    options:{
        title: {
            display: true,
            text: 'Pie Graph'
        },
        maintainAspectRatio: true,
        scales:{
            
            yAxes:[{
                    ticks:{
                        beginAtZero:true
                    }
            }]
        }
    }
});
