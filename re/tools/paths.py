"""Where the tools find things.

re/ and web/ are found relative to this file. The original game's application resource fork, dumped with
`rsrc.py dump` (a folder holding CODE/ and DATA/), is given by the HARRY_APP_RSRC environment variable.
"""
import os
import sys

TOOLS = os.path.dirname(os.path.abspath(__file__))
RE = os.path.dirname(TOOLS)
REPO = os.path.dirname(RE)
WEB = os.path.join(REPO, "web")


def app_rsrc():
    p = os.environ.get("HARRY_APP_RSRC")
    if not p or not os.path.isdir(os.path.join(p, "CODE")):
        sys.exit("Set HARRY_APP_RSRC to the dumped application resource fork (a folder with CODE/ and DATA/).")
    return p
