/* 
###################################################################################
###################################################################################

Autocomplete ADD-ON for staticSearch https://github.com/projectEndings/staticSearch
developed by https://github.com/linxOD for https://github.com/acdh-oeaw

Download only: used at any static html site to download and cache data before
staticSearch search page is loaded to reduce possible loading time.

###################################################################################
###################################################################################
*/

openFile = ARCHEapi.openFile;

var config = getConfig();
setTimeout(() => {
    getData(config[0], config[1], config[2]);
}, 1000);

/* 
###################################################################################
###################################################################################

CUSTOM FUNCTIONS: 

getConfig, getData, download

###################################################################################
###################################################################################
*/

// retrieving configruation data as array
function getConfig() {
    var config = [];
    openFile("autocomplete-addon/config.txt", (rs) => {
        let conf = rs.split("\n");
        conf.forEach((c) => {
            config.push(c);
        });
    });
    return config;
}

// retrieves browser cache or fetches staticSearch json files
// if browser cache is older than 7 days it fetches files
// stores data in predefined "var stems"
// specify name to set cache item name
function getData(projectname, txtFilePath, dir) {
    var stemsCache;
    if (localStorage.getItem(`${projectname}-staticSearch-ac`) !== null) {    
        stemsCache = JSON.parse(localStorage.getItem(`${projectname}-staticSearch-ac`));
        const now = new Date();
        const expiry = new Date(stemsCache.date.dateExpiry);
        if (now > expiry) {
            localStorage.removeItem(`${projectname}-staticSearch-ac`);
            download(txtFilePath, dir)
            .then((data) => {
                setTimeout( () => {
                    localStorage.setItem(`${projectname}-staticSearch-ac`, JSON.stringify(data));
                }, 5000);                   
            }); 
        }
        
    } else {
        download(txtFilePath, dir)
        .then((data) => {            
            setTimeout( () => {
                localStorage.setItem(`${projectname}-staticSearch-ac`, JSON.stringify(data));
            }, 5000); 
        });
    }
}

async function download(filepath, directory) {
    const stemsObj = {
        "value": {},
        "date": {}
    };
    openFile(filepath, (rs) => {
        var filenames = rs.split('\n');
        filenames.forEach(function(file) {
            if (file.length > 1) {
                var filename = file.replace(`${directory}/`,'');            
                openFile(filename, (file) => {
                    var response = JSON.parse(file);
                    var stem = response.stem;
                    var inst = response.instances;
                    var instances = [];
                    inst.forEach((instance) => {
                        instances.push(instance.score);   
                    });
                    if (instances.length > 1) {
                        var scoreSum = 0;
                        instances.forEach((score) => {
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
    return stemsObj;
};