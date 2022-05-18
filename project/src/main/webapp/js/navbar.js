var i = 0;
window.onload=function(){
    window.addEventListener('scroll',function(){
        if(window.scrollY<=1){
            $('nav').removeClass('navbar_fixed');
        } else {
            $('nav').addClass('navber navbar_fixed');
        }
    })
    $('nav>.bi').on('click',function(){
        $('.menus').toggleClass('open');
        $('.icon').toggleClass('open');
        if(i==0){
            $('nav>.bi').attr('class','bi bi-x');
            i++;
        } else{
            $('nav>.bi').attr('class','bi bi-list');
            i--;
        }
    })
}