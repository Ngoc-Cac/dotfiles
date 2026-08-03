#!/usr/bin/env python3
import os, sys, tty, termios, signal, secrets

CHARSET = "abcdefghijklmnopqrstuvwxyz    !@#$%^&*"
PHRASE = "not actually my real password"
NOISE_PCT = 21
NUM_ADD = 5


def write(s: str, fd):
    os.write(fd, s.encode())


def erase(n: int):
    write("\b \b" * n)


def read_loop(fd, prompt: str="[sudo] password: "):
    disp_len, pos = 0, 0
    password, advance_counts = [], []

    write(prompt, fd)
    while (ch := os.read(fd, 1).decode(errors="ignore")):
        if ch in ("\r", "\n"):
            break

        if ch in ("\x7f", "\x08"):
            if password:
                password.pop()
                last_adv = advance_counts.pop()
                pos = (pos - last_adv) % len(PHRASE)

                if not password:
                    erase_n = disp_len
                else:
                    erase_n = secrets.randbelow(NUM_ADD)
                    if disp_len - erase_n < 1:
                        erase_n = disp_len - 1
                erase(erase_n)
                disp_len -= erase_n
        elif ch in ("\x15", "\x17"):
            erase(disp_len)
            disp_len, pos  = 0, 0
            password.clear()
            advance_counts.clear()
        else:
            password.append(ch)
            delta = 1 + secrets.randbelow(NUM_ADD - 1)
            new_chars = []
            for _ in range(delta):
                if secrets.randbelow(100) < NOISE_PCT:
                    new_chars.append(secrets.choice(CHARSET))
                else:
                    pos = (pos + 1) % len(PHRASE)
                    new_chars.append(PHRASE[pos])

            new_chars = ''.join(new_chars)
            write(new_chars,  fd)
            advance_counts.append(len(new_chars))
            disp_len += delta

    write("\r\n", fd)
    return password


if __name__ == "__main__":
    fd = os.open("/dev/tty", os.O_RDWR)
    old_settings = termios.tcgetattr(fd)

    def restore():
        termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)

    def handle_signal(signum, frame):
        restore()
        write("\r\n", fd)
        sys.exit(130)

    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGTERM, handle_signal)

    prompt = (
        sys.argv[1] if len(sys.argv) > 1 else
        "\033[31;1mIs not sudo\033[0m, enter password at your own risk: "
    )
    try:
        parent_cmd = open(f"/proc/{os.getppid()}/comm").read().strip()
    except OSError:
        parent_cmd = ""
    if len(sys.argv) < 2 or "sudo" not in parent_cmd:
        prompt = "\033[31;1mIs not sudo\033[0m, enter password at your own risk: "

    try:
        tty.setraw(fd)
        passwd = read_loop(fd)
    finally:
        restore()

    print("".join(passwd))
