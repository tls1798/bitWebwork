var url=require('url');
var myUrl='https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%85%B8%EB%93%9Cjs&oquery=%EB%85%B8%EB%93%9C&tqi=hor9Hlp0Jy0sstgwPANssssstSl-159769';
var myUrl=new url.URL(myUrl);
// console.log(myUrl.origin);
// console.log(myUrl.pathname);
// console.log(myUrl.searchParams);
// console.log(myUrl.searchParams.get('query'));
for(key of myUrl.searchParams.keys()) console.log(key)
for(value of myUrl.searchParams.values()) console.log(value)