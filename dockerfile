FROM golang:latest as build
COPY . bin/
RUN cd bin/ && go mod download && go build

FROM alpine:latest as production
COPY --from=build /go/bin/go-sample-app .
CMD ["./go-sample-app"]
