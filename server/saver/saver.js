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
                console.log(`stored at ${path}`);
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

deleteFromJson=(path,id)=>{
    var storage = fs.readFileSync(path);
    var storageToJson = JSON.parse(storage);
    var jsonfileAfterDelete=storageToJson.filter(function(obj){ if(obj.id != id) return obj });
    const convert = JSON.stringify(jsonfileAfterDelete, null, 2);
    fs.writeFile(path, convert, (err) => {
        if (err) throw (err);
        console.log(`id ${id} deleted From ${path}`);
    });
}

updateJsonObject=(path,id,newObj)=>{
try{
    var storage = fs.readFileSync(path);
    var storageToJson = JSON.parse(storage);
    var jsonfileAfterDelete=storageToJson.filter((obj)=>{ 
        if(obj.id == id){
         obj.wareName=newObj.wareName;
         obj.groupName=newObj.groupName;
         obj.description=newObj.description;
         obj.cost=newObj.cost;
         obj.sale=newObj.sale;
         obj.quantity=newObj.quantity;
         obj.id=newObj.id;
        }
        return obj;
         });
    const convert = JSON.stringify(jsonfileAfterDelete, null, 2);
    fs.writeFile(path, convert, (err) => {
        if (err) throw (err);
        console.log(`id ${id} updated in ${path}`);
    });
}catch(e){
console.log("saver update error"+e);
}
}



module.exports = { saveToJson, readFromJson ,deleteFromJson,updateJsonObject};