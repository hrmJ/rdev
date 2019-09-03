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

# pandoc

RUN wget https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb
RUN sudo dpkg -i pandoc-2.7.3-1-amd64.deb



COPY presentationTemplate/ "/home/$DOCKER_USER/presentationTemplate"


# test

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

RUN ~/.fzf/install

RUN echo "set rtp+=~/.fzf" >> ~/.config/nvim/init.vim

RUN sudo Rscript -e 'install.packages("remotes", repos="https://cran.rstudio.com", dependencies=TRUE)'

RUN sudo apt update && \
    sudo apt install -y locales && \
    sudo apt install -y locales-all && \
    sudo rm -rf /var/lib/apt/lists/*


ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN sudo Rscript -e 'install.packages("pbapply", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("kableExtra", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("reshape", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("coda", repos="https://cran.rstudio.com", dependencies=TRUE)'

RUN sudo apt update && \
    sudo apt install -y jags && \
    sudo rm -rf /var/lib/apt/lists/*


RUN sudo Rscript -e 'install.packages("rjags", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'install.packages("runjags", repos="https://cran.rstudio.com", dependencies=TRUE)'
RUN sudo Rscript -e 'remotes::install_github("hrmJ/phdR")'

RUN sudo apt update && \
    sudo apt install -y libcurl4-gnutls-dev libcairo2-dev libudunits2-dev && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt update && \
    sudo apt install -y libcairo2-dev libxt-dev libgdal-dev && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo Rscript -e 'install.packages("plotly", repos="https://cran.rstudio.com", dependencies=TRUE)'
# RUN sudo Rscript -e 'remotes::install_github("yihui/xaringan")'


# INSTALL tex support for bookdown and stuff
RUN echo "moro"

#RUN sudo apt update && \
#    sudo apt install -y texlive-base &&\
#    sudo rm -rf /var/lib/apt/lists/*

