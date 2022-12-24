const express=require("express");
const crypto = require("crypto");
const saver=require("../saver/saver");
const billRouter=express.Router();



billRouter.post("/user/bill/post-bill",async(req,res)=>{
    try{
        var { customer, billWares, time, total,id } = req.body;

        var _id=crypto.randomBytes(16).toString("hex");
         await saver.saveToJson(
             {customer, time, total,id:_id, billWares },
              "./db/user/bills.json");
 
         res.json({ id });

    }catch(e){
        res.status(500).json({error:e});
        console.log(e);
    }
});

module.exports=billRouter;