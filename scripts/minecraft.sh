#!/bin/bash

MCDIR="~/minecraft"
worlds=("mc-1" "mc-2")

# 全てのワールドを起動
start() {
  cd "$MCDIR"
  docker-compose up -d
}

# 全てのワールドを停止
stop() {
  cd "$MCDIR"
  docker-compose down
}

# 全てのワールドを保存
saveAll() {
  cd "$MCDIR"
  for world in ${worlds[@]}; do
    docker-compose exec $world rcon-cli save-all
  done
}

case "$1" in
save-all)
  saveAll
  sleep 30
  ;;
start)
  start
  ;;
stop)
  stop
  ;;
*)
  echo $"Usage: $0 {start|stop|save-all}"
  ;;
esac