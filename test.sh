echo "Teste GET /public:"
curl -s -X POST http://localhost:8181/v1/data/httpapi/authz/allow \
  -H "Content-Type: application/json" \
  -d '{"input": {"method": "GET", "path": ["public"]}}' | jq

echo -e "\nTeste POST /data como admin:"
curl -s -X POST http://localhost:8181/v1/data/httpapi/authz/allow \
  -H "Content-Type: application/json" \
  -d '{"input": {"method": "POST", "path": ["data"], "user": "admin"}}' | jq

echo -e "\nTeste POST /data como guest:"
curl -s -X POST http://localhost:8181/v1/data/httpapi/authz/allow \
  -H "Content-Type: application/json" \
  -d '{"input": {"method": "POST", "path": ["data"], "user": "guest"}}' | jq