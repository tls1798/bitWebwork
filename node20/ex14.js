//
var url=require('url');
var querystring = require('querystring');
var myUrl='https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%85%B8%EB%93%9Cjs&oquery=%EB%85%B8%EB%93%9C&tqi=hor9Hlp0Jy0sstgwPANssssstSl-159769';
console.log(url.parse(myUrl));
console.log(url.parse(myUrl).pathname);
console.log(url.parse(myUrl).query);
console.log(url.parse(myUrl).query);
var q = console.log(querystring.parse(url.parse(myUrl).query))
console.log(q.where.q.query);
console.log(querystring.stringify(q));
