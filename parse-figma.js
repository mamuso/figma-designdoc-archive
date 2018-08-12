const fs = require("fs");
const figma = require("./modules/figma.js");

// Reading config.json
const jsonConfig = JSON.parse(fs.readFileSync("config.json"));

// Looping documents
for (var doc of jsonConfig.documents) {
  console.log(figma.getDocument(doc, jsonConfig.figmaToken));
}
