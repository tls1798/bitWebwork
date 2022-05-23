var fs = require('fs');
var ws = fs.createWriteStream('ex18.txt');
ws.write('첫번째 작성\n');
ws.write('두번째 작성');

// ws.close();
ws.end();