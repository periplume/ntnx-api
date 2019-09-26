
# general
==================
- test on centos 7
- install ncli (?)
- custom term and vim colorschemes to create distinctive look(s)
- upload base docker image to dockerhub to avoid compile time
- versioning

# ntnx-api.install
==================
- permission unity ... notice how mapped volume is root?
- figure out how to map bin to local volume gracefully
- container time zone is not being set to local locale
- test live edit on git repo code mounted into container

# ntnx-api
==================
- move all jq work into functions
- move curl construct into function
- output all curl commands to logs for debugging and reference
- capture connect times and record state
- change cluster.json to allow for multiple clusters (?)
- add status function...capture cluster status basics and pretty print
- add CONFIG with SAFEMODE=true|false to allow password storage in secure environments (and source)
- move basic functions into separate file and source
- image upload function (from url list of ISOs etc)
- image list function

