#!/bin/bash
#
# mkissue.sh - Build a nice issue for arch linux tty
# Copyright 2013 Abdó Roig-Maranges <abdo.roig@gmail.com>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

ISSUE=arch.issue
ISSUE_INSTALL=arch.issue.install

echo -n "" > "$ISSUE"

# Set the color theme
_SEDCMD='s/urxvt\.color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | \
    awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
    echo -en "$i"      >> "$ISSUE"
done
echo -e "\\e]P0000000" >> "$ISSUE"
echo -e ""             >> "$ISSUE"

# Clear screen
echo -e "\e[H\e[2J"    >> "$ISSUE"

# The issue
echo -e "$(paste -d "" src/logo.src src/arch.src)" >> "$ISSUE"

# Reset colors plus newline
echo -e "\e[0;m"       >> "$ISSUE"

# now escape '\' characters for the installed version
cp $ISSUE $ISSUE_INSTALL
sed -i 's|\\|\\\\|g' $ISSUE_INSTALL
sed -i 's|%|\\|g'    $ISSUE_INSTALL

# vim: expandtab:shiftwidth=4:tabstop=4:softtabstop=4:textwidth=80
