FROM alpine:latest
RUN apk add --no-cache curl
CMD ["sh", "-c", "while true; do curl -vk https://envoy:8443/; sleep 5; done"]