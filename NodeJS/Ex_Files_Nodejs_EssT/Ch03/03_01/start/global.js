//fetches the module path
var path = require("path")
var hello = "Hello World from Node JS";
justNode = hello.slice(17);
//${justNode} will substitute the value of the variable justNode
console.log(`Rock on world from ${ path.basename(__filename) } `);
//gives dir name of the script
console.log(__dirname);
//gives full filename of the script
console.log(__filename);