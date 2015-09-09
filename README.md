# Docker image containing Openntpd

Basic Docker image to run openntpd on host

To run docker in docker you must add this options:
- --cap-add SYS_TIME
- --cap-add SYS_NICE
- -p 123:123/udp
- --name openntpd (optionally)

You need edit (add) this env:
- **BACKENDS**: "0.pl.pool.ntp.org 1.pl.pool.ntp.org"

Usage: 
```
docker run --cap-add SYS_TIME --cap-add SYS_NICE -p 123:123/udp -e BACKENDS="0.pl.pool.ntp.org 1.pl.pool.ntp.org" --name openntpd -d  oberthur/docker-openntpd
```
