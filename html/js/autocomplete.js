openFile = ARCHEapi.openFile;

// var stems = [];
var stemsObj = {};
openFile("static-search/filenames_auden.txt", (rs) => {
    var filenames = rs.split(',');
    $("#ssForm").find(".ssQueryAndButton").after(
        `<div id="ac-complete"/>`
    );
    filenames.forEach(function(file, i) {
        var filename = file.replace('html/','');
        openFile(filename, function(file) {
            const response = JSON.parse(file);
            var stem = response.stem;
            var inst = response.instances;
            var instances = [];
            inst.forEach(function(instance) {
                instances.push(instance.score);   
            });
            // stems.push(
            //     {
            //         name: stem,
            //         score: instances[0]
            //     }
            // );
            stemsObj[stem] = instances[0];
            // console.log(response);
            // console.log(stem);
            // console.log(json.instances);
        });
    });
    // console.log(stems);
    // console.log(stemsObj);
});

const searchInput = $("#ssQuery");

searchInput.focus(function() {
    const searchInputPanel = $("#ac-complete");

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

        // var stemsuggestions = stems.filter(function(stem) {
        //     // console.log(stem.name);
        //     return stem.name.startsWith(inputvalue);
        // });
        var stemsuggestions2 = Object.entries(stemsObj).filter(function(stem) {
            // console.log(stem);
            return stem[0].startsWith(inputvalue);
        });
        //console.log(stemsuggestions2);
        var sortedstems = stemsuggestions2.sort(function(a, b) {
            return a[1] - b[1];
        }).reverse();

        // console.log(sortedstems);
        sortedstems.forEach(function(stemsuggested) {
            // console.log(stemsuggested.name + "_" + stemsuggested.score);
            searchInputPanel.append(`
                <div class="stem row" data-subject="${stemsuggested[1]}" style="padding:.5em;">
                    <div class="col-md-10" style="padding-left:1em;">${stemsuggested[0]}</div>
                    <div class="col-md-2">score: ${stemsuggested[1]}</div>
                </div>
            `);
        });

        searchInputPanel.addClass("ac-border");
        searchInput.addClass("ac-border2");

        if (inputvalue === "") {
            searchInputPanel.empty();
        }
    };

    function getItem() {
        $(".stem .col-md-10").on("click", function() {
            var svalue = $(this).text();
            // console.log(svalue);
            searchInput.val(svalue);
            searchInput.focus();
        });
    }

    // function sortByScore(stemsuggestions2) {
    //     return Object.entries(stemsuggestions2).sort((a, b) => (a > b ? -1 : 1));
    // };
});
