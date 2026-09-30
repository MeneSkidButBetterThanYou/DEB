return {
  HttpGet=function(url)
    local result = request({Url=url,Method="GET"})
    local body = result and result.Body
    return body or ''
  end
}
