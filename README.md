# backdoor


docker run -d -P javanile/backdoor


docker run --rm \
    -e BACKDOOR_HOST=private.backdoor.net \
    -e BACKDOOR_PORT=10022 \
    -e BACKDOOR_BIND=50000 \ 
    javanile/backdoor

docker run --rm -e BACKDOOR_OPEN=50000 
    -e BACKDOOR_HOST=private.backdoor.net \
    -e BACKDOOR_PORT=10022 \
    -e BACKDOOR_OPEN=50000 \ 
    -e BACKDOOR_USER=root \
    javanile/backdoor

ssh -p 10022 backdoor@90.88.55.62 -R 19999:localhost:2

ssh -p 10022 backdoor@localhost 19999
