// Carousel Auto-Cycle


var readyz = function() {
    $('.carousel').carousel({
        interval: 6000
    })
};
$(document).ready(readyz);
$(document).on('page:load', readyz);