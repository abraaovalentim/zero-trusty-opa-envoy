package envoy.authz

default allow = false

allow if {
    input.method == "GET"
}

