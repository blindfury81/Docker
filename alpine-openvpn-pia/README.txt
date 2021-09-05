Hello Docker and PIA community!!  This is my first run at a dockerfile for setting up a stack using alpine linux, openvpn, and private internet access.

BEFORE YOU RUN
 - You'll need to update 2 ARGs and 1 ENV variable in the alpine-openvpn-pia.Dockerfile
 - Should be self-explanatory; but you need to update "ARG username=", "ARG password=", and "ENV piaConfig="
    username is your private internet access username
    password is the password linked to your private internet access username from above
    piaConfig is the name of the openvpn file that correlates to the location in which you want to tunnel your connection.  

BUILDING THE IMAGE
 - I've used the following to build the image:
    docker build -t alpine-openvpn-pia -f alpine-openvpn-pia.Dockerfile .
 - alpine can sometimes be fidgety.  If you have difficulty getting docker to build I recommend adding the "--network=host" parameter.  This is also why I'm using 3.12.

RUNNING THE IMAGE
 - I've been running the image in privileged mode using the following:
    docker run -d --privileged --name pia [image_id]

...and that's it!!  Enjoy, I'll be updating it over time.