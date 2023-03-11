FROM python:3.9-bullseye

RUN apt update && apt install -y --no-install-recommends g++ gcc \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN export DISPLAY=:0

RUN python3 -m pip install --upgrade pip \
    &&  pip install --no-cache-dir \
    flake8 \
    black \
    jupyterlab \
    jupyterlab_flake8

RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    japanize_matplotlib \
    seaborn \
    jquants-api-client \
    scikit-learn \
    plotly

RUN pip install --no-cache-dir \
    xgboost \
    shap \
    tqdm \
    statsmodels

RUN mkdir workspace

ENTRYPOINT ["jupyter-lab","--allow-root","--ip=0.0.0.0","--port=8888","--no-browser","--NotebookApp.token=''","--notebook-dir=/workspace"]
