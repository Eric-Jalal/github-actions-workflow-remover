# GitHub Actions Workflow Remover
This small script helps the developers to remove workflows until GitHub people adds a feature for remove all

### Prerequisites
For using this script you need to have `jq` and `gh` already installed.

If you don't have `jq` installed you can install it using this link https://github.com/stedolan/jq/releases

Also for installing `gh` you can use this link https://github.com/cli/cli#installation

### Use instruction

First you need to be logged in through the `gh` CLI tool.

Clone the repository of yours (the one you want to access the GitHub Actions in them and delete the unused ones) or if you have it already on your local machine you need to go that directory.

Give permission like `chmod 777 main.sh` to the script and run it like `./main.sh` or `sh main` depending on what shell you're using.

e.g `cd <your-project>` . Then you need to have the downloaded [script](https://github.com/Jerilok/github-actions-workflow-remover/blob/main/main.sh) to your project root. (I will try to make nicer way for this soon, homebrew or something but this tool will not be needed in near future ¯\_(ツ)_/¯ ) .

Then for executing it you can run `./main.sh` and go through the instructions.

### Disclaimer
Use it under your own responsibility.
