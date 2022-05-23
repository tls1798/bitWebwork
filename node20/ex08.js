// event 등록 후 main 끝나고 작업

var callback1=function(){
    console.log('1실행');
};
console.log('main start');
// var t3 = setTimeout(callback1,0);
//
setImmediate(callback1);
setTimeout(function(){
    console.log('3실행')
},0)
console.log('main end');


// setTimeout(function(){
//     console.log('4실행')
// },4000);

// setTimeout(function(){
//     console.log('1실행')
// },1000)

// clearTimeout(t3);