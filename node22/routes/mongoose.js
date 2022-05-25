let express = require('express');
const Emp = require('../modules/mongoose');
let router = express.Router();

router.get('/add.html',function(req,res){
    res.render('mongoose/add');
});

router.get('/',function(req,res){
    Emp.find(function(err, results){
        res.render('mongoose/list',{list:results});
    })
});

router.post('/',function(req,res){
    // Emp 객체를 new 로 생성해서 값을 입력
    var newEmp = new Emp(req.body); 
    newEmp.save(function(error, data){ // 데이터 저장
        
        res.redirect('./');
    });

});

router.get('/:_id',function(req,res){
    Emp.findOne({_id:req.params._id}, function(err,results){
        res.render('mongoose/emp', {bean:results});
    })
});

router.put('/:_id',function(req,res){
    Emp.findById({_id:req.params._id},function(err,results){
        if(err) console.log(err);
        else {
            results.ename=req.body.ename;
            results.sal=req.body.sal;
            results.save(function(){
                res.redirect('./');
            });
        }
    })
})

router.delete('/:_id',function(req,res){
    Emp.remove({_id:req.params._id}, function(err,results){
        if(err){
            console.log(err);
        }
        res.redirect('./');
    });
})

module.exports=router;