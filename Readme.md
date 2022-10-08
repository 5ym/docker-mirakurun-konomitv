# docker-mirakurun-konomitv

## 前提条件

- Docker, docker-compose の導入が必須
- ホスト上の pcscd は停止する
- チューナーのドライバが適切にインストールされていること

## インストール手順

```sh
curl -sf https://raw.githubusercontent.com/5ym/docker-mirakurun-konomitv/main/setup.sh | sh -s
cd docker-mirakurun-konomitv
# チャンネル設定
vim mirakurun/conf/channels.yml
# コメントアウトされている restart や user の設定を適宜変更する(そのままでも起動します)
vim docker-compose.yml
# konomitv自体の設定(こちらもそのままでも起動します)
vim konomitv/config.yaml
# 起動(初期設定ではhttp://localhost:7000でアクセスできます)
docker compose up -d
```

## チャンネルスキャン(取得漏れが出る場合もあるので注意)

```sh
curl -X PUT "http://localhost:40772/api/config/channels/scan?type=GR&setDisabledOnAdd=false&refresh=true"
curl -X PUT "http://localhost:40772/api/config/channels/scan?type=BS&setDisabledOnAdd=false&refresh=true"
curl -X PUT "http://localhost:40772/api/config/channels/scan?type=CS&setDisabledOnAdd=false&refresh=true"
```

mirakurunのEPG更新を待ってからブラウザでkonomitvを開き動作を確認する

## 停止

```sh
docker compose down
```

## 更新

```sh
# イメージの更新
docker compose pull
# 最新のイメージを元に起動
docker compose up -d
```
