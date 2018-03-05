# our R base image
FROM trestletech/plumber

# Update the kernel
RUN apt-get update

# Important additional libraries
RUN apt-get --assume-yes install -f \
	libssl-dev \
	libcurl4-openssl-dev \
	libxml2-dev \
	libssh2-1-dev \
	libmime-base64-urlsafe-perl \
	libdigest-hmac-perl \
	libdigest-sha-perl \
	libxml2-dev \
	libssl-dev \
	libpq-dev \
	libcurl4-openssl-dev \
	libopenblas-dev \
	nano \
	curl \
	vim \
	gdebi \
	unixodbc-dev

# Open the port
EXPOSE 8000

# --
RUN mkdir microservice

# Add files to the folder we make previously
COPY src/* /microservice/

# Install the R packages we need
RUN Rscript /microservice/requirements.R

# Create an entrypoint
ENTRYPOINT ["Rscript", "/microservice/web.R"]
