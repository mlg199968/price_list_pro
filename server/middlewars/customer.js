const customerFilePath = require("../db/user/customer.json");

customer = async (req, res, next) => {
    const { firstName, lastName, nickName, phoneNumber } = req.body;
    var userDb = customerFilePath.find((cusm) => (cusm.firstName == firstName && cusm.lastName == lastName),);
    if (userDb) {
        return res.status(401).json({ msg: "Customer exist with same data" });
    }
    next();
}
module.exports = customer;