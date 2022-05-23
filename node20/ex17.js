var fs=require('fs')
// fs.writeFile('ex18.txt','내용을 작성합니다.', function(err){
//    if(err) console.log(err)
  
//    fs.readFile('ex18.txt',function(err,data){
//        console.log(data.toString());
//    })
// })
var msg='동기적 실행으로 작성'
fs.writeFileSync('ex18.txt',msg);
console.log(fs.readFileSync('ex18.txt').toString());
console.log(Buffer.from(msg))
console.log(Buffer.from(msg).toString)
console.log(Buffer.alloc(5))