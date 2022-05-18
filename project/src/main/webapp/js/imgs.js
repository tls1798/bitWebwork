var img;
var cnt=0;
var prv;
var nxt;
var timeout;
var div;
var arr = [
    'https://dummyimage.com/600x400/555/fff&text=01',
    'https://dummyimage.com/600x400/555/fff&text=02',
    'https://dummyimage.com/600x400/555/fff&text=03',
    'https://dummyimage.com/600x400/555/fff&text=04',
    'https://dummyimage.com/600x400/555/fff&text=05',
    'https://dummyimage.com/600x400/555/fff&text=06'
];
function loopImg(){
    nxt.click();
}
window.onload=function(){
    div = document.querySelector('div');
    div.outerHTML='<div></div><a href="#">prev</a> <a href="#">next</a>';
    div = document.querySelector('div');
    div.innerHTML='<img src="'+arr[cnt]+'">';
    prv=document.querySelectorAll('a')[0];
    nxt=document.querySelectorAll('a')[1];
    // dom level2
    // prv.onclick=prvImg;
    // nxt.onclick=nxtImg;
    // dom level3
    prv.addEventListener('click',prvImg);
    nxt.addEventListener('click',nxtImg);
    img=document.querySelector('div>img');
    timeout = setTimeout(loopImg,3000);
};
function prvImg(e){
    // 기본기능 취소(level2~3)
    e.preventDefault();
    cnt--;
    if(cnt==-1) cnt=arr.length-1;
    img.src=arr[cnt];
    clearTimeout(timeout);
    timeout = setTimeout(loopImg,3000);
    console.log('prev');

    // 기본기능 취소(level2)
    // return false dom level2에서 가능
    // dom 3 안됨 -> 이벤트 객체 이용
    return false;
};
function nxtImg(e){
    e.preventDefault();
    cnt++;
    if(cnt==arr.length) cnt=0;
    // div.innerHTML='<img src="'+arr[cnt]+'">';
    // img=document.querySelector('div>img');
    // img.style.animationDuration='2s';
    // img.style.animationName='ani1';
    img.src=arr[cnt];
    console.log('next');
    clearTimeout(timeout);
    timeout = setTimeout(loopImg,3000);
    return false;
};