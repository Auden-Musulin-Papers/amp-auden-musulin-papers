openFile = ARCHEapi.openFile;

var stems = [];
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
            stems.push({
                score: instances[0],
                name: stem
            });            
            // console.log(response);
            // console.log(stem);
            // console.log(json.instances);
        });
    });
    // console.log(stems);
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

        var stemsuggestions = stems.filter(function(stem) {
            // console.log(stem.name);
            return stem.name.startsWith(inputvalue);
        });
        // console.log(stemsuggestions);
        stemsuggestions.forEach(function(stemsuggested) {
            // console.log(stemsuggested.name + "_" + stemsuggested.score);
            searchInputPanel.append(`
                <div class="stem row" style="padding:.5em;">
                    <div class="col-md-10" style="padding-left:1em;">${stemsuggested.name}</div>
                    <div class="col-md-2">score: ${stemsuggested.score}</div>
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
});
