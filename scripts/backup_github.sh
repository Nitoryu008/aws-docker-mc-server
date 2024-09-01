#!/bin/bash

DATE=`date '+%Y-%m-%d %H:%M:%S %z'`

# docker-compose.ymlで設定したサービス名を指定
worlds=("mc-1" "mc-2")

cd ~/minecraft

bash ~/minecraft/scripts/minecraft.sh save-all

for world in ${worlds[@]}; do
  docker-compose exec $world rcon-cli "say バックアップ中..."
done

git add -A
git commit -m "$DATE"
git pull origin main --rebase
git push origin main

for world in ${worlds[@]}; do
  docker-compose exec $world rcon-cli "say バックアップ完了"
done