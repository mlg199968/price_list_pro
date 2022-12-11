const express = require("express");
const wareRouter = express.Router();
const ware = require("../middlewars/ware");
const saver = require("../saver/saver.js");

//Post ware on db
wareRouter.post("/user/ware/post", ware, async (req, res) => {
    try {
        const { wareName, unit, group, description, cost, sale, quantity, id } = req.body;
        await saver.saveToJson(req.body,"./db/user/wares.json");
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