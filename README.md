# figma-designdoc 🐱‍👤🐱‍🐉

Export a simple website using a bunch of conventions and one or many Figma documents as the structure. We called this "design doc" because initially, we used it to export a design guideline, but we have been using it for many other things.

If you want to see an example, you can build this website using this Figma files as a base.

## Requirements

- You need RUBY to run this project. We recommend installing [rbenv](https://github.com/rbenv/rbenv#installation) for handling multiple versions. Make sure that at the end of the process you have ruby and gem installed. Gem is being shiped since version 1.9.
  You can check it by running `ruby -v` and `gem -v` in the terminal.
- Go to a library that is not the project library and install bundler. Run
  `gem install bundler`. Make sure it is available by running `bundle -v`. [More information](https://bundler.io/)

## Setting it up & running

1. Fork this repository

```
git clone https://github.com/mamuso/figma-designdoc.git
```

2. Get your [Figma Personal Access Token](https://www.figma.com/developers/docs#auth)
3. Create a `.env` file in the root directory.
4. Copy your token that you've created in the first step to `.env` in the following way:

```
FIGMATOKEN=xxxx-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

5. If you would like to keep it in the repository and you don't mind exposing your token you could add it to `_.config.yml` as well.

6. As a next step you need to add your document id to the `document` section. For getting the ID you have to go to FIGMA. Select a document. You are now redirect to the editor.
   The url should look similar to this: `https://www.figma.com/file/LS5LEaS634ZITxOpSpDBXEeG/` Copy ID that you see after the `/file/` part and place it documents like this:
   `document: LS5LEaS634ZITxOpSpDBXEeG`.

```yaml
figmaconfig:
  # we recommend to store your figma token in a .env ignored file
  token:
    xxxx-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    # scale corresponds with the scale parameter of https://www.figma.com/developers/docs#images-endpoint
  # value: from 0.01 to 4. We recommend 2 for crispy images on retina displays
  scale: 2
  format: png
  figmaurls: true
  home: true
  documents:
    - document: LS5LEaS634ZITxOpSpDBXEeG
      category: Components
```
7. Installing dependencies
```sh 
bundle install
```
8. Running a temporary server or creating a build.
```sh 
bundle exec jekyll serve
```

```
bundle exec jekyll build
```

## More about Jekyll

The project uses [Jekyll](https://jekyllrb.com/) and the [Figma Web API](https://www.figma.com/developers) to build a static site that you can deploy to your favorite hosting service.

We use custom plugins and `Jekyll::Hooks`, so we **can't** make it work as a Github Pages branch, but you can generate the site locally or with a CI system and push the result to your repository.

## Known issues
- When you have `xz` installed `nokogiri` might fail to install. Solution:
```sh
brew unlink xy
bundle install
brew link xy
```
- When you run the project it might take a while to download all the assets please be patient.
