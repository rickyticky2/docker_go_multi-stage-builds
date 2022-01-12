FROM golang:latest as build
COPY . bin/
RUN cd bin/ && go mod download && CGO_ENABLED=0 go build

FROM alpine:latest as production
WORKDIR /app
COPY --from=build /go/bin/go-sample-app .
CMD ["./go-sample-app"]
