var mysql = require('mysql');
var express = require('express');
var app = express()

// app.set('views',__dirname+\\..\\public')
/* 
순서에 따라 다른 페이지를 로드함 
static 우선순위 가장 높게 주는 것이 좋음
*/
var path = require('path');
app.use(express.static(path.resolve(__dirname,'../public')));
app.set('views',path.resolve(__dirname,'../views'))
app.set('view engine', 'ejs');
app.use(express.json(),express.urlencoded({extended:false}));

/* 
use 모듈 사용, 
세번째 인자 호출 하면 다음으로 넘어감, 
함수 여러개 사용 가능
app.use(function(req,res,cb){
    console.log('1')
    cb();
},function(req,res,cb){
    console.log('2')
    cb();
})
*/
var emp=require('./routers/emp');
var dept=require('./routers/dept');

app.use('/emp',emp);
app.use('/dept',dept);

app.listen(3000,function(){
    console.log('server starting')
    console.log(path.resolve(__dirname,'../views'))
})
