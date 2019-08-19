FROM nvimdev

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
    sudo apt update && \
    sudo apt install -y r-base

RUN sudo apt update && \
    sudo apt install -y littler && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt update && \
    sudo apt install -y libcurl4-openssl-dev  libxml2-dev libssl-dev  && \
    sudo rm -rf /var/lib/apt/lists/*


RUN sudo Rscript -e 'install.packages("tidyverse", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("rmarkdown", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("bookdown", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("DiagrammR", repos="https://cran.rstudio.com", dependencies=TRUE)'

# test
