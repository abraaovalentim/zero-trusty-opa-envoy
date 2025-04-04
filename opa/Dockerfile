FROM openpolicyagent/opa:latest
COPY policy.rego /policy.rego
CMD ["run", "--server", "--log-level=debug", "/policy.rego"]
