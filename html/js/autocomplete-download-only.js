openFile = ARCHEapi.openFile;

const stemsObj = {
    "value": {},
    "date": {}
}

if (localStorage.getItem("auden-staticSearch-ac") !== null) {    
    var stems = JSON.parse(localStorage.getItem("auden-staticSearch-ac"));
    const now = new Date();
    const expiry = new Date(stems.date.dateExpiry);
    if (now > expiry) {
        localStorage.removeItem("auden-staticSearch-ac");
        download("static-search/filenames_auden.txt");
    }
} else {
    download("static-search/filenames_auden.txt");
}

function download(filepath) {
    openFile(filepath, (rs) => {
        var filenames = rs.split(',');
        filenames.forEach(function(file) {
            if (file.length > 1) {
                var filename = file.replace('html/','');            
                openFile(filename, function(file) {
                    var response = JSON.parse(file);
                    var stem = response.stem;
                    var inst = response.instances;
                    var instances = [];
                    inst.forEach(function(instance) {
                        instances.push(instance.score);   
                    });
                    if (instances.length > 1) {
                        var scoreSum = 0;
                        instances.forEach(function(score) {
                            scoreSum += score;
                        });
                        stemsObj.value[stem] = scoreSum;
                    } else {
                        stemsObj.value[stem] = instances[0];
                    }              
                });
            }
        });
        const date = new Date();
        date.setDate(date.getDate() + 7);
        // console.log(date);
        stemsObj.date["dateExpiry"] = date;
    });
    setTimeout(function() {
        console.log(stemsObj);
        localStorage.setItem("auden-staticSearch-ac", JSON.stringify(stemsObj));
    }, 10000);
}
