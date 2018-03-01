FROM python:3.6.4-alpine3.7

# install build tools
RUN apk add --no-cache build-base python3-dev  &&\
    pip install --upgrade twine travis pip setuptools wheel virtualenv

# install numpy package first
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h &&\
    pip install --no-cache numpy

# install pandas and scipy packages and required dependencies
RUN apk add --no-cache --virtual .build-deps gcc openblas-dev &&\
    pip install --no-cache pandas scipy &&\
    apk del .build-deps

CMD ["python"]