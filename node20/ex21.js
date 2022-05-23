var fs=require('fs');
// fs.mkdir('./test01',function(err){
//     if(err) fs.rmdir('./text01');
// })

// fs.open('./ex22.js','wrx',function(err,num){
//     if(err) console.log(err);
//     else console.log(num);
// });

// fs.unlink('./ex22.js',function(err){if(err) {console.log(err)}})
// fs.readdir('./',function(err,files){
//     for(var file of files)console.log(file);
// })
// fs.copyFileSync('ex18.txt','ex19.txt')
fs.rename('ex18.txt','ex20.txt',function(err){
    console.log(err)
})