# semapps-workbench
### Prerequisites

If you want to use containers
- [docker-compose](https://docs.docker.com/compose/) & [docker](https://docs.docker.com/engine/)

If you don't want to use containers
- [NodeJS](https://nodejs.org/en/)

Dans un vrai projet, il est toujours nécessaire de disposer de plusieurs outils
- Make
- npm ou yarn

### Very short Launch
there is a way to launch a project very quickly : [semapps-workbench](https://github.com/assemblee-virtuelle/semapps-workbench)
It is only a tool that simplifies the different manipulations that will be seen in this guide.

to start a poject
* fork [semapps-workbench](https://github.com/assemblee-virtuelle/semapps-workbench) git repository : this is your directory for your project
* clone new repository on your local environment
* initialise & server server + initialise an DMS/archipelago client + set up containers infrastructure
```bash
make init
```
* start the full project (client at localhost:5000) + show logs of containers
```bash
make start
make log
make stop
```

* OR start using semapps kernel sources (more information in "use semapps kernel source" chapiter) + show logs of containers
```bash  
make start-dev
make log-dev
make stop-dev
```
* If you are on a production server that benefits from DNS redirection, start on a production server (more information in "production environment" chapiter) + show logs of containers.
```bash  
make start-prod
make log-prod
make stop-prod
```
