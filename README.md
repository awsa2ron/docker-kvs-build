# Using Docker images for Producer SDK building:

Please follow the four steps below to get the Docker image for Producer SDK building.

#### Pre-requisite:

This requires docker is installed in your system.

Follow instructions to download and start Docker

* [Docker download instructions](https://www.docker.com/community-edition#/download)
* [Getting started with Docker](https://docs.docker.com/get-started/)

#### Step 1: Build the docker image

Run the following command: 
`docker build -t docker-kvs-build:latest .`

This takes some time as it pulls all the dependencies in.

#### Step 2: Start the container
Run the following command to start the kinesis video sdk building container.

`sudo docker run --rm -it -v <kvs-source-code-path>:/home/kvs/sdk docker-kvs-build:latest`

#### Step 3: Building the sample
cd sdk/
mkdir -p build
cd build/ && rm -rf ./* && rm -rf ../open-source/*
git pull --recurse-submodules
cmake ..
make

#### Step 4: Set these environment variables: 

```
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_ACCESS_KEY_ID=xxx
export AWS_DEFAULT_REGION=us-west-2	
```

#### Step 5: Start to put media

```
# Put media to "my-kvs-stream" on KVS for 600 seconds.
./kvsAacAudioVideoStreamingSample my-kvs-stream 600
```

>Note:
>KVS will create "my-kvs-stream" automatically once received video data.