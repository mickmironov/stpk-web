def app(environ, start_response):
    response_headers = [('Content-type', 'text/plain')]
    response_text = environ['QUERY_STRING'].replace('&', '\n')
    start_response(response_text, response_headers)
    return response_text
