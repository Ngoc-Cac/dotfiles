from functools import partial

from IPython import get_ipython

from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode


keybinds = get_ipython().pt_app.key_bindings
normal_keymap = partial(
    keybinds.add,
    filter=HasFocus(DEFAULT_BUFFER) & ViInsertMode()
)

def switch_to_nav_mode(event):
    event.cli.vi_state.input_mode = InputMode.NAVIGATION

normal_keymap("j", "k")(switch_to_nav_mode)
normal_keymap("k", "j")(switch_to_nav_mode)
