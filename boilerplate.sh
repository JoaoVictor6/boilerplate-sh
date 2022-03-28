#!/bin/sh
GREEN='\033[0;32m'
NC='\033[0m'

repo_url=$1
folder_dir=$2
package_type=${3:-"npm"}
current_dir="$(pwd)/$folder_dir"

echo "$GREEN""Cloning repository: $repo_url $NC"

git clone --depth 1 $repo_url $current_dir
cd $current_dir
rm -rf .git
git init

[ $package_type != "yarn" ] && {
  npm ci
  exit 0
} || {
  yarn
  exit 0
}
