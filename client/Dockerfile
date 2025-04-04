FROM alpine:latest
RUN apk add --no-cache curl
CMD ["sh", "-c", "while true; do curl -X $REQUEST_METHOD http://envoy:8080/; sleep 15; done"]