exports = module.exports = {};
const fetch = require("node-fetch");

exports.getDocument = async (id, token) => {
  const data = fetch(`https://api.figma.com/v1/files/${id}`, {
    headers: {
      "Content-Type": "application/json",
      "X-FIGMA-TOKEN": token
    }
  }).then(res => res.json());

  return data;
};
