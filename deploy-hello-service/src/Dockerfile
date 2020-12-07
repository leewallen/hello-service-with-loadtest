FROM golang:1.14-alpine AS build

WORKDIR /src/
COPY ./main.go /src/
RUN CGO_ENABLED=0 go build -o /bin/hello

FROM scratch
COPY --from=build /bin/hello /bin/hello
EXPOSE 80
ENTRYPOINT ["/bin/hello"]

