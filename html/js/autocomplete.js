openFile = ARCHEapi.openFile;

var stems = [];
openFile("static-search/filenames_auden.txt", (rs) => {
    var filenames = rs.split(',');
    $("#ssForm").find(".ssQueryAndButton").after(
        `<div id="ac-complete"/>`
    );
    for (var i = 0; i < filenames.length; i++) {
        console.log(filenames[i]);
        var filename = filenames[i].replace('html/','');
        openFile(filename, function(file) {
            const response = JSON.parse(file);
            var stem = response.stem;
            stems.push(stem);
            // console.log(response);
            // console.log(stem);
            // console.log(json.instances);
        });
    }
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
            return stem.startsWith(inputvalue);
        });
        // console.log(stemsuggestions);
        stemsuggestions.forEach(function(stemsuggested) {
            // console.log(stemsuggested);
            searchInputPanel.append(`<p class="stem" style="margin:0!important;">${stemsuggested}</p>`);
        });

        searchInputPanel.addClass("ac-border");
        searchInput.addClass("ac-border2");

        if (inputvalue === "") {
            searchInputPanel.empty();
        }
    };

    function getItem() {
        $(".stem").on("click", function() {
            var svalue = $(this).text();
            // console.log(svalue);
            searchInput.val(svalue);
            searchInput.focus();
        });
    }
});