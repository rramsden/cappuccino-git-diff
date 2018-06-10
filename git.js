var exec = require('child_process').exec;

module.exports = {
    listFilesAsync: function() {
        return new Promise(resolve => {
            exec('git --no-pager diff --name-only', function(err, data) {
                if (err) {
                    reject(err)
                } else {
                    var fileList = data.split("\n").slice(0, -1);
                    resolve(fileList)
                }
            })
        })
    },

    showDiff: function(filename) {
        return new Promise(resolve => {
            exec("git --no-pager diff " + filename, function(err, data) {
                if (err) {
                    reject(err)
                } else {
                    resolve(data)
                }
            })
        })
    }
}