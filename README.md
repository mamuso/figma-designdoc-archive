# figma-designdoc 🐱‍👤🐱‍🐉

## Caution! Floor slippery when wet


This repo is a work in progress, and it's not ready for the prime time, but if you want to use it you can! 

---

This plugin exports a simple website using a bunch of conventions and one or many Figma documents as the structure. We named the plugin "design doc" because initially, we used it to export a design guideline, but we have been using it for many other things.

If you want to see an example, you can build this website using this Figma files as a base.

## Setting it up

1. Fork this repository
2. Get your [Figma Personal Access Token](https://www.figma.com/developers/docs#auth) and put it in a .env file as FIGMATOKEN=xxxx-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx or, if you don't mind to expose your token 🤔, edit it on _config.yml
3. Edit the `figmaconfig` of the `_config.yml` file:

```yaml
figmaconfig:
  # we recommend to store your figma token in a .env ignored file
  token: xxxx-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

  # scale: corresponds with the scale parameter on https://www.figma.com/developers/docs#images-endpoint
  # value: from 0.01 to 4. 
  scale: 2

  # format: corresponds with the format parameter on https://www.figma.com/developers/docs#images-endpoint
  # value: png, jpg or svg
  format: png

  # figmaurls: boolean. When set to true, we show a link to the figma document close to the page title 
  # and a link to each frame rendered on the page
  figmaurls: true

  home: true
  documents:
    - document: aPDeXozOjVEEBVnRGP3gsm5B
      category: Components
```


## How it works

The project uses [Jekyll](https://jekyllrb.com/) and the [Figma Web API](https://www.figma.com/developers) to build a static site that you can deploy to your favorite hosting service.

We use custom plugins and `Jekyll::Hooks`, so we **can't**  make it work as a Github Pages branch, but you can generate the site locally or with a CI system and push the result to your repository.
