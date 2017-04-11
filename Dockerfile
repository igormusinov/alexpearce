FROM alexpearce/root-pandas-analysis:latest
MAINTAINER Alex Pearce <alex.pearce@cern.ch>
RUN bash -c 'source activate $CONDA_DEFAULT_ENV \
    && pip install scikit-learn pydotplus sphinx \
    && pip install git+git://github.com/arogozhnikov/hep_ml@7b9fcd4fbf8ac5fd4dd52d957ce95ff88d0f4886 \
    && pip install git+git://github.com/iminuit/probfit@78650f8516cd4d70e17d0da9a6b5424d123f5165'
ADD ci ci
RUN bash -c 'source activate $CONDA_DEFAULT_ENV \
    && pip install cython'
RUN bash -c 'source activate $CONDA_DEFAULT_ENV \
    && mkdir /notebooks'
RUN bash -c 'pip install jupyterhub notebook'
RUN bash -c 'apt-get update && apt-get install ca-certificates'
CMD "/work/ci/start_jupyter.sh"
