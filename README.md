# Nginx Prometheus Metrics

[![Docker Repository on Quay](https://quay.io/repository/hnlq715/nginx-prometheus-metrics/status "Docker Repository on Quay")](https://quay.io/repository/hnlq715/nginx-prometheus-metrics)
![Docker Pulls](https://img.shields.io/docker/pulls/sophos/nginx-prometheus-metrics.svg)

A simple demo to collect prometheus metrics for nginx.

[Docker Hub: sophos/nginx-prometheus-metrics](https://hub.docker.com/r/sophos/nginx-prometheus-metrics)

## Why use nginx_prometheus_metrics
This is absolutely a good question, but please just try it before you ask.

## How to build

```
docker build -t nginx_prometheus_metrics .
```

## How to run

```
docker pull sophos/nginx-prometheus-metrics
docker run -d --rm -it -p 80:80 -p 1314:1314 -p 9527:9527 sophos/nginx-prometheus-metrics
```

Visit [http://localhost:1314](http://localhost:1314) to generate some test metrics.

Then visit [http://localhost:9527/metrics](http://localhost:9527/metrics) in your browser(safari/chrome).

And you will see the prometheus output below:
```
# HELP nginx_http_connections Number of HTTP connections
# TYPE nginx_http_connections gauge
nginx_http_connections{state="active"} 1
nginx_http_connections{state="reading"} 0
nginx_http_connections{state="waiting"} 0
nginx_http_connections{state="writing"} 1
# HELP nginx_http_request_time HTTP request time
# TYPE nginx_http_request_time histogram
nginx_http_request_time_bucket{host="localhost",le="03.000"} 1
nginx_http_request_time_bucket{host="localhost",le="04.000"} 1
nginx_http_request_time_bucket{host="localhost",le="05.000"} 1
nginx_http_request_time_bucket{host="localhost",le="10.000"} 1
nginx_http_request_time_bucket{host="localhost",le="+Inf"} 1
nginx_http_request_time_bucket{host="testservers",le="00.005"} 1
nginx_http_request_time_bucket{host="testservers",le="00.010"} 1
nginx_http_request_time_bucket{host="testservers",le="00.020"} 1
nginx_http_request_time_bucket{host="testservers",le="00.030"} 1
nginx_http_request_time_bucket{host="testservers",le="00.050"} 1
nginx_http_request_time_bucket{host="testservers",le="00.075"} 1
nginx_http_request_time_bucket{host="testservers",le="00.100"} 1
nginx_http_request_time_bucket{host="testservers",le="00.200"} 1
nginx_http_request_time_bucket{host="testservers",le="00.300"} 1
nginx_http_request_time_bucket{host="testservers",le="00.400"} 1
nginx_http_request_time_bucket{host="testservers",le="00.500"} 1
nginx_http_request_time_bucket{host="testservers",le="00.750"} 1
nginx_http_request_time_bucket{host="testservers",le="01.000"} 1
nginx_http_request_time_bucket{host="testservers",le="01.500"} 1
nginx_http_request_time_bucket{host="testservers",le="02.000"} 1
nginx_http_request_time_bucket{host="testservers",le="03.000"} 1
nginx_http_request_time_bucket{host="testservers",le="04.000"} 1
nginx_http_request_time_bucket{host="testservers",le="05.000"} 1
nginx_http_request_time_bucket{host="testservers",le="10.000"} 1
nginx_http_request_time_bucket{host="testservers",le="+Inf"} 1
nginx_http_request_time_count{host="localhost"} 1
nginx_http_request_time_count{host="testservers"} 1
nginx_http_request_time_sum{host="localhost"} 2.0099999904633
nginx_http_request_time_sum{host="testservers"} 0
# HELP nginx_http_requests Number of HTTP requests
# TYPE nginx_http_requests counter
nginx_http_requests{host="localhost",status="200"} 1
nginx_http_requests{host="testservers",status="200"} 1
# HELP nginx_http_upstream_connect_time HTTP upstream connect time
# TYPE nginx_http_upstream_connect_time histogram
nginx_http_upstream_connect_time_bucket{addr="10.12.13.14:80",le="03.000"} 1
nginx_http_upstream_connect_time_bucket{addr="10.12.13.14:80",le="04.000"} 1
nginx_http_upstream_connect_time_bucket{addr="10.12.13.14:80",le="05.000"} 1
nginx_http_upstream_connect_time_bucket{addr="10.12.13.14:80",le="10.000"} 1
nginx_http_upstream_connect_time_bucket{addr="10.12.13.14:80",le="+Inf"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.005"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.010"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.020"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.030"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.050"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.075"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.100"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.200"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.300"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.400"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.500"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="00.750"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="01.000"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="01.500"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="02.000"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="03.000"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="04.000"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="05.000"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="10.000"} 1
nginx_http_upstream_connect_time_bucket{addr="127.0.0.1:80",le="+Inf"} 1
nginx_http_upstream_connect_time_count{addr="10.12.13.14:80"} 1
nginx_http_upstream_connect_time_count{addr="127.0.0.1:80"} 1
nginx_http_upstream_connect_time_sum{addr="10.12.13.14:80"} 2.006
nginx_http_upstream_connect_time_sum{addr="127.0.0.1:80"} 0
# HELP nginx_http_upstream_header_time HTTP upstream header time
# TYPE nginx_http_upstream_header_time histogram
nginx_http_upstream_header_time_bucket{addr="10.12.13.14:80",le="03.000"} 1
nginx_http_upstream_header_time_bucket{addr="10.12.13.14:80",le="04.000"} 1
nginx_http_upstream_header_time_bucket{addr="10.12.13.14:80",le="05.000"} 1
nginx_http_upstream_header_time_bucket{addr="10.12.13.14:80",le="10.000"} 1
nginx_http_upstream_header_time_bucket{addr="10.12.13.14:80",le="+Inf"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.005"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.010"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.020"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.030"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.050"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.075"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.100"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.200"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.300"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.400"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.500"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="00.750"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="01.000"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="01.500"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="02.000"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="03.000"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="04.000"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="05.000"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="10.000"} 1
nginx_http_upstream_header_time_bucket{addr="127.0.0.1:80",le="+Inf"} 1
nginx_http_upstream_header_time_count{addr="10.12.13.14:80"} 1
nginx_http_upstream_header_time_count{addr="127.0.0.1:80"} 1
nginx_http_upstream_header_time_sum{addr="10.12.13.14:80"} 2.006
nginx_http_upstream_header_time_sum{addr="127.0.0.1:80"} 0.004
# HELP nginx_http_upstream_requests Number of HTTP upstream requests
# TYPE nginx_http_upstream_requests counter
nginx_http_upstream_requests{addr="10.12.13.14:80",status="504"} 1
nginx_http_upstream_requests{addr="127.0.0.1:80",status="200"} 1
# HELP nginx_http_upstream_response_time HTTP upstream response time
# TYPE nginx_http_upstream_response_time histogram
nginx_http_upstream_response_time_bucket{addr="10.12.13.14:80",le="03.000"} 1
nginx_http_upstream_response_time_bucket{addr="10.12.13.14:80",le="04.000"} 1
nginx_http_upstream_response_time_bucket{addr="10.12.13.14:80",le="05.000"} 1
nginx_http_upstream_response_time_bucket{addr="10.12.13.14:80",le="10.000"} 1
nginx_http_upstream_response_time_bucket{addr="10.12.13.14:80",le="+Inf"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.005"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.010"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.020"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.030"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.050"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.075"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.100"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.200"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.300"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.400"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.500"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="00.750"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="01.000"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="01.500"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="02.000"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="03.000"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="04.000"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="05.000"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="10.000"} 1
nginx_http_upstream_response_time_bucket{addr="127.0.0.1:80",le="+Inf"} 1
nginx_http_upstream_response_time_count{addr="10.12.13.14:80"} 1
nginx_http_upstream_response_time_count{addr="127.0.0.1:80"} 1
nginx_http_upstream_response_time_sum{addr="10.12.13.14:80"} 2.006
nginx_http_upstream_response_time_sum{addr="127.0.0.1:80"} 0.004
# HELP nginx_metric_errors_total Number of nginx-lua-prometheus errors
# TYPE nginx_metric_errors_total counter
nginx_metric_errors_total 0
```
