local function split(str)
    local array = {}
    for mem in string.gmatch(str, '([^, ]+)') do
        table.insert(array, mem)
    end
    return array
end

local function getWithIndex(str, idx)
    if str == nil then
        return nil
    end

    return split(str)[idx]
end

local host = ngx.var.host
local status = ngx.var.status

http_requests:inc(1, {host, status})
http_request_time:observe(ngx.now() - ngx.req.start_time(), {host})

local upstream_cache_status = ngx.var.upstream_cache_status
if upstream_cache_status ~= nil then
   upstream_cache_status:inc(1, {addr, upstream_cache_status})
end

local upstream_addr = ngx.var.upstream_addr
if upstream_addr ~= nil then
    local addrs = split(upstream_addr)
    
    local upstream_status = ngx.var.upstream_status
    local upstream_response_time = ngx.var.upstream_response_time
    local upstream_connect_time = ngx.var.upstream_connect_time
    local upstream_first_byte_time = ngx.var.upstream_first_byte_time
    local upstream_header_time = ngx.var.upstream_header_time
    local upstream_session_time = ngx.var.upstream_session_time
    local upstream_bytes_received = ngx.var.upstream_bytes_received
    local upstream_bytes_sent = ngx.var.upstream_bytes_sent

    -- compatible for nginx commas format
    for idx, addr in ipairs(addrs) do
        if table.getn(addrs) > 1 then
            upstream_status = getWithIndex(ngx.var.upstream_status, idx)
            upstream_response_time = getWithIndex(ngx.var.upstream_response_time, idx)
            upstream_connect_time = getWithIndex(ngx.var.upstream_connect_time, idx)
            upstream_first_byte_time = getWithIndex(ngx.var.upstream_first_byte_time, idx)
            upstream_header_time = getWithIndex(ngx.var.upstream_header_time, idx)
            upstream_session_time = getWithIndex(ngx.var.upstream_session_time, idx)
            upstream_bytes_received = getWithIndex(ngx.var.upstream_bytes_received, idx)
            upstream_bytes_sent = getWithIndex(ngx.var.upstream_bytes_sent, idx)
        end

        http_upstream_requests:inc(1, {addr, upstream_status})
        http_upstream_response_time:observe(tonumber(upstream_response_time), {addr})
        http_upstream_connect_time:observe(tonumber(upstream_connect_time), {addr})
        
        if upstream_first_byte_time ~= nil then
            http_upstream_first_byte_time:observe(tonumber(upstream_first_byte_time), {addr})
        end
        http_upstream_header_time:observe(tonumber(upstream_header_time), {addr})
        if upstream_session_time ~= nil then
            http_upstream_session_time:observe(tonumber(upstream_session_time), {addr})
        end
        if upstream_bytes_received ~= nil then
            http_upstream_bytes_received:inc(tonumber(upstream_bytes_received), {addr})
        end
        if upstream_bytes_sent ~= nil then
            http_upstream_bytes_sent:inc(tonumber(upstream_bytes_sent), {addr})
        end
    end
end

