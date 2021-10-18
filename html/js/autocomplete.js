openFile = ARCHEapi.openFile;
var stems = [];
openFile("static-search/filenames_auden.txt", (rs) => {
    var filenames = rs.split(',');
    $("#ssForm").find(".ssQueryAndButton").after(
        `<span id="ac-complete"/>`
    );
    for (var i = 0; i < filenames.length; i++) {
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



// openFile(filepath, function(rs) {
//     $("#ssForm").find(".ssQueryAndButton").after(
//         `<span id="ac-complete"/>`
//     )
//     // console.log(typeof rs);
//     const parser = new DOMParser();
//     const doc = parser.parseFromString(rs, "text/html");
//     var filenames = doc.querySelectorAll('li a');
//     var filelist = [];
//     for (var i = 0; i < filenames.length; i++) {
//         filename = filenames[i].innerHTML;
//         // console.log(filename);
//         filelist.push(filename);
//         openDir(filepath + filename, function(file) {
//             const response = JSON.parse(file);
//             var stem = response.stem;
//             stems.push(stem);
//             // console.log(json);
//             // console.log(searchInput.val());
//             // console.log(stem);
//             // console.log(json.instances);
//         });
//     }

// });

$( document ).ready(function() {
    var searchInput = $("#ssQuery");
    searchInput.keyup(function() {
        $("#ac-complete").removeClass("ac-border");
        $("#ac-complete").empty();
        var invalue = searchInput.val();
        if (invalue.length >= 2) {
            getValue(searchInput);
        }
        getItem(searchInput);
    });
});

function getValue(searchInput) {
    var inputvalue = searchInput.val();
    for (var i = 0; i < stems.length; i++) {
        if (stems[i].startsWith(inputvalue) == true) {
            // console.log(stems[i]);
            $("#ac-complete").append(
                `<p class="stem" style="margin:0!important;">${stems[i]}</p>`
            );
            $("#ac-complete").addClass("ac-border");
        }
    }
};

function getItem(searchInput) {
    $(".stem").on("click", function() {
        var svalue = $(this).text();
        // console.log(svalue);
        searchInput.val(svalue);
    });
}