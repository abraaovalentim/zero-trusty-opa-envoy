FROM openpolicyagent/opa:latest

COPY policies /policies

CMD ["run", "--server", "--addr", ":8181", "/policies/example.rego"]