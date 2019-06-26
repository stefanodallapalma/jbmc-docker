# jbmc-docker
A Docker image based on openjdk:8-jdk-alpine for the CProver JBMC.

## How to use

Pull image from Docker Hub with ```docker pull stefadp/jbmc:v0.0.2```

Run the image with ```docker run stefadp/jbmc:v0.0.2```

This will setup an environment with JBMC already built and ready to use.

To use it as a base image for other builds, use ```FROM stefadp/jbmc:v0.0.2``` in your Dockerfile. Then, it is possible to run JBMC by simply calling ```jbmc```. 

For example, after having include the image in your container, you can run the command ```jbmc --help``` in a python script as follows:

```python
from subprocess import STDOUT, check_output
cmd = ['jbmc', '--help']
output = check_output(cmd, stderr=STDOUT)
print(output)
```
