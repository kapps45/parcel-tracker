FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o parcel-tracker .

FROM alpine:3.19

WORKDIR /app

COPY --from=builder /app/parcel-tracker .

CMD ["./parcel-tracker"]
