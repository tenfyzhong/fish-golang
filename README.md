# fish-golang
golang abbr and tools.

# Install
Install using Fisher(or other plugin manager):
```
fisher install tenfyzhong/fish-golang
```

# Introductions
## abbr
| abbr   | description                                        |
|--------|----------------------------------------------------|
| `lgob` | `CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build`   |
| `wgob` | `CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build` |
| `tgob` | `go build -gcflags "-N -l" -ldflags "-w"`          |
| `gob`  | `go build`                                         |
| `got`  | `go test -gcflags=all=-l`                          |
| `gog`  | `go get -u`                                        |
| `gom`  | `go mod`                                           |
| `goc`  | `go clean`                                         |
| `goi`  | `go install`                                       |
| `gor`  | `go run`                                           |
| `gow`  | `go work`                                          |

## tools
| tools     | usage          | description                                  |
|-----------|----------------|----------------------------------------------|
| `goclone` | goclone <url>  | clone repo to `$GOPATH`                      |
| `gocd`    | gocd <package> | cd to the package directory, it can be a url |
