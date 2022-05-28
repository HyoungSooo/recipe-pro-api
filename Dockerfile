FROM python:3.9-alpine3.13

LABEL maintainer="https://sahs-kr.tistory.com/"

ENV PYTHONUNBUFFERPED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    # postgresql-client intall pycopgy2가 postgressql에 접속할 수 있도록 함.
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-bulid-deps \
      build-base postgresql-dev musl-dev && \ 
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = true ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt; \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-bulid-deps && \
    adduser \
        --no-create-home \
        --disabled-password \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user