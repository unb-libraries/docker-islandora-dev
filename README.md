# Islandora docker stack
A simple, extensible Islandora docker stack. Leverages the [phusion/baseimage](https://registry.hub.docker.com/u/phusion/baseimage/) my_init system. *This is not a production-ready stack*.

Thestack is pseudo-monolithic, with fedora/solr/gsearch located on the same instance. This stack will conflict with any machines that have already deployed `tonistiigi/dnsdock`.

## Requirements

* `docker`
* `docker-compose`

New to Docker? If you are not on a [Linux based OS](https://docs.docker.com/installation/ubuntulinux/), the fastest way to get up and running with Docker is using [Docker Toolbox](https://www.docker.com/toolbox).

## Usage
### Initial Deployment
First, build the stack (slow):
```
docker-compose build
```

Then, you can deploy a new stack in seconds:
```
docker-compose up
```

### Start over
Delete the stack and start from scratch
```
docker-compose rm
```

Then, deploy again:
```
docker-compose up
```

### Run as a service
If you wish to background the service : 

(After build)
```
docker-compose start
docker-compose start
```

### Mount Local Storage
If you wish to mount/persist local storage for ease of development, add the following to the 'drupal' definition of docker-compose.yml.
```
  volumes:
    - /your/local/path:/usr/share/nginx/html
```

A convenience bin `refresh.sh` is included to leverage the delete/build/up cycle during development.

## License
- Islandora docker stack is licensed under the MIT License:
  - [http://opensource.org/licenses/mit-license.html](http://opensource.org/licenses/mit-license.html)
- Attribution is not required, but much appreciated:
  - `Islandora docker stack by UNB Libraries`
