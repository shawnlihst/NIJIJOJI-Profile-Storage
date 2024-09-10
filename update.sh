#!/bin/bash

# 设置默认编码为UTF-8
export LANG=en_US.UTF-8

# 初始化变量，默认不执行复制
DoCopy=0

# 检测当前路径下是否有 git_source 文件夹
if [ ! -d "git_source" ]; then
    echo "git_source 文件夹不存在，正在创建并初始化..."
    mkdir git_source
    cd git_source || exit 1  # 如果cd失败，则退出脚本

    git init
    if [ $? -ne 0 ]; then
        echo "git init 失败，终止操作。"
        exit 1
    fi

    git remote add origin https://github.com/shawnlihst/NIJIJOJI-Profile-Storage.git
    if [ $? -ne 0 ]; then
        echo "git remote add 失败，终止操作。"
        exit 1
    fi

    git pull origin main
    if [ $? -ne 0 ]; then
        echo "git pull 失败，终止操作。"
        exit 1
    fi
    DoCopy=1
else
    echo "git_source 文件夹已存在，正在检查更新..."
    cd git_source || exit 1  # 如果cd失败，则退出脚本

    git fetch origin main
    if [ $? -ne 0 ]; then
        echo "git fetch 失败，终止操作。"
        exit 1
    fi

    if ! git diff --quiet --exit-code master origin/main; then
        echo "有更新，正在拉取最新代码..."
        git merge FETCH_HEAD
        if [ $? -ne 0 ]; then
            echo "git merge 失败，终止操作。"
            exit 1
        fi
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
