(function($) {
    window.onscroll = function() {
        scrollFunction()}

        function scrollFunction() {
            if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
                backtop.classList.add('backtop-open');
            } else {
                backtop.classList.remove('backtop-open');
            }
        }
    $('#backtop').click(function (){
        $('html,body').animate({
            scrollTop : 0
        },1000);
    })
})(jQuery);
