Awesome Compose Assigment
=========================
You are the Node.js developer for the "Dog vs. Cat voting app" project.
You are given a basic docker-compose.yml and the source code for the "result"
Node.js app (sub directory of this dir).

Goal: take the docker-compose.yml in this directory, which uses the docker
voting example distributed app, and make it more awesome for local development
of the "result" app using all the things you learned in this section.

## The finished compose.yml should include:

* Set the compose file version to the latest 2.x (done for you) X
* Healthcheck for postgres, taken from the depends_on lecture X
* Healthcheck for redis, test command is "redis-cli ping" X
* vote service depends on redis service X
* result service depends on db service X
* worker depends on db and redis services X
* remember to add the service_healthy to depends on objects X
* result is a node app in subdirectory result. Let's bind-mount that X
* result should be built from the Dockerfile in ./result/ X
* Add a traefik proxy service from proxy lecture example. Have it run 
on a published port of your choosing and direct vote.localhost and 
result.localhost to their respective services so you can use Chrome x
* Add nodemon to the result service based on file watching lecture. You 
may need to get nodemon into the result image somehow. X
* Enable NODE_ENV=development mode for result X
* Enable debug and publish debug port for result ?

## Things to test once finished to ensure it's working:

* Edit ./result/server.js, save it, and ensure it restarts
* Ensure you never see "Waiting for db" in docker-compose logs, which happens
when vote or result are waiting on db or redis to start
* Use VS Code or another editor with debugger (or Chrome) to connect to debugger
* Goto vote.localhost and result.localhost and ensure you can vote and see result

Good Luck!
