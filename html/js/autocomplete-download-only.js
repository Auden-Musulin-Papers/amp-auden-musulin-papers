openFile = ARCHEapi.openFile;

const stemsObj = {};

if (localStorage.getItem("auden-staticSearch-ac") !== null) {    
    var stems = JSON.parse(localStorage.getItem("auden-staticSearch-ac"));
    var now = new Date();
    var expiry = new Date(stems.dateExpiry);
    if (now > expiry) {
        localStorage.removeItem("auden-staticSearch-ac");
        download("static-search/filenames_auden.txt");
        var stems = stemsObj;
    }
} else {
    download("static-search/filenames_auden.txt");
    var stems = stemsObj;
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
                        stemsObj[stem] = scoreSum;
                    } else {
                        stemsObj[stem] = instances[0];
                    }              
                });
            }
        });
        const date = new Date();
        date.setDate(date.getDate() + 7);
        // console.log(date);
        stemsObj["dateExpiry"] = date;
    });
    setTimeout(function() {
        localStorage.setItem("auden-staticSearch-ac", JSON.stringify(stemsObj));
    }, 10000);
}
