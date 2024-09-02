# Minecraft Server on Docker with AWS

詳細は以下の記事を参照

https://qiita.com/nito_008/items/ce2be2bd872f30f4ab51

## ワールドを起動する

```shell
docker-compose up -d サービス名
```

## ワールドを停止する

```shell
docker-compose rm -fsv サービス名
```

## ワールドをバックアップする

```shell
bash backup_github.sh
```

## バックアップをcronで定期実行する

```shell
# cronをインストール
sudo yum install cronie -y
sudo systemctl enable crond.service
sudo systemctl start crond.service
# 例：一時間ごとにバックアップするよう設定
sudo crontab -e
0 * * * * bash ~/minecraft/scripts/backup_github.sh
sudo systemctl restart cron
```