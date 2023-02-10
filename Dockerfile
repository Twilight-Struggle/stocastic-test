FROM python:3.9-bullseye

WORKDIR /
RUN export DISPLAY=:0

RUN python3 -m pip install --upgrade pip \
&&  pip install --no-cache-dir \
    flake8 \
    jupyterlab \
    jupyterlab_flake8

RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    japanize_matplotlib \
    seaborn \
    jquants-api-client \
    plotly

RUN mkdir workspace

ENTRYPOINT ["jupyter-lab","--allow-root","--ip=0.0.0.0","--port=8888","--no-browser","--NotebookApp.token=''","--notebook-dir=/workspace"]
