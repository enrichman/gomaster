#!/bin/bash

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

repos=$(find $GOPATH -name .git -type d -prune -exec dirname {} \;)

err_repos_path=()
err_repos=()

echo

for repo in $repos; do
    cd $repo
    remote=$(git config --get remote.origin.url)

    printf "${GREEN}====================   Refreshing   =======================${NC}\n"
    if [ -z $remote ]; then
        printf "${RED}Missing remote for repo in: %s${NC}\n" $repo
    else
        printf "${GREEN}===\n" $remote
        printf "===     ${NC} %s\n" $remote
        printf "${GREEN}===\n"
        printf "===========================================================${NC}\n" $remote

        if [ -f .gitmodules ]; then
            result=$(git submodule update --init --recursive)
            if [[ -n $result ]]; then
                printf "${CYAN}\n -> Updating git submodules\n\n${NC}"
            fi
            echo $result
        fi

        # Working tree is dirty
        if [[ -n $(git status -s) ]]; then

            printf "${RED}\n -> ERROR: Working tree is dirty!\n${NC}"
            err_repos_path+=($repo)
            err_repos+=($remote)
            echo

        else

            printf "${CYAN}\n -> Checking out master\n\n${NC}"
            git checkout master
            echo

            printf "${CYAN} -> Pulling\n\n${NC}"
            git pull
            echo
            
        fi
    fi
done

if [ -n "$err_repos" ]; then
    printf "${RED}==============================================${NC}\n"
    printf "Found some dirty working trees. Please have a look.\n\n"

    for i in ${!err_repos[@]}; do
        printf "  - %s    => %s\n" ${err_repos[$i]} ${err_repos_path[$i]}
    done
    echo
    printf "${RED}==============================================${NC}\n"
fi
