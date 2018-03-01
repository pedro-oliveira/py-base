FROM python:3.6.4-alpine3.7
 
# install python build tools and dependencies
RUN apk add --no-cache libstdc++
RUN apk add --no-cache --virtual .build-deps \
	    gcc \
	    build-base

# install numpy first            
RUN pip install --no-cache numpy

# add useful sym link and install pandas and scipy
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h &&\
    pip install --no-cache pandas scipy &&\ 
    apk del .build-deps