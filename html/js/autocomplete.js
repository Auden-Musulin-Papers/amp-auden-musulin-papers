openFile = ARCHEapi.openFile;

var stemsObj = {};
openFile("static-search/filenames_auden.txt", (rs) => {
    var filenames = rs.split(',');
    $("#ssForm").find(".ssQueryAndButton").after(
        `<div id="ac-complete"/>`
    );
    filenames.forEach(function(file) {
        var filename = file.replace('html/','');
        openFile(filename, function(file) {
            const response = JSON.parse(file);
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
            // console.log(response);
        });
    });
    // console.log(stemsObj);
});

const searchInput = $("#ssQuery");

searchInput.focus(function() {
    const searchInputPanel = $("#ac-complete");
    searchInput.attr("autocomplege", "false");
    searchInput.attr("name", "hidden");

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

        var stemsuggestions = Object.entries(stemsObj).filter(function(stem) {
            // console.log(stem);
            return stem[0].startsWith(inputvalue);
        });

        //console.log(stemsuggestions);
        var sortedstems = stemsuggestions.sort(function(a, b) {
            return a[1] - b[1];
        }).reverse();

        // console.log(sortedstems);
        sortedstems.forEach(function(stemsuggested) {
            searchInputPanel.append(`
                <div class="stem row" style="padding:.5em;">
                    <div class="s-name col-md-9" style="padding-left:1em;">${stemsuggested[0]}</div>
                    <div class="col-md-3" style="text-align:right;">score: ${stemsuggested[1]}</div>
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
        $(".stem .s-name").on("click", function() {
            var svalue = $(this).text();
            // console.log(svalue);
            searchInput.val(svalue);
            searchInput.focus();
        });
    }
});
