const fs = require("fs");
const ware = require("../routes/ware.js");


saveToJson = (data,path) => {
    try {
        // if (!fs.existsSync(`./db/${path}/`)) {
        //     fs.mkdirSync(`./db/${path}/`, { recursive: true });
        //     console.log("folder successfully created");
        // }
        // else {
        //     console.log("Folder already exist!");
        // }
        if (fs.existsSync(path)) {

            var storage = fs.readFileSync(path);
            var storageToJson = JSON.parse(storage);
            storageToJson.push(data);
            const convert = JSON.stringify(storageToJson, null, 2);
            fs.writeFile(path, convert, (err) => {
                if (err) throw (e);
                console.log("all set");
            });
        }
        else {

            const convert02 = JSON.stringify([data], null, 2);
            fs.writeFile(path, convert02, (err) => {
                if (err) throw (err);
                console.log("all set");
            });
        }

    } catch (e) {
        console.log(e);
    }
}


readFromJson = (path) => {
    var storage = fs.readFileSync(path);
    var storageToJson = JSON.parse(storage);
    return storageToJson;
}


module.exports = { saveToJson, readFromJson };