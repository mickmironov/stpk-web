def app(environ, start_response):
    response_headers = [('Content-type', 'text/plain')]
    body = [
        bytes(i + '\n', 'ascii') for i in environ['QUERY_STRING'].split('&')
        ]
    start_response('200 OK', response_headers)
    return body
