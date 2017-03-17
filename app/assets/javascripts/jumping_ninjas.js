$(document).ready(function(){
    animateDiv();
});

function makeNewPosition(){

    // Get viewport dimensions (remove the dimension of the div)
    var h = $('.niggaz-list').height() + $(document).height() - 50;
    var w = $('.niggaz-list').width();

    var nh = Math.floor(Math.random() * h);
    var nw = Math.floor(Math.random() * w);

    return [nh,nw];

}

function animateDiv() {
    var newq = makeNewPosition();

    $('.jumpy-nigga').each(function() {
        var newq = makeNewPosition();
        $(this).css({ top: newq[0], left: newq[1] });
        setTimeout(animateDiv, 5000);
    });

};
