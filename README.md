# pihole-dnscrypt
A repo for testing docker-based Pi-Hole / DNSCrypt deployment 

Basically, I containerized the DNSCrypt-Proxy instructions found here: 

https://github.com/pi-hole/pi-hole/wiki/DNSCrypt-2.0

I then created a [Docker Compose](https://docs.docker.com/compose/install/) file to quickly bring up the two containers. At this point, it is still necessary to add a custom DNS server for `127.0.0.1#5300` in Pi-Hole, to ensure private DNS queries. 

### Building the DNSCrypt image and running it: 

1. Place the attached `Dockerfile` in the directory you would like to build in and run: 
```
$ docker build -t dnscrypt-proxy .
```

#### Note: it is possible to automate the build with `docker-compose`. 

2. Next, assuming you configured the config `toml` to use port 5300, you can test run the image: 

```
$ docker run -d -it --net=host -v /path/to/your/dnscrypt-proxy.toml:/opt/dnscrypt-proxy/dnscrypt-proxy.toml dncrypt-proxy
$ nslookup -port=5300 google.com 127.0.0.1
```

#### Note: We will get better performance in the host network namespace. 


# Work in progress. Please check back!

## To Do
- Explain how I leverage environment variables to populate the Compose file similar to [this article](https://success.docker.com/article/how-to-leverage-variables-in-a-stack-file).
- Test the steps to make sure they actually work!
- Include my syntax for running `docker-compose`. 
- Consider updating the compose file so that it automates the build. 
