# Configuration file for ipython.

eza =  "eza --icons=auto --group-directories-first --git -h"

c = get_config()  #noqa

c.InteractiveShellApp.exec_lines = [
    "import numpy as np",
    "import pandas as pd",
    "import matplotlib.pyplot as plt",
]

c.TerminalInteractiveShell.enable_tip = False
c.TerminalInteractiveShell.term_title = False

c.AliasManager.user_aliases = [
    ("clear", "clear"),
    ("cl", "clear"),
    ("mv", "mv -vi"),
    ("ls", eza),
    ("ll", f"{eza} -l"),
    ("la", f"{eza} -Al"),
    ("lh", f"{eza} -ld .?*"),
]
