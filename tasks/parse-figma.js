const fs = require("fs");
const https = require("https");

// Reading config.json
const jsonConfig = JSON.parse(fs.readFileSync("config.json"));

// Return json from Figma
const requestDocument = id => {
  const options = {
    host: "api.figma.com",
    path: `/v1/files/"${id}`,
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      "X-FIGMA-TOKEN": jsonConfig.figmaToken
    }
  };

  const req = https.request(options, function(res) {
    res.setEncoding("utf8");
    res.on("data", function(body) {});
  });

  req.end();
};
