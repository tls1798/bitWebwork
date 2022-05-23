var evn = require('events');
const { EventEmitter } = require('stream');
var emit=new evn.EventEmitter();
emit.on('event1',function(e){
    console.log('event1');
});
var callback2=function(e){
    console.log('event2');
}
emit.on('event2',callback2);
var callback3=function(e){
    console.log('event3');
}
emit.on('event3',);
console.log(emit.eventNames(),emit.listenerCount('event1'));
emit.emit('event1');
emit.emit('event2');
// emit.removeListener('event3',callback3);
emit.off('event3',callback3);
emit.emit('event3');