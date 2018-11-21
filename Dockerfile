FROM golang:1.11.2 as builder

RUN go get -u github.com/alecthomas/gometalinter && gometalinter --install && \
  go get -u mvdan.cc/sh/cmd/shfmt \
    mvdan.cc/unindent \
    stathat.com/c/splint \
    github.com/pavius/impi/cmd/impi \
    github.com/bradleyfalzon/apicompat/cmd/apicompat \
    github.com/m3db/build-tools/linters/badtime \
    github.com/hypnoglow/durcheck \
    github.com/THE108/enumlinter \
    github.com/kyoh86/scopelint \
    github.com/alexkohler/prealloc \
    github.com/remyoudompheng/go-misc/deadcode \
    github.com/nishanths/predeclared \
    github.com/elliotchance/ghost \
    github.com/go-critic/go-critic/...

FROM golang:1.11.2
COPY --from=builder /go/bin/* /usr/bin/

WORKDIR /go
