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
        var stems = JSON.parse(localStorage.getItem("auden-staticSearch-ac"));
    }
    var stems = stems.value;
} else {
    download("static-search/filenames_auden.txt");
    var stems = stemsObj.value;
}

$("#ssForm").find(".ssQueryAndButton").after(`
    <div id="ac-complete"/>`
);

const searchInput = $("#ssQuery");
searchInput.attr("autocomplete", "off");
searchInput.attr("name", "hidden");

const searchInputPanel = $("#ac-complete");
// $(this).focusin(function() {        
//     var invalue = searchInput.val();
//     if (invalue.length > 0) {
//         getValue();
//     }
//     getItem();
// });

searchInput.keyup(function() {        
    searchInputPanel.removeClass("ac-border");
    searchInput.removeClass("ac-border2"); 
    searchInputPanel.empty();

    var invalue = searchInput.val();
    if (invalue.length > 0) {
        getValue();
    }
    getItem();
    getItemMany();
});

const clearbutton = $("#ssClear");

clearbutton.click(function() {
    searchInputPanel.removeClass("ac-border");
    searchInput.removeClass("ac-border2"); 
    searchInputPanel.empty();
});

function getValue() {
    var inputvalue = searchInput.val().toLowerCase().replace('"','').replace('+','').replace('-','').replace('"','').replace('*','').replace('?','').replace('[','').replace(']','');

    if (inputvalue.includes(' ') == true) {
        searchInputPanel.append(`
            <div class="row" id="ac-complete-many">
                <div class="col-md-12 text-center">
                    <svg id="ac-select-all" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-arrow-up-square" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.5 9.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
                    </svg>
                </div>
            </div>
        `);

        const searchInputPanelMany = $("#ac-complete-many");
        var inputvalues = inputvalue.split(' ');
        inputvalues.forEach(function(value) {
            var idRandom = value + Math.ceil(Math.random() * 10) + Math.ceil(Math.random() * 10) + Math.ceil(Math.random() * 10);
            var idRandom2 = value + Math.ceil(Math.random() * 10) + Math.ceil(Math.random() * 10);
            var idRandom3 = value + Math.ceil(Math.random() * 10);
            searchInputPanelMany.append(`
                <div class="col-md-4" id="${idRandom}">
                    <div class="row" style="padding:.25em;">
                        <div class="col-md-12 stems-many" style="padding:.5em;">
                            <input id="${idRandom2}" style="max-width:100%;"/>
                        </div>
                    </div>
                </div>
            `);

            var stemsuggestions = Object.entries(stems).filter(function(stem) {
                // console.log(stem);
                return stem[0].startsWith(value);            
            });

            // console.log(stemsuggestions.length);
            var sortedstems = stemsuggestions.sort(function(a, b) {
                return a[1] - b[1];
            }).reverse();  

            var randomCol = $('#' + idRandom);
            if (stemsuggestions.length !== 0) {
                // console.log(sortedstems);
                sortedstems.forEach(function(stemsuggested) {
                    randomCol.append(`                        
                        <div class="stem row" style="padding:.25em;">
                            <div class="s-name-many-${idRandom3} col-md-8" style="padding-left:1em;">${stemsuggested[0]}</div>
                            <div class="col-md-4" style="text-align:right;"><small>${stemsuggested[1]}</small></div>
                        </div>
                    `);         
                });
            } else {
                randomCol.append(`
                    <div class="row" style="padding:.25em;">
                        <div class="col-md-12" style="padding-left:1em;">no keywords found</div>
                    </div>
                `);
            }
            $('.stem .s-name-many-' + idRandom3).on("click", function() {
                var svalue = $(this).text();
                // console.log(svalue);
                var inputMany = $("#" + idRandom2);
                inputMany.val(svalue);
            });            
        });

    } else {
        var stemsuggestions = Object.entries(stems).filter(function(stem) {
            // console.log(stem);
            return stem[0].startsWith(inputvalue);            
        });
    
        // console.log(stemsuggestions.length);
        var sortedstems = stemsuggestions.sort(function(a, b) {
            return a[1] - b[1];
        }).reverse();
    
        if (stemsuggestions.length !== 0) {
            // console.log(sortedstems);
            sortedstems.forEach(function(stemsuggested) {
                searchInputPanel.append(`
                    <div class="stem row" style="padding:.5em;">
                        <div class="s-name col-md-9" style="padding-left:1em;">${stemsuggested[0]}</div>
                        <div class="col-md-3" style="text-align:right;"><small>score: ${stemsuggested[1]}</small></div>
                    </div>
                `);                
            });
        } else {
            searchInputPanel.append(`
                <div class="stem row" style="padding:.5em;">
                    <div class="s-name col-md-9" style="padding-left:1em;">no keywords found</div>
                </div>
            `);
        }
    }

    searchInputPanel.addClass("ac-border");
    searchInput.addClass("ac-border2");
};

function getItem() {  
    $(".stem .s-name").on("click", function() {
        var svalue = $(this).text();
        // console.log(svalue);
        searchInput.val(svalue);
        searchInput.focus();
    });
}

function getItemMany() {
    $('#ac-select-all').on("click", function() {
        var svalue = $(".stems-many input");
        var value = "";
        for (var i = 0; i < svalue.length; i++) {                    
            value += svalue[i].value + " ";
        }
        // console.log(value);
        searchInput.val(value);
        searchInput.focus();
    });
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
        localStorage.setItem("auden-staticSearch-ac", JSON.stringify(stemsObj));
    }, 10000);
}
