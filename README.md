## Steps to start data load into gemfire
  - Start gemfire servers by running startServer.sh. This script starts 1 locator and 2 servers and creates a empty region
    called twitterRegion where twitter data will be stored. Restful access will also be enabled with this.
  - To verify if gemfire started up run the below command from within gfsh
    ```connect``` followed by ```list regions``` and ```list members```. These commands should the available regions and the avaiable servers.
  - Start springXD by running ```spring-xd-1.2.0.RELEASE/xd/bin/xd-singlenode```
  - From a different terminal start SpringXD shell by running ```spring-xd-1.2.0.RELEASE/shell/bin/xd-shell```
  - From the xd shell terminal create springXD by running the commands from the file xd_commands.txt.

With this data should have started flowing into Gemfire. Now you should be able to query the APIs using curl or by using a gemfire REST API tool called swagger available at http://localhost:8080/gemfire-api/docs/index.html#!/region

curl just spit out the available regions curl -i http://localhost:8080/gemfire-api/v1


###Endpoints:

Regions endpoints http://gemfire.docs.pivotal.io/docs-gemfire/latest/rest_apps/rest_regions.html
Query endpoints  http://gemfire.docs.pivotal.io/docs-gemfire/latest/rest_apps/rest_queries.html


### For google news a module which reads rss feeds needs to be installed as below.
The module needs to be built from source from [here](https://github.com/spring-projects/spring-xd-samples/tree/master/rss-feed-source).
But for simplicity the jar file is available in the resources/lib directory.
- From the xd-shell run the command ```module upload --file [path-to-perigon-gf-lib]/rss-source-feed-1.0.0.BUILD-SNAPSHOT.jar --name feed --type source```.
- Verify is the module is succesfully uploaded by running ```xd:>module info --name source:feed```
- Once verified ```stream create``` command for googleNews can be run. Refer xd_commands.txt


