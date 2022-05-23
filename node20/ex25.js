var express = require('express');
var app = express();
//정적 파일 
app.use(express.static('static'))
app.use(express.json())
app.use(express.urlencoded({extended:true}))

app.set('views','./views')
app.set('view engine','ejs')

app.get('/',function(req,res){
    // res.setHeader('Content-Type','text/html; charset=utf-8');
    // res.end('출력');
    res.render('index',{title:'hey',message:'hello there'})
});

app.post('/add.html',function(req,res){
    console.log(req.body)
    res.setHeader('Content-Type','text/html; charset=utf-8');
    res.end('<h1>새로운 페이지</h1>');
})

app.listen(7070,function(){
    console.log('service run');
});