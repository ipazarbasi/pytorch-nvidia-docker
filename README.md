# Dockerfile based on NVIDIA PyTorch image with additional ipywidgets
This Dockerfile adds ipywidgets to jupyter so that the notebook shows nice
progress bar when downloading data/pre-trained models from the Internet, that's
all.

## Building
It's based on NVIDIA's 20.02-py3 release. Release version can be specified with
`NVIDIA_REL` build argument when building the image.

    docker build --rm --build-arg NVIDIA_REL=20.02-py3 \
      -t <creative image name>:latest <path to Dockerfile>

e.g:

    docker build --rm --build-arg NVIDIA_REL=20.02-py3 \
      -t my.name/pytorch:latest .

## Running
To run jupyter:

    docker run --gpus all --rm --ulimit memlock=-1 -v \
      <local path that you want to run in jupyter>:/workspace \
      --runtime=nvidia -p 8888:8888 <creative image name>:latest \
      jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token=''

To run container and get a shell:

    docker run --gpus all --rm -it --ulimit memlock=-1 -v \
      <local path that you want to access from the container>:/workspace \
      --runtime=nvidia -p 8888:8888 <creative image name>:latest
