# Islandora docker dev stack
A simple, extensible Islandora docker stack. Leverages the [phusion/baseimage](https://registry.hub.docker.com/u/phusion/baseimage/) my_init system. *This is not a production-ready stack*.

The stack is pseudo-monolithic, is based on docker-compose with fedora/solr/gsearch located on the same instance. This stack will conflict with any machines that have already deployed `tonistiigi/dnsdock`.

## Requirements

* `docker`
* `docker-compose`

## Getting Started
Not sure where to start? New to Docker? Check out the [unblibraries/drupal Wiki](https://github.com/unb-libraries/docker-islandora-dev/wiki) for detailed instructions on deploying a local development instance.


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
- Islandora docker dev stack is licensed under the MIT License:
  - [http://opensource.org/licenses/mit-license.html](http://opensource.org/licenses/mit-license.html)
- Attribution is not required, but much appreciated:
  - `Islandora docker dev stack by UNB Libraries`
