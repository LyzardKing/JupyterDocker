FROM quay.io/jupyter/minimal-notebook

USER root
RUN apt update \
&& apt install -y swi-prolog-nox \
&& rm -rf /var/lib/apt/lists/*
USER $NB_UID

# hadolint ignore=DL3013
RUN python3 -m pip install --no-cache-dir \
    dockerspawner \
    jupyterhub-nativeauthenticator \
    prolog_kernel \
    nbgrader

RUN python -m prolog_kernel.install