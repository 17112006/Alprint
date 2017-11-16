
[![Build Status](https://travis-ci.org/MastaaK/Alprint.svg?branch=master)](https://travis-ci.org/MastaaK/Alprint)
# [Al]pine + Octop[rint]
The goal of this build is to embed Octoprint into an Alpine OS.

This is not a copy of OctoPi, as it will not embed Cura engine (as I din't use it)

# How to use it

Simply start the container with :

docker run -d -p 5000:5000 \
  -v /root/octoprint/config:/home/user/.octoprint  \
  --device=/dev/ttyUSB0 \
  --entrypoint=/usr/bin/octoprint \
  --name=OctoPrint \
  mastaak/alprint

The config directory /host/path/to/config is where your octoprint persistent data is stored on the host OS.

The device /dev/ttyS0 will probably need to be altered to represent where your 3D printer lives.

#Why I did this

1. Because I recently got into Docker
2. Because I'd use a OctoPi for my 3D Printer but wasn't happy with a single OS to run all my apps (Home Assistant, PiHole, Octoprint...)
3. Because of space !
4. Having the satisfaction to use my own container

# TO-DO :
- Embed MJPG Streamer
