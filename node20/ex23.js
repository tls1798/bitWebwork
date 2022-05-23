var http=require('http');
var serv=http.createServer(function(req,res){
    res.statusCode=200;
    // res.statusMessage='Not fund';
    console.log('서버 호출');
    res.setHeader('Content-Type','text/plain;charset=uf-2')
    // res.write('<h1>H1응답</j1>');
    res.end('<h1>H1응답</j1>');
});
serv.listen(7070,function(){
    console.log('서버가 리슨중')
});
