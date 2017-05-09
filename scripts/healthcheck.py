#!/usr/bin/env python

import BaseHTTPServer

# HTTPRequestHandler class
class HealthRequestHandler(BaseHTTPServer.BaseHTTPRequestHandler):

  # GET
  def do_GET(self):
    # Send response status code
    self.send_response(200)

    # Send headers
    self.send_header('Content-type','text/html')
    self.end_headers()

    message = "OK! I didn't check much though."
    self.wfile.write(bytes(message))
    return

def run():
  print('starting server...')

  server_address = ('', 8080)
  httpd = BaseHTTPServer.HTTPServer(server_address, HealthRequestHandler)
  print('running the healthcheck server...')
  httpd.serve_forever()

run()