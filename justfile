dev := "nix run -Lv /home/gtrun/ghq/github.com/GTrunSec/vast2nix"
url := "nix run -Lv github:gtrunsec/vast2nix/"
rev := "dd686a45ffca65350cabc3ff0be59baea16144eb"
# [ "x86-64-darwin" ]
system := "#x86_64-linux"
deploy := ".user.entrypoints.deploy --refresh --override-input lock"
config := ".user.entrypoints.config --refresh --override-input lock"

# just deploy test '--env-file=./profiles/test/deploy.env -t all'
# just deploy <profile-name> '--env-file=./profiles/test/deploy.env -t all'
deploy arg1 arg2:
    {{url}}{{system}}{{deploy}} ./profiles/{{arg1}} -- {{arg2}}

config arg1 arg2:
    {{url}}{{system}}{{config}} ./profiles/{{arg1}} -- {{arg2}}

dev-deploy arg1 arg2:
    {{dev}}{{system}}{{deploy}} $PRJ_ROOT/profiles/{{arg1}} -- --env-file=$PRJ_ROOT/profiles/{{arg1}}/deploy.env -t {{arg2}}

dev-config arg1 arg2:
    {{dev}}{{system}}{{config}} $PRJ_ROOT/profiles/{{arg1}} -- {{arg2}}

# example:
# lock-rev arg1 arg2:
#     {{url}}{{rev}}{{system}}{{config}} ./profiles/{{arg1}} -- {{arg2}}
