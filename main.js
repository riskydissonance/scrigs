console.log("Running")
const bytecode = require('scrigs');
const scrigs = WebAssembly.instantiate(bytecode, {
    env: {
        print: function(x) {
            console.log(x);
        }
    }
}).then(result => {
    var add = result.instance.exports.add;
    add(33,5)
});

module.exports.loop = function() {

}
