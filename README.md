# zero-trusty-opa-envoy
Um projeto demonstrando a implementação de políticas de segurança Zero Trust usando Open Policy Agent (OPA) como motor de decisão e Envoy Proxy como gateway de API.

### Pré Requisitos:
- Docker
- Docker Compose
- Curl

### Instalação Rapida
1. Clone o repositorio
  ```bash
  git clone https://github.com/abraaovalentim/zero-trusty-opa-envoy.git
  cd zero-trusty-opa-envoy
  ```
2. Dê as devidas permições
  ```bash
  chmod +x ratelimit/entrypoint.sh
  chmod +x test.sh
  ```
3. Inicie os serviços
  ```bash
  docker compose up --build
  ```
Esperados:
| Serviço              | Porta | Descrição                          |
|----------------------|-------|------------------------------------|
| Envoy                | 8080  | Gateway de API                     |
| Rate Limit Envoy     | 6379  | Armazenamento para rate limiting   |
| OPA                  | 8181  | Motor de políticas                 |
| Backend              | 8000  | Aplicação de exemplo               |
| Redis                | 6379  | Armazenamento para rate limiting   |

### Como testar:
1. Gateway Envoy
  ```bash
  # Requisição bloqueada na rota do backend
  curl -v http://localhost:8000

  # Requisição autorizada na rota do envoy
  curl -v http://localhost:8080
  ```
2. Rate Limit
  ```bash
  for i in {1..10}; do curl -v http://localhost:8080; done
  ```
3. OPA
  ```bash
  ./test.sh
  ```
- Se quiser mais informações sobre os testes para o OPA, visitar o codigo de test que contem uma pequena explicação.
