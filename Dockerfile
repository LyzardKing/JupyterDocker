FROM quay.io/jupyter/minimal-notebook

RUN apt update \
&& apt install -y swi-prolog-nox \
&& rm -rf /var/lib/apt/lists/*

USER root
# hadolint ignore=DL3013
RUN python3 -m pip install --no-cache-dir \
    dockerspawner \
    jupyterhub-nativeauthenticator \
    prolog_kernel \
    nbgrader

RUN python -m prolog_kernel.install

USER $NB_UID