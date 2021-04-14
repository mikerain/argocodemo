#!/bin/bash
echo "你输入了是项目：$1"

if [ $# != 1 ];then
  echo "请输入项目名"
　exit 1
fi

if [ -d "$1" ];then
  echo "项目已经存在,无法进行创建，请检查项目名"
  exit 1
fi

echo "创建$1目录.."
mkdir -p $1
cp template/* $1/

echo "替换配置...."
sed -i "s/XXXXX/$1/g" $1/*

echo "完成项目初始化,上传代码..."

git add .
git commit -m "add $1 project" .
git push origin main

echo "代码上传完成"
