# figma-designdoc 🐱‍👤🐱‍🐉

## Caution! Floor slippery when wet


This repo is a work in progress, and it's not ready for the prime time, but if you want to use it you can! 

---

This plugin exports a simple website using a bunch of conventions and one or many Figma documents as the structure. We named the plugin "design doc" because initially, we used it to export a design guideline, but we have been using it for many other things.

If you want to see an example, you can build this website using this Figma files as a base.

## Setting it up

1. Fork this repository
2. Get your [Figma Personal Access Token](https://www.figma.com/developers/docs#auth) and put it in a .env file as FIGMATOKEN=xxxx-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx or, if you don't mind to expose your token 🤔, edit it on _config.yml
3. Edit the `_config.yml` file

## How it works

The project uses [Jekyll](https://jekyllrb.com/) and the [Figma Web API](https://www.figma.com/developers) to build a static site that you can deploy to your favorite hosting service.

We use custom plugins and `Jekyll::Hooks`, so we **can't**  make it work as a Github Pages branch, but you can generate the site locally or with a CI system and push the result to your repository.
