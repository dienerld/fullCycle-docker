FROM golang:alpine as Build

WORKDIR /home/go/app

COPY . .

RUN CGO_ENABLED=0 go build -o main main.go

FROM scratch

COPY --from=Build /home/go/app/main .

CMD [ "main" ]
