from 	chimbuko/nwchem:v2
RUN  	mkdir -p /OAS
WORKDIR /OAS
RUN	pip3 install pillow opencv-python
RUN	apt install openbabel
ADD	. /OAS
RUN	make
