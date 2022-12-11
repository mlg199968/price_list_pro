const jwt=require("jsonwebtoken");
const wares=require("../db/user/wares.json");

const ware= async (req,res,next)=>{
    console.log("ware middle ware runnig");
   const {wareName,cost,sale}=req.body;
   
var dbUser=wares.find((ware)=>ware.wareName==wareName);
if(dbUser){
    return res.status(401).json({msg:"ware exist with same name"});
}
next();
   
}
module.exports=ware;