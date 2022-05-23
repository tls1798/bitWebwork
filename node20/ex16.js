var fs=require('fs');
// console.log(fs);
var obj
// var callback2=function(){
//     console.log(obj)
// }
// 비동기
// fs.readFile('./ex01.js',function(err,data){
//     console.log(data);
//     console.log(data.toString);
//     obj=data.toString();
//     callback2();
// })

//동기, 내용이 많아지면 전에 실행했던 것이 끝나지 않으면 끝날때 까지 기다림
obj=fs.readFileSync('./ex01.js')
console.log(obj.toString())