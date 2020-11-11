version ?= latest

build:
	go build -o ./out/backup-dashboards ./cmd/backup-dashboards/main.go
	go build -o ./out/backup-datasources ./cmd/backup-datasources/main.go
	go build -o ./out/import-dashboards ./cmd/import-dashboards/main.go
	go build -o ./out/import-datasources ./cmd/import-datasources/main.go

docker:
	docker build -t pchalamet/grafana-tools:$(version) .
