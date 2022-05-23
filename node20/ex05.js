// 혼합해서 사용은 별로 안좋음 일반적으로 exports
// key, value 값으로 넘어감
exports.msg1='aaaaa';
exports.msg2='bbbbb';
exports.func03=function(){
    console.log();
}
// module.exports 파일 단 한번만 수행, 객체 타입
// module.exports={msg3:'cccc'};
// module.exports={msg4:'dddd'};
// var obj1=1111;
// module.exports=obj1;