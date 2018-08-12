const fs = require("fs");

// Reading config.json
const config = fs.readFileSync("config.json");
const jsonConfig = JSON.parse(config);
