"""Static dev server for web/ with caching disabled (so edited JS modules always reload).

  python devserver.py [PORT] [SHOT_DIR]

Dev only: with SHOT_DIR given, POST /__shot with a PNG body saves it to SHOT_DIR/shot.png (full-resolution
canvas grabs for checking the rendering)."""
import http.server
import os
import sys

import paths

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 8077
SHOT_DIR = os.path.abspath(sys.argv[2]) if len(sys.argv) > 2 else None


class H(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store')
        super().end_headers()

    def do_POST(self):
        if self.path != '/__shot' or not SHOT_DIR:
            self.send_error(404)
            return
        data = self.rfile.read(int(self.headers.get('Content-Length', 0)))
        os.makedirs(SHOT_DIR, exist_ok=True)
        with open(os.path.join(SHOT_DIR, 'shot.png'), 'wb') as f:
            f.write(data)
        self.send_response(204)
        self.end_headers()

    def log_message(self, *a):
        pass


os.chdir(paths.WEB)
http.server.ThreadingHTTPServer(('127.0.0.1', PORT), H).serve_forever()
