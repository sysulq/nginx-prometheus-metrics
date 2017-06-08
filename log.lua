function split(str)
    local array = {}
    for mem in string.gmatch(str, '([^, ]+)') do
        table.insert(array, mem)
    end
    return array
end

local host = ngx.var.host
local status = ngx.var.status
local upstream_cache_status = ngx.var.upstream_cache_status
local upstream_addr = ngx.var.upstream_addr
local upstream_status = ngx.var.upstream_status
local upstream_response_time = ngx.var.upstream_response_time
local upstream_connect_time = ngx.var.upstream_connect_time
local upstream_first_byte_time = ngx.var.upstream_first_byte_time
local upstream_header_time = ngx.var.upstream_header_time
local upstream_session_time = ngx.var.upstream_session_time
local upstream_bytes_received = ngx.var.upstream_bytes_received
local upstream_bytes_sent = ngx.var.upstream_bytes_sent

http_requests:inc(1, {host, status})
http_request_time:observe(ngx.now() - ngx.req.start_time(), {host})

if upstream_cache_status ~= nil then
   upstream_cache_status:inc(1, {addr, upstream_cache_status})
end

if upstream_addr ~= nil then
    local addrs = split(upstream_addr)

    -- compatible for nginx commas format
    for idx, addr in ipairs(addrs) do
        if addr == nil then
            return
        end
        http_upstream_requests:inc(1, {addr, split(upstream_status)[idx]})
        http_upstream_response_time:observe(tonumber(split(upstream_response_time)[idx]), {addr})
        http_upstream_connect_time:observe(tonumber(split(upstream_connect_time)[idx]), {addr})
        
        if upstream_first_byte_time ~= nil then
            http_upstream_first_byte_time:observe(tonumber(split(upstream_first_byte_time)[idx]), {addr})
        end
        http_upstream_header_time:observe(tonumber(split(upstream_header_time)[idx]), {addr})
        if upstream_session_time ~= nil then
            http_upstream_session_time:observe(tonumber(split(upstream_session_time)[idx]), {addr})
        end
        if upstream_bytes_received ~= nil then
            http_upstream_bytes_received:inc(tonumber(split(upstream_bytes_received)[idx]), {addr})
        end
        if upstream_bytes_sent ~= nil then
            http_upstream_bytes_sent:inc(tonumber(split(upstream_bytes_sent)[idx]), {addr})
        end
    end
end

