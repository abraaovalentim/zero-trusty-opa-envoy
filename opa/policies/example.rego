package httpapi.authz

default allow = false

allow if {
    input.method == "GET"
    input.path == ["public"]
}

allow if {
    input.method == "POST"
    input.path == ["data"]
    input.user == "admin"
}