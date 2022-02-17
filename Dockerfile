FROM continuumio/anaconda3:latest

RUN pip install --upgrade pip && \
    pip install autopep8 && \
    pip install Keras && \
    pip install tensorflow

WORKDIR /opt

EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser" , "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/opt"]