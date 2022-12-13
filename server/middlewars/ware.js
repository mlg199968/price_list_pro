const jwt=require("jsonwebtoken");
const wares=require("../db/user/wares.json");
const crypto=require("crypto");

const ware= async (req,res,next)=>{
    console.log("ware middle ware runnig");
    id=crypto.randomBytes(16).toString("hex");
   var {wareName,cost,sale,id}=req.body;
var dbUser=wares.find((ware)=>ware.wareName==wareName);
if(dbUser){
    return res.status(401).json({msg:"ware exist with same name"});
}

next();
   
}
module.exports=ware;