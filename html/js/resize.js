var isResizing = false,
    lastDownX = 0;

$(function () {
    var container = $('.container-resize'),
        left = $('.text-resize'),
        right = $('.img-resize'),
        handle = $('.img-expand');
        viewer = $('.img-resize').children('div');

    handle.on('mousedown', function (e) {
        isResizing = true;
        lastDownX = e.clientX;
    });

    $(document).on('mousemove', function (e) {
        // we don't want to do anything if we aren't resizing.
        if (!isResizing) 
            return;

        var offsetRight = container.width() - (e.clientX - container.offset().left);
        console.log(offsetRight);

        left.css('max-width', container.width() - offsetRight);
        right.css('max-width', offsetRight);
        viewer.css('width', offsetRight);

    }).on('mouseup', function (e) {
        // stop resizing
        isResizing = false;
    });
});