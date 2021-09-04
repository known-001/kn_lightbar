$(function()
{
    $(document).keyup(function (e) {
        if (e.keyCode == 27) {
            $('#container').fadeOut();
            $('#admin').fadeOut();
            $.post('http://kn_lightbar/close', JSON.stringify({}));
        }
    });
    
    //get info from client side
    window.addEventListener('message', function(event)
    {
        var kn = event.data;
        if (kn.action == 'open') {
            $('#container').fadeIn();
            $('#players').html(kn.players);
        }

    }, false);

    $("#back").click(() => {
        $('#admin').css('display', 'none');
        $('#container').css('display', 'block');
    });

});

function OpenMenu(type) {
    $('#container').fadeOut();
    $.post('http://kn_lightbar/use', JSON.stringify({ type: type}));
}