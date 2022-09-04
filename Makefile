.DEFAULT_GOAL: build

DIST_DIR := $(GOPATH)/dist/tattle
BUILD_DIR := .build

.PHONY: build
build:
	go build -o $(BUILD_DIR)/tattle github.com/scottbrown/tattle

.PHONY: test
test:
	go test ./...

# only works on Linux/EC2 machines
.PHONY: e2e-test
e2e-test:
	PAM_TYPE=open_session PAM_USER=johndoe PAM_RHOST=office ./tattle

.PHONY: dist
dist:
	GOOS=linux GOARCH=amd64 go build -o $(DIST_DIR)/linux/amd64/tattle github.com/scottbrown/tattle
	tar cfz $(DIST_DIR)/tattle.linux-amd64.tgz -C $(DIST_DIR)/linux/amd64 tattle
