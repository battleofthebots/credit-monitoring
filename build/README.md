# Build 
The directory is only needed if we need to rebuild the jar file for some reason

__Build the JAR__
```
docker build -t struts .
```

__Copy the image out__
```
LATEST=$(docker run --rm -d -t struts sleep 120 | tee /dev/stderr)
docker cp $LATEST:/opt/target/struts-1.0.0.jar ./service.jar
docker kill $LATEST
```