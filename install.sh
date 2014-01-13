#!/bin/bash

bindir="/usr/local/bin/"

echo "Installing..."
chmod +x *.sh
sudo cp ddostop* ${bindir}
sudo ln -s ${bindir}ddostop.sh ${bindir}ddostop
sudo ln -s ${bindir}ddostop-interactive.sh ${bindir}ddostop-interactive
echo "Done."
