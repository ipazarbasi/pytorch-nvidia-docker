ARG NVIDIA_REL=20.02-py3
FROM nvcr.io/nvidia/pytorch:${NVIDIA_REL}

RUN conda install -c conda-forge ipywidgets && \
  jupyter nbextension enable --py widgetsnbextension
