Nginx Prometheus Metrics
===
A simple demo to collect prometheus metrics for nginx.

How to run
---

```
docker pull sophos/nginx_prometheus_metrics
docker run -d -i -p 80:80 -p 9527:9527 sophos/nginx_prometheus_metrics
```

Visit [http://localhost:9527/metrics](http://localhost:9527/metrics) in your browser(safari/chrome).

And you will see the prometheus output:
```
# HELP nginx_http_connections Number of HTTP connections
# TYPE nginx_http_connections gauge
nginx_http_connections{state="active"} 1
nginx_http_connections{state="reading"} 0
nginx_http_connections{state="waiting"} 0
nginx_http_connections{state="writing"} 1
# HELP nginx_metric_errors_total Number of nginx-lua-prometheus errors
# TYPE nginx_metric_errors_total counter
nginx_metric_errors_total 0
```
How to build
---

```
docker build -t nginx_prometheus_metrics .
```

Why use nginx_prometheus_metrics
---
This is absolutely a good question, but please just try it before you ask.