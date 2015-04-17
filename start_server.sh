#restart the server if it got killed
until (rails server -b $IP -p $PORT); do
    echo "'rails server' crashed with exit code $?.  Respawning.." >&2
    sleep 1
done