# Protobuf on Docker

## The steps
We are going through two steps here:

1. Creating `protoc` by compiling C++ files
2. Compiling [C++ implementation for `python`](https://github.com/google/protobuf/tree/master/python#c-implementation)

## For distros

Dockerfiles are available for the following Operating Systems:

- Centos 7
- Fedora 23
- Ubuntu 15

However, once you have a dockerfile running for one version, you should easily be able to change the OS to any version - at the top.


## Where to find the files

- `protoc` compiler is available at `/ws/protoc-3.2` folder inside the images
- `python` version (compiled from c++) is available at `/ws/protobuf-3.0.0-beta-3.2/python/dist/`

You can copy out the files using the following commands:

```bash
id=$(sudo docker create <image_name>)
sudo docker cp $id:/ws/protoc-3.2 ./
sudo docker cp $id:/ws/protobuf-3.0.0-beta-3.2/python/dist/*.tar ./
```

Just remember to change the rights as the files will belong to `root` by default.
