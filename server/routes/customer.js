const express=require("express");
const customerRouter=express.Router();
customer=require("../middlewars/customer");
const saver=require("../saver/saver");



//store Customer to db
customerRouter.post("/user/customers",customer,async(req,res)=>{
    try{
        const {firstName,lastName,nickName,phoneNumber,description}=req.body;
        saver.saveToJson(req.body,"./db/user/customer.json");
        res.json({msg:"successfully added"});
    }catch(e){
        res.status(500).json({error:e});
      }
   
});
module.exports=customerRouter;