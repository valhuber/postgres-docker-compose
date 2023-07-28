# Postgres ApiLogicProject using Docker and docker-compose

## Installation

```
# git clone https://github.com/valhuber/postgres-docker-compose.git
# cd postgres-docker-compose
```

## Project

![Project Structure](images/docker-compose.png)

## Configure

To configure the ApiLogicProject, change the environement variables in [`devops/docker-compose/docker-compose.yml`](docker-compose.yml):
```
    api-logic-server:
        environment:
            - APILOGICPROJECT_CLIENT_URI=//192.168.109.130
```

See also entries: `configure-me`.

## Run

> Ensure you are not already running the API Logic Server postgres database in a docker container.  If it's running, you will see port conflicts.

The following will build and deploy the default container stack locally:

```
# cd postgres-docker-compose  # <project-root>
# docker-compose -f ./devops/docker-compose/docker-compose.yml up
```

Then, in your browser, open `localhost`.


## Add Security (under construction - not working)

First, update the project:

```bash
cd postgres-docker-compose
ApiLogicServer add-auth --project_name=. 
````

# Status

## Runs *without* security

The project should run, without security.   Security has some bugs I am addressing.  They are pretty high priority.

## Packaging: *in-project* or *acquire* (seeking feedback)

In general, I like to ensure that created projects demonstrate the key features as 'heads-up', so that users discover them without doc.  The current `devops`, for example, shows you how to create a container.

> Aside: I am coming to believe that devops is a key part of an eval.  Even before I learn logic / API customization, I want to see a running sample, including how it deploys, *then* study logic et al.  This is what Tom Peters is doing, and I think it makes good sense.  So, this packaging issue is central to eval / product adoption.

I would like the same for docker-compose.  This project, for example, is the **acquire** approach.  The issue is you have to *find* it, e.g. by docs.  You might miss it, and fail to encounter our strong containerization story.

I took a cut at the *in-project* approeach - creating this right into each project.  But it does not fit for *generic* projects:

* it presumes the postgres northwind database, and is irrelevant for others

* the `devops/docker-compose/www/admin-app` is large, increasing a 2.5MB project to 35MB.

Perhaps we take a middle approach:

* package this project along with the other samples on [ApiLogicServer git](https://github.com/ApiLogicServer)

* create projects with a sparse `devops/docker-compose` - the compose file and the dockerfile, with a readme to say where to find the sample and further doc.

I an inclined toward this, but very interested in your thoughts.