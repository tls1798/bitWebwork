let express = require('express');
let pool=require('../modules/mysql');
let router = express.Router();

router.get('/', function(req,res){    
    pool.query('SELECT * FROM emp', function (error, results, fields) {
        if (error) throw error;
        res.render('mysql/list', {list:results});
            // conn.release();
    });
});

router.post('/',function(req,res){
    // pool.query('insert into emp (empno,ename,sal) values (?,?,?)',
    //     [req.body.empno,req.body.ename,req.body.sal], 
    //     function(err,result){
    //         console.log(result)
    //         res.redirect('./')
    //     })
    pool.getConnection(function(err,conn){
        conn.beginTransaction(function(err){
            if(err) throw err;
            conn.query('insert into emp (empno,ename,sal) values (?,?,?)',
            [req.body.empno,req.body.ename,req.body.sal],
            function(err,result){
                if (err){
                    return conn.rollback(function(){throw err});
                }
                conn.commit();
                res.redirect('./')
            })

        })
    })
})

// router.get('/*',function(req,res){
//     res.send(req.url.substring(1));
// })

router.get('/:empno',function(req,res){
    let empno = parseInt(req.params.empno);
    pool.query('select * from emp where empno=?',[empno],function(err,result){
        res.render('mysql/emp',{bean: result[0]});
    })
})

module.exports=router;