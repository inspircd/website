$(document).ready(function() {
    $('.header__mobile-menu').on('click', function(ev) {
        ev.stopPropagation();
        $('body').toggleClass('site__offside-open');
    });

    $('.site__wrap').on('click', function(ev) {
        ev.stopPropagation();
        $('body').removeClass('site__offside-open');
    });
});
