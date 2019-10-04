#!/bin/bash

. $( dirname "${BASH_SOURCE[0]}" )/assert.sh
. $( dirname "${BASH_SOURCE[0]}" )/../bash/bash_profile

truncation="⋯ "

assert "__promptline_cwd /" "/"
assert "__promptline_cwd /one" "/one"
assert "__promptline_cwd /one/two/three" "/one/two/three"
assert "__promptline_cwd /one/two/three/four" "/one/two/three/four"
assert "__promptline_cwd /one/two/three/four/five" "/$truncation/three/four/five"

# $HOME should act like a root
assert "__promptline_cwd $HOME" "~"
assert "__promptline_cwd $HOME/one" "~/one"
assert "__promptline_cwd $HOME/one/two/three" "~/one/two/three"
assert "__promptline_cwd $HOME/one/two/three/four" "~/one/two/three/four"
assert "__promptline_cwd $HOME/one/two/three/four/five" "~/$truncation/three/four/five"
assert "__promptline_cwd $HOME/dev" "~/dev"
assert "__promptline_cwd $HOME/dev/category" "~/dev/category"

# $HOME/dev/cateogry/project should act like a root
assert "__promptline_cwd $HOME/dev/category/project" "project"
assert "__promptline_cwd $HOME/dev/category/project/one" "project/one"
assert "__promptline_cwd $HOME/dev/category/project/one/two" "project/one/two"
assert "__promptline_cwd $HOME/dev/category/project/one/two/three" "project/one/two/three"
assert "__promptline_cwd $HOME/dev/category/project/one/two/three/four" "project/one/two/three/four"
assert "__promptline_cwd $HOME/dev/category/project/one/two/three/four/five" "project/$truncation/three/four/five"

# regressions

assert "__promptline_cwd \"$HOME/Library/Application Support\"" "~/Library/Application Support"

assert_end examples
