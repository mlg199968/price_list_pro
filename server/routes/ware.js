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

//get wares from db
wareRouter.get("/ware/get-wares", async (req, res) => {
    var waresList = saver.readFromJson("./db/user/wares.json");
    res.json(waresList);

});


module.exports = wareRouter;