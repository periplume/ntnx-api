
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
- mac git unlicensed breaks things (run sudo xcodebuild -license)
- add time zone matching to host system (timedatectl)
- change root user home to /nutanix
- capture root cmd history into logs/.bash_history for persistance
- move .bashrc and .vimrc to cfg/ for persistance
- container time zone is not being set to local locale
- test live edit on git repo code mounted into container
- add timezone and ntp time sync option to keep clock aligned

# Dockerfile
==================
- add timedatectl (with systemd)

# ntnx-api
==================
- output all curl commands to logs for debugging and reference
- capture connect times and record state
- add status function...capture cluster status basics and pretty print
- move basic functions into separate file and source
- image upload function (from url list of ISOs etc)
- image list function
- scan: add slow and stealth option
- check out httpie for interactive use
