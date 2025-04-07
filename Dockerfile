FROM golang:1.24 AS builder


WORKDIR /build

COPY . .
RUN go get
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o album-api .

FROM alpine:3.14

WORKDIR /app

COPY --from=builder /build/album-api ./album-api
RUN chmod +x ./album-api
CMD [ "/app/album-api" ]
