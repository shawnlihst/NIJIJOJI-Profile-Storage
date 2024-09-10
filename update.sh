#!/bin/bash

# 设置默认编码为UTF-8
export LANG=en_US.UTF-8

# 初始化变量，默认不执行复制
DoCopy=0

# 检测当前路径下是否有 git_source 文件夹
if [ ! -d "git_source" ]; then
    echo "git_source 文件夹不存在，正在创建并初始化..."
    mkdir git_source
    cd git_source
    git init
    git remote add origin https://github.com/shawnlihst/NIJIJOJI-Profile-Storage.git
    git pull origin main
    DoCopy=1
else
    echo "git_source 文件夹已存在，正在检查更新..."
    cd git_source
    git fetch origin main
    if ! git diff --quiet --exit-code master origin/main; then
        echo "有更新，正在拉取最新代码..."
        git merge FETCH_HEAD
        DoCopy=1
    else
        echo "已是最新版本，无需更新。"
    fi
fi
# 返回上一级文件夹
cd ..

# 根据变量DoCopy的值决定是否执行复制操作
if [ $DoCopy -eq 1 ]; then
    echo "正在更新配置文件到当前路径..."
    cp -r git_source/config .
    cp -r git_source/bukkit.yml .
    cp -r git_source/commands.yml .
    cp -r git_source/pufferfish.yml .
    cp -r git_source/spigot.yml .
    cp -r git_source/purpur.yml .
    cp -r git_source/start.sh .
    cp -r git_source/server.properties .
    cp -r git_source/plugins/Skript/scripts .
else
    echo "跳过复制操作。"
fi
