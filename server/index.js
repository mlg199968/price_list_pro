const express=require("express");
const wareRouter=require("./routes/ware");
const customerRouter=require("./routes/customer");
const app=express();
//declerations
const PORT=3000;
const IP="192.168.1.3";
//middleware
app.use(express.json());
app.use(wareRouter);
app.use(customerRouter);

app.listen(PORT,IP,()=>{
    console.log(`Connected to port ${PORT}`);
});
app.get("/mlg-grand",function (req,res){res.send("this server is working")});


