# dockerfiles
Various Dockerfiles I use on the desktop and on servers

## Softwares

### Theia IDE

Image base: **ubuntu:18.04**

Images:
- avelino/theia-ide - *Stable version*
- avelino/theia-ide:next - *Developer version*

#### build

Generate version next version used build arg `--build-arg VERSION=next`

```
docker build -t avelino/theia-ide:next theiaide
```
