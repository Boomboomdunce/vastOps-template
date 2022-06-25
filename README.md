# VastOps Templates

This repo assists Vast's users in deploying infrastructure through the Ops method, see the [issue](https://github.com/GTrunSec/threatbus2nix/pull/16) get more information.

>Only the operator host required nix, and make sure you have enabled the ssh service on your deploy target host. The target host doesn't need to install any dependencies.

# Required files


| files            |                                     |
|------------------|-------------------------------------|
| config.toml      | hosts's information                 |
| deploy-nodes.env | env variables for deploying process |
|                  |                                     |


## Create your custom profile for deploying.

1. `mkdir -p ./profiles/<name>`

2. cp the required files to your specific profile directory, and modify those files to your expectation.

## Env variables

### Deployment

``` sh
# can be  [ "vast-bin" "vast-release" "vast-latest"]
VERSION=vast-bin

HOST1=root@192.168.122.126
SSH_OPT1="-p 22 -o StrictHostKeyChecking=no"

HOST2=root@192.168.122.212
SSH_OPT2="-p 22 -o StrictHostKeyChecking=no"
```


# Command Actions

- example to `profiles/test` 
``` sh
nix run -Lv /home/gtrun/ghq/github.com/GTrunSec/vast2nix\#x86_64-linux.workflows.entrypoints.deploy \--override-input lock ./profiles/test -- --env-file=./profiles/test/deploy-nodes.env -t env

```

- user interface:

``` sh
nix run -Lv /home/gtrun/ghq/github.com/GTrunSec/vast2nix\#x86_64-linux.workflows.entrypoints.deploy \--override-input lock ./<profiles-dir> -- --env-file=<profiles-dir>/<env-file> -t <task-name>

```

- display documentation for the current command/action

<div align="center">
  <img src="https://github.com/gtrunsec/vastOps-template/raw/main/attach/show-doc-command.png" width="350" />
</div>


``` sh
nix run -Lv /home/gtrun/ghq/github.com/GTrunSec/vast2nix\#x86_64-linux.workflows.entrypoints.deploy \--override-input lock ./<profiles-dir> -- doc
```
