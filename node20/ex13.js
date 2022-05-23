var path=require('path');
// console.log(path);
console.log(path.sep,path.delimiter);
var msg='c:\\windows\\..\\webwork\\.\\node20';
//절대경로
console.log(path.resolve(__filename));
//경로->객체
console.log(path.parse(msg));
//객체->경로
console.log(path.format(path.parse(msg)));
console.log(path.isAbsolute(msg));
console.log(path.isAbsolute('./ex01.js'));
console.log(path.basename(msg))
console.log(path.dirname(msg))