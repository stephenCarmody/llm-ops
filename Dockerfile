FROM python:3.11-slim

RUN apt-get -y update; apt-get -y install curl

ARG poetry_version=1.6.1
RUN curl -sSL https://install.python-poetry.org | python3 - --version ${poetry_version}
ENV PATH="/root/.local/bin/:$PATH"

WORKDIR /usr/src/serving 
ENV PYTHONPATH=/usr/src/

COPY pyproject.toml /usr/src/serving/pyproject.toml
COPY poetry.lock /usr/src/serving/poetry.lock

RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction --no-dev

COPY entrypoint.sh /entrypoint 
COPY serving /usr/src/serving 

EXPOSE 8080

ENTRYPOINT ["/entrypoint"]