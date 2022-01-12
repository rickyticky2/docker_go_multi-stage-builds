FROM golang:latest as build
COPY . .
RUN go build ./src/main.go

FROM alpine:latest as production
COPY --from=build /go/main .
CMD ["./main"]
