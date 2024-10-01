# appium_server
simple docker file

# First step create docker image 
docker build -t appium-server .


# Second step run docker via external port 
docker run -d -p 4723:4723 --name my-appium-server appium-server


