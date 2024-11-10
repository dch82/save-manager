GAME_CONSOLES=$(find /media/**/ -name '.is_game_console' -printf '%h\n')
BASEDIR=$(dirname "$0")

if [$(git -C $BASEDIR/save-files/ diff) != '']; then
    >&2 echo -e "\x1b[33;1mCommitting unstaged changes...\x1b[0m"
    git -C $BASEDIR/save-files/ add .
    git -C $BASEDIR/save-files/ commit --quiet -m $(date -Iseconds) || true
fi

>&2 echo -e "\x1b[33;1mCommitting...\x1b[0m"
git -C $BASEDIR/save-files/ add .
git -C $BASEDIR/save-files/ commit --quiet -m $(date -Iseconds) || true
>&2 echo -e "\x1b[33;1mPushing to Git Remote...\x1b[0m"
git -C $BASEDIR/save-files/ push --quiet
>&2 echo -e "\x1b[32;1mDone!\x1b[0m"