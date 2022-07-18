

while getopts ":t:" opt; do
  case $opt in
    t) tag="$OPTARG";;
  esac
done

if [ -z "$tag" ]
then
    echo '[BOOTSRAPING] starting server and client in parallel'
    python3 server.py &
    python3 client.py &
else
    echo '[BOOTSRAPING] starting server in background and client in foreground'
    python3 server.py & python3 client.py && fg
fi && exit 1
