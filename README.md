# t-utils

Small terminal utilities for keeping a todo list and recording daily updates in plain text files.

- `t`: add, view, or edit todos.
- `u`: record timestamped updates and view them by day.

## Requirements

- macOS: the updates command uses macOS's `date -v` option.
- Bash to run the utilities.
- Zsh for the installer's automatic PATH setup.
- Neovim (`nvim`) if you want to edit todos with `t -o`.

## Installation

Clone the repository and run the installer from its directory:

```sh
git clone https://github.com/gousejani/t-utils.git
cd t-utils
bash install.sh
```

The installer copies the scripts to `~/.t-utils/t` and `~/.t-utils/u`, then adds that directory to PATH in `~/.zshenv`.

Open a new terminal, or enable the commands in your current session:

```sh
export PATH="$HOME/.t-utils:$PATH"
```

For other shells, add the same PATH export to your shell's startup file manually. The installer currently configures only Zsh.

## Todos

Add a todo:

```sh
t -a "Buy groceries"
```

Show your todos:

```sh
t
```

Edit the todo file in Neovim:

```sh
t -o
```

Todos are stored one per line in `~/.todos/todo`. You can remove or change entries by editing this file. Marking todos as completed is not implemented yet.

## Daily updates

Record an update for today:

```sh
u -a "Finished the API integration"
```

Show today's updates:

```sh
u -g
```

Show yesterday's updates, or updates from three days ago:

```sh
u -g -d 1
u -g -d 3
```

Updates are stored in `~/.updates`, with one file per day named `YYYY-MM-DD`. Each entry includes a local date and time. The `-d` option selects the day to read; adding an update always writes to today.

## Help and version

Both commands provide usage information and a version number:

```sh
t --help
u --help
t --version
u --version
```

## Custom storage directories

Set `TODOS_DIR` or `UPDATE_DIR` to change where the utilities store their files:

```sh
export TODOS_DIR="$HOME/notes/todos"
export UPDATE_DIR="$HOME/notes/updates"
```

Add these exports to your shell's startup file to keep the settings across sessions. The utilities create the directories as needed.

## Current limitations

- Viewing todos before adding the first entry, or reading a day with no updates, reports a missing file.
- Installation through Homebrew is not available yet.

## Uninstall

Remove `~/.t-utils` and its PATH export from `~/.zshenv` (or your shell's startup file). Your todo and update files remain in their storage directories unless you remove them separately.
