prometheus = require("prometheus").init("prometheus_metrics")

http_requests = prometheus:counter(
    "nginx_http_requests", "Number of HTTP requests", {"host", "status"})
http_request_time = prometheus:histogram(
    "nginx_http_request_time", "HTTP request time", {"host"})
http_connections = prometheus:gauge(
    "nginx_http_connections", "Number of HTTP connections", {"state"})
http_upstream_cache_status = prometheus:counter(
    "nginx_http_upstream_cache_status", "Number of HTTP upstream cache status", {"host", "status"})
http_upstream_requests = prometheus:counter(
    "nginx_http_upstream_requests", "Number of HTTP upstream requests", {"addr", "status"})
http_upstream_response_time = prometheus:histogram(
    "nginx_http_upstream_response_time", "HTTP upstream response time", {"addr"})
http_upstream_connect_time = prometheus:histogram(
    "nginx_http_upstream_connect_time", "HTTP upstream connect time", {"addr"})
http_upstream_first_byte_time = prometheus:histogram(
    "nginx_http_upstream_first_byte_time", "HTTP upstream first byte time", {"addr"})
http_upstream_header_time = prometheus:histogram(
    "nginx_http_upstream_header_time", "HTTP upstream header time", {"addr"})
http_upstream_session_time = prometheus:histogram(
    "nginx_http_upstream_session_time", "HTTP upstream session time", {"addr"})
http_upstream_bytes_received = prometheus:counter(
    "nginx_http_upstream_bytes_received", "Number of HTTP upstream bytes received", {"addr"})
http_upstream_bytes_sent = prometheus:counter(
    "nginx_http_upstream_bytes_sent", "Number of HTTP upstream bytes sent", {"addr"})