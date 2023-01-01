const express = require("express");
const crypto = require("crypto");
const wareRouter = express.Router();
const ware = require("../middlewars/ware");
const saver = require("../saver/saver.js");

//Post ware on db
wareRouter.post("/user/ware/post", ware, async (req, res) => {
    try {
        var { wareName, unit, group, description, cost, sale, quantity, id } = req.body;

       var _id=crypto.randomBytes(16).toString("hex");
        await saver.saveToJson(
            {wareName, unit, group, description, cost, sale, quantity, id:_id },
             "./db/user/wares.json");

        res.json({ id });
    } catch (e) {
        res.status(500).json({ "error": e });
        console.log(e);
    }
});

//read wares from db
wareRouter.get("/user/ware/get-wares", async (req, res) => {
    var waresList = saver.readFromJson("./db/user/wares.json");
    res.json(waresList);

});

//delete ware 
wareRouter.post("/user/ware/delete-ware",async (req,res)=>{
try{
    const {id}=req.body;
saver.deleteFromJson("./db/user/wares.json",id);
res.json({msg:"deleted Successfully"});
}catch(e){
res.status(500).json({error:e});
console.log(e);
}
});

//upadte ware
wareRouter.post("/user/ware/update-ware",async (req,res)=>{
    try{
        const {wareName,unit,sale,cost,group,description,quantity,id}=req.body;
    saver.updateJsonObject("./db/user/wares.json",id,{wareName,unit,sale,cost,group,description,quantity,id});
    res.json({msg:"update Successfully"});
    }catch(e){
    res.status(500).json({error:e});
    console.log(e);
    }
    });

module.exports = wareRouter;