var mysql = require('mysql');
var my = require('../mymodule/bitmysql');

var express = require('express');
var router = express.Router();

router.get('/list', function (req, res) {

    var p=req.query.p==undefined?1:parseInt(req.query.p);
    
    var conn = mysql.createConnection(my);
    
    conn.connect(function(err){
        if (err) throw err;
        console.log('connected')
    });

    var tot;
    conn.query('select count(*) as "tot" from emp',function(err, result){
        tot=result[0].tot;
    })

    conn.query('select * from emp limit '+5*(p-1)+', 5', function (error, results, fields) {
        if (error) throw error;
        res.render('emplist', {arr: results, total:tot});
    });
    // parameter 명이 일치
    // res.render('emplist', {arr: [{empno:1111, ename:'test1', sal:1000},{empno:2222, ename:'test2', sal:2000}]});

    conn.end();
})

router.get('/add', function(req,res){
    res.render('empadd',{obj:null});
});

router.post('/add', function(req,res){

    var conn = mysql.createConnection(my);
    
    conn.connect(function(err){
        if (err) throw err;
        console.log('connected')
    });
    
    // var sql = 'insert into emp (empno, ename, sal, hiredate) values('+req.body.empno+',"'+req.body.ename+'",'+req.body.sal+', now())';
    var sql ='insert into emp (empno, ename, sal, hiredate) values(?,?,?,now())';
    // 배열의 순서 = ?의 순서
    conn.query(sql,[req.body.empno, req.body.ename, req.body.sal],function (error, results, fields) {
        if (error){
            res.render('empadd',{obj: req.body});
            return;
        }
        res.redirect('list');
    });

    conn.end();
});

router.get('/row',function(req, res){
    console.log(req.query.empno);

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
        if (err) throw err;
        conn.query('SELECT empno as "empno", ename as "ename", sal as "sal" FROM emp WHERE empno = ?',[parseInt(req.query.empno)], function (err, result) {
            if (err) throw err;
            console.log(result);
            res.render("emp",{bean:result[0]})
        });
    });
    
})

router.post('/row',function(req,res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
        if (err) throw err;
        var sql = 'UPDATE emp SET ename=?, sal=?  WHERE empno = ?';
        conn.query(sql,[req.body.ename, req.body.sal, req.body.empno] ,function (err, result) {
            if (err) throw err;
            res.redirect('list');
        });
    });
 
})

router.post('/delete',function(req,res){
    
    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
        if (err) throw err;
        var sql = "DELETE FROM emp WHERE empno = ?";
        conn.query(sql,[req.body.empno] ,function (err, result) {
            if (err) throw err;
            console.log("Number of records deleted: " + result.affectedRows);
            if(result.affectedRows>0) res.statusCode=200;
            else res.statusCode=500;
            res.end();
        }); 
    });
    
})

module.exports=router;