const {app, BrowserWindow} = require('electron')

function createWindow() {
    // Create the browser window
    win = new BrowserWindow({width: 800, height: 600})

    // and load the indexx.html of the app
    win.loadFile('index.html')

    // Open the DevTools.
    win.webContents.openDevTools()
}

app.on('ready', createWindow)