# backdoor

```yaml
## public backdoor server
varsion: '3'

services:
  backdoor:
    image: javanile/backdoor
    ports:    
      - '10022:10022'
```

```yaml
## private backdoor target
varsion: '3'

services:
  backdoor:
    image: javanile/backdoor
    environment:
      - BACKDOOR_HOST=<public-backdoor-server>
      - BACKDOOR_BIND=50000
```

```yaml
## private backdoor client (connected to the target)
varsion: '3'

services:
  backdoor:
    image: javanile/backdoor
    environment:
      - BACKDOOR_HOST=<public-backdoor-server>
      - BACKDOOR_OPEN=50000
```


docker run --rm -p 10022:10022 javanile/backdoor






docker run --rm -d \
    -e BACKDOOR_HOST=private.backdoor.net \
    -e BACKDOOR_PORT=10022 \
    -e BACKDOOR_BIND=50000 \ 
    javanile/backdoor

docker run --rm -it \      
    -e BACKDOOR_HOST=private.backdoor.net \
    -e BACKDOOR_PORT=10022 \
    -e BACKDOOR_OPEN=50000 \ 
    -e BACKDOOR_USER=root \
    javanile/backdoor

ssh -p 10022 backdoor@90.88.55.62 -R 19999:localhost:2

ssh -p 10022 backdoor@localhost 19999

curl -sL https://javanile.github.io/backdoor/setup | sudo -E bash -



backdoor bind 50000

backdoor open 50000

