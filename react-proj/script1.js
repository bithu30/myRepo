function doStuff() {
	console.log('Hello')
}

function otherStuff() {
	console.log('Other Stuff')
}
//module.exports=doStuff
exports.doStuff = doStuff
exports.otherStuff = otherStuff