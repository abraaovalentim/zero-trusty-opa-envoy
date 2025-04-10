#!/bin/bash
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

# Permite todos os GETs, enquanto os POSTs são permitidos apenas para o admin. O opa recebe um json com o método, o caminho e o usuário. O opa retorna um json com a permissão (allow ou deny) e a razão (reason).
# Idealmente, o Envoy recebe uma requisição, processa a mesma e gera o Json para enviar ao OPA. Apos isso, o OPA retorna a permissão e a razão. O Envoy então decide se deve permitir ou negar a requisição.
# O Envoy deve ser configurado para enviar o Json para o OPA. O OPA deve ser configurado para retornar a permissão e a razão. O Envoy deve ser configurado para permitir ou negar a requisição com base na resposta do OPA.