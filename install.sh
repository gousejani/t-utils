INSTALL_DIR=$HOME/.utils

mkdir -p "$INSTALL_DIR"

cat ./todos.sh > $INSTALL_DIR/t
cat ./updates.sh > $INSTALL_DIR/u

chmod 700 $INSTALL_DIR/t $INSTALL_DIR/u

PATH_LINE="export PATH=\"$INSTALL_DIR:\$PATH\""

if ! grep -Fqx "$PATH_LINE" ~/.zshenv 2>/dev/null; then
  echo "$PATH_LINE" >> ~/.zshenv
fi
