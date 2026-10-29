import http.server
import json
import urllib.parse

name = 'data.json'


class Handler(http.server.BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        pass

    def do_GET(self):
        data = urllib.parse.parse_qs(urllib.parse.urlparse(self.path).query)

        # pitch_hist.append(float(data.get('pitch', ['0'])[0]))
        # altitude_hist.append(float(data.get('altitude', ['0'])[0]))
        # target_alt_hist.append(float(data.get('target_alt', ['0'])[0]))
        # target_pitch_hist.append(float(data.get('target_pitch', ['0'])[0]))
        # pitch_correction_hist.append(float(data.get('pitch_correction', ['0'])[0]))
        dist.append(float(data.get('dist', ['0'])[0]))
        # delta_x.append(float(data.get('delta_x', ['0'])[0]))
        # delta_y.append(float(data.get('delta_y', ['0'])[0]))

        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'OK')


pitch_hist = []
altitude_hist = []
target_alt_hist = []
target_pitch_hist = []
pitch_correction_hist = []
dist = []
delta_x = []
delta_y = []

server = http.server.HTTPServer(('localhost', 8080), Handler)
print('Server started on http://localhost:8080')

try:
    server.serve_forever()
except KeyboardInterrupt:
    with open(name, 'w') as file:
        json.dump({'pitch': pitch_hist, 'altitude': altitude_hist, 'target_alt': target_alt_hist,
                   'target_pitch': target_pitch_hist, 'pitch_correction': pitch_correction_hist, 'dist': dist,
                   'delta_x': delta_x, 'delta_y': delta_y}, file)

