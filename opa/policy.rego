package envoy.authz

default allow = false

allow {
    input.attributes.request.http.method == "GET"
    input.attributes.request.http.path == "/"
}