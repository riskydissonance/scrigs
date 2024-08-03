console.log("Running")
const bytecode = require('scrigs');
const scrigs = WebAssembly.instantiate(bytecode, {
    env: {
        print: function(x) {
            console.log(x);
        },
        game: Game,
    }
}).then(result => {
    var loop = result.instance.exports.loop;
    loop();
});

// module.exports.loop = function() {

// }
