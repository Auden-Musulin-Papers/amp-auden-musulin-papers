openFile = ARCHEapi.openFile;

const stemsObj = {};

if (localStorage.getItem("auden-staticSearch-ac") !== null) {    
    var stems = JSON.parse(localStorage.getItem("auden-staticSearch-ac"));
    const now = new Date();
    const expiry = new Date(stems.dateExpiry);
    if (now > expiry) {
        localStorage.removeItem("auden-staticSearch-ac");
        download("static-search/filenames_auden.txt");
        var stems = stemsObj;
    }
} else {
    download("static-search/filenames_auden.txt");
    var stems = stemsObj;
}

$("#ssForm").find(".ssQueryAndButton").after(
    `<div id="ac-complete"/>`
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
});

const clearbutton = $("#ssClear");

clearbutton.click(function() {
    searchInputPanel.removeClass("ac-border");
    searchInput.removeClass("ac-border2"); 
    searchInputPanel.empty();
});

function getValue() {
    var inputvalue = searchInput.val().toLowerCase();

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
                    <div class="col-md-3" style="text-align:right;">score: ${stemsuggested[1]}</div>
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

function download(filepath) {
    openFile(filepath, (rs) => {
        var filenames = rs.split(',');
        console.log(filenames);
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
