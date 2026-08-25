# Configuration file for ipython.

eza =  "eza --icons=auto --group-directories-first --git -h"

c = get_config()  # pyright: ignore

c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalInteractiveShell.term_title = False
if hasattr(c.TerminalInteractiveShell, "enable_tip"):
    c.TerminalInteractiveShell.enable_tip = False

c.AliasManager.user_aliases = [
    ("clear", "clear"),
    ("cl", "clear"),
    ("mv", "mv -vi"),
    ("ls", eza),
    ("ll", f"{eza} -l"),
    ("la", f"{eza} -Al"),
    ("lh", f"{eza} -ld .?*"),
]

c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = [
    "%autoreload 2",
    "import numpy as np",
    "import pandas as pd",
    "import matplotlib.pyplot as plt",
]

