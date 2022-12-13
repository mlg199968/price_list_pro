const express=require("express");
const crypto=require("crypto");
const customerRouter=express.Router();
customer=require("../middlewars/customer");
const saver=require("../saver/saver");



//store Customer to db
customerRouter.post("/user/customers",customer,async(req,res)=>{
    try{
        var {firstName,lastName,nickName,phoneNumber,description,id}=req.body;
        var _id=crypto.randomBytes(16).toString("hex");
        saver.saveToJson({firstName,lastName,nickName,phoneNumber,description,id:_id},"./db/user/customer.json");
        res.json({msg:"successfully added"});
    }catch(e){
        res.status(500).json({error:e});
      }
   
});

//get customer list for client

customerRouter.get("/user/get-customers",async(req,res)=>{
var customerList=saver.readFromJson("./db/user/customer.json");
res.json(customerList);
});
module.exports=customerRouter;