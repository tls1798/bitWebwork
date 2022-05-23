var fs = require('fs');
var rs = fs.createReadStream('ex18.txt');
// 스트림 읽어오는 이벤트
rs.on('data',function(data){
    console.log(data);
});
// 읽을것이 없을 때 일어나는 이벤트
rs.on('end',function(){
    // 반드시 end 이벤트에서 닫기
    // rs.close();
    rs.end();
})