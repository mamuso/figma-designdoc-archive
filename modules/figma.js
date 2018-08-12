exports = module.exports = {};
const https = require("https");

exports.getDocument = (id, token) => {
  const options = {
    host: "api.figma.com",
    path: `/v1/files/${id}`,
    headers: {
      "Content-Type": "application/json",
      "X-FIGMA-TOKEN": token
    }
  };
  test = "";
  const req = https.get(options, function(res) {
    res.setEncoding("utf8");
    res.on("data", body => {
      console.log(body);
    });
    req.on("error", e => {
      console.error(`problem with request: ${e.message}`);
    });
  });

  req.end();
};
