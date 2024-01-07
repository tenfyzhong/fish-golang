abbr -a lgob CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
abbr -a wgob CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build
abbr -a tgob go build -gcflags "-N -l" -ldflags "-w"
abbr -a gob go build
abbr -a got go test -gcflags=all=-l -v -cover
abbr -a gog go get -u
abbr -a gom go mod
abbr -a goc go clean
abbr -a goi go install
abbr -a gor go run
abbr -a gow go work
