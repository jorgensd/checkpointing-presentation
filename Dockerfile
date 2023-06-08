FROM ghcr.io/fenics/dolfinx/lab:nightly 
WORKDIR /tmp
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
ADD jupyter_config/jupyter_server_config.py /root/.jupyter/jupyter_server_config.py
ADD jupyter_config/python_adios_kernel.json /usr/local/share/jupyter/kernels/python3-adios/kernel.json
ENV PKG_CONFIG_PATH=/usr/local/dolfinx-real/lib/pkgconfig:$PKG_CONFIG_PATH
ENV PETSC_DIR=/usr/local/petsc/,
ENV PETSC_ARCH=linux-gnu-real-32
ENV PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/dolfinx-real/lib/python3.10/dist-packages:$PYTHONPATH
ENV LD_LIBRARY_PATH=/usr/local/dolfinx-real/lib:$LD_LIBRARY_PATH