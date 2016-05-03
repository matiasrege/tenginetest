# Test Tengine

##Build
```bash
docker build -t tenginetest .
```

##Run
```bash
docker run -t -i -v `pwd`:/app tenginetest bash
```

##Test
Inside the container

```bash
/opt/nginx/sbin/nginx -c /app/nginx.conf

curl 127.0.0.1:8080/foo -v
```

##Error

```bash
root@0d72ec5d8e67:/app# curl 127.0.0.1:8080/foo -v
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to 127.0.0.1 (127.0.0.1) port 8080 (#0)
> GET /foo HTTP/1.1
> User-Agent: curl/7.35.0
> Host: 127.0.0.1:8080
> Accept: */*
> 
* Empty reply from server
* Connection #0 to host 127.0.0.1 left intact
curl: (52) Empty reply from server
```

```bash
root@0d72ec5d8e67:/app# cat /tmp/pla.err 
2016/05/03 04:58:48 [debug] 74#0: epoll add event: fd:6 op:1 ev:00002001
2016/05/03 04:58:48 [debug] 61#0: epoll del event: fd:6 op:2 ev:00000000
2016/05/03 04:58:50 [debug] 74#0: accept on 0.0.0.0:8080, ready: 0
2016/05/03 04:58:50 [debug] 74#0: posix_memalign: 0000000001C63230:256 @16
2016/05/03 04:58:50 [debug] 74#0: *13 accept: 127.0.0.1 fd:4
2016/05/03 04:58:50 [debug] 74#0: event dummy accept filter
2016/05/03 04:58:50 [debug] 74#0: posix_memalign: 0000000001C75C90:256 @16
2016/05/03 04:58:50 [debug] 74#0: *13 event timer add: 4: 60000:1462251590434
2016/05/03 04:58:50 [debug] 74#0: *13 reusable connection: 1
2016/05/03 04:58:50 [debug] 74#0: *13 epoll add event: fd:4 op:1 ev:80002001
2016/05/03 04:58:50 [debug] 74#0: *13 http wait request handler
2016/05/03 04:58:50 [debug] 74#0: *13 malloc: 0000000001C76460:1024
2016/05/03 04:58:50 [debug] 74#0: *13 recv: fd:4 81 of 1024
2016/05/03 04:58:50 [debug] 74#0: *13 reusable connection: 0
2016/05/03 04:58:50 [debug] 74#0: *13 posix_memalign: 0000000001C7BC40:4096 @16
2016/05/03 04:58:50 [debug] 74#0: *13 http process request line
2016/05/03 04:58:50 [debug] 74#0: *13 http request line: "GET /foo HTTP/1.1"
2016/05/03 04:58:50 [debug] 74#0: *13 http uri: "/foo"
2016/05/03 04:58:50 [debug] 74#0: *13 http args: ""
2016/05/03 04:58:50 [debug] 74#0: *13 http exten: ""
2016/05/03 04:58:50 [debug] 74#0: *13 http process request header line
2016/05/03 04:58:50 [debug] 74#0: *13 http header: "User-Agent: curl/7.35.0"
2016/05/03 04:58:50 [debug] 74#0: *13 http header: "Host: 127.0.0.1:8080"
2016/05/03 04:58:50 [debug] 74#0: *13 http header: "Accept: */*"
2016/05/03 04:58:50 [debug] 74#0: *13 http header done
2016/05/03 04:58:50 [debug] 74#0: *13 event timer del: 4: 1462251590434
2016/05/03 04:58:50 [debug] 74#0: *13 rewrite phase: 0
2016/05/03 04:58:50 [debug] 74#0: *13 test location: "/foo"
2016/05/03 04:58:50 [debug] 74#0: *13 using configuration "/foo"
2016/05/03 04:58:50 [debug] 74#0: *13 http cl:-1 max:1048576
2016/05/03 04:58:50 [debug] 74#0: *13 rewrite phase: 2
2016/05/03 04:58:50 [debug] 74#0: *13 rewrite phase: 3
2016/05/03 04:58:50 [debug] 74#0: *13 posix_memalign: 0000000001C77530:4096 @16
2016/05/03 04:58:50 [debug] 74#0: *13 http script value: "foo"
2016/05/03 04:58:50 [debug] 74#0: *13 http script set $pool
2016/05/03 04:58:50 [debug] 74#0: *13 post rewrite phase: 4
2016/05/03 04:58:50 [debug] 74#0: *13 generic phase: 5
2016/05/03 04:58:50 [debug] 74#0: *13 generic phase: 6
2016/05/03 04:58:50 [debug] 74#0: *13 generic phase: 7
2016/05/03 04:58:50 [debug] 74#0: *13 access phase: 8
2016/05/03 04:58:50 [debug] 74#0: *13 access phase: 9
2016/05/03 04:58:50 [debug] 74#0: *13 post access phase: 10
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: "http://"
2016/05/03 04:58:50 [debug] 74#0: *13 http script var: "foo"
2016/05/03 04:58:50 [debug] 74#0: *13 http init upstream, client timer: 0
2016/05/03 04:58:50 [debug] 74#0: *13 epoll add event: fd:4 op:3 ev:80002005
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: "Host: "
2016/05/03 04:58:50 [debug] 74#0: *13 http script var: "foo"
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: "
"
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: "Connection: close
"
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: ""
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: ""
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: ""
2016/05/03 04:58:50 [debug] 74#0: *13 http script copy: ""
2016/05/03 04:58:50 [debug] 74#0: *13 http proxy header: "User-Agent: curl/7.35.0"
2016/05/03 04:58:50 [debug] 74#0: *13 http proxy header: "Accept: */*"
2016/05/03 04:58:50 [debug] 74#0: *13 http proxy header:
"GET /foo HTTP/1.0
Host: foo
Connection: close
User-Agent: curl/7.35.0
Accept: */*

"
2016/05/03 04:58:50 [debug] 74#0: *13 http cleanup add: 0000000001C77D60
2016/05/03 04:58:50 [debug] 74#0: *13 init keepalive peer
2016/05/03 04:58:50 [debug] 74#0: *13 init dynamic peer
2016/05/03 04:58:50 [debug] 74#0: *13 get keepalive peer
2016/05/03 04:58:50 [debug] 74#0: *13 get dynamic peer
2016/05/03 04:58:50 [debug] 74#0: *13 get rr peer, try: 1
2016/05/03 04:58:50 [debug] 74#0: *13 http finalize request: -4, "/foo?" a:1, c:2
2016/05/03 04:58:50 [debug] 74#0: *13 http request count:2 blk:0
2016/05/03 04:58:50 [debug] 74#0: *13 http run request: "/foo?"
2016/05/03 04:58:50 [debug] 74#0: *13 http upstream check client, write event:1, "/foo"
2016/05/03 04:58:50 [debug] 74#0: *13 http upstream recv(): -1 (11: Resource temporarily unavailable)
2016/05/03 04:58:50 [debug] 76#0: epoll add event: fd:6 op:1 ev:00002001
```

```bash
root@0d72ec5d8e67:/app# cat /opt/nginx/logs/error.log 
2016/05/03 04:58:50 [alert] 17#0: worker process 74 exited on signal 11 (core dumped)
```

```bash
root@0d72ec5d8e67:/app# dmesg
[11699.382380] nginx[12372]: segfault at 40 ip 000000000049e2c0 sp 00007fff27c5e710 error 4 in nginx[400000+c9000]
```

##Context

```bash
root@f79ca87bf6cb:/app# /opt/nginx/sbin/nginx -V
Tengine version: Tengine/2.1.2 (nginx/1.6.2)
built by gcc 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.1) 
TLS SNI support enabled
configure arguments: --with-debug --with-cc-opt='-D NGX_HAVE_CASELESS_FILESYSTEM=0' --prefix=/opt/nginx
loaded modules:
    ngx_core_module (static)
    ngx_errlog_module (static)
    ngx_conf_module (static)
    ngx_dso_module (static)
    ngx_syslog_module (static)
    ngx_events_module (static)
    ngx_event_core_module (static)
    ngx_epoll_module (static)
    ngx_procs_module (static)
    ngx_proc_core_module (static)
    ngx_openssl_module (static)
    ngx_regex_module (static)
    ngx_http_module (static)
    ngx_http_core_module (static)
    ngx_http_log_module (static)
    ngx_http_upstream_module (static)
    ngx_http_static_module (static)
    ngx_http_autoindex_module (static)
    ngx_http_index_module (static)
    ngx_http_auth_basic_module (static)
    ngx_http_access_module (static)
    ngx_http_limit_conn_module (static)
    ngx_http_limit_req_module (static)
    ngx_http_geo_module (static)
    ngx_http_map_module (static)
    ngx_http_split_clients_module (static)
    ngx_http_referer_module (static)
    ngx_http_rewrite_module (static)
    ngx_http_ssl_module (static)
    ngx_http_proxy_module (static)
    ngx_http_fastcgi_module (static)
    ngx_http_uwsgi_module (static)
    ngx_http_scgi_module (static)
    ngx_http_memcached_module (static)
    ngx_http_empty_gif_module (static)
    ngx_http_browser_module (static)
    ngx_http_user_agent_module (static)
    ngx_http_upstream_ip_hash_module (static)
    ngx_http_upstream_consistent_hash_module (static)
    ngx_http_upstream_check_module (static)
    ngx_http_upstream_least_conn_module (static)
    ngx_http_upstream_keepalive_module (static)
    ngx_http_upstream_dynamic_module (static)
    ngx_http_stub_status_module (static)
    ngx_http_write_filter_module (static)
    ngx_http_header_filter_module (static)
    ngx_http_chunked_filter_module (static)
    ngx_http_range_header_filter_module (static)
    ngx_http_gzip_filter_module (static)
    ngx_http_postpone_filter_module (static)
    ngx_http_ssi_filter_module (static)
    ngx_http_charset_filter_module (static)
    ngx_http_userid_filter_module (static)
    ngx_http_footer_filter_module (static)
    ngx_http_trim_filter_module (static)
    ngx_http_headers_filter_module (static)
    ngx_http_upstream_session_sticky_module (static)
    ngx_http_reqstat_module (static)
    ngx_http_copy_filter_module (static)
    ngx_http_range_body_filter_module (static)
    ngx_http_not_modified_filter_module (static)
```

```bash
root@f79ca87bf6cb:/app# uname -a
Linux f79ca87bf6cb 4.4.0-21-generic #37-Ubuntu SMP Mon Apr 18 18:33:37 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```
