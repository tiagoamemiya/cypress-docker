FROM cypress/included:9.5.1

ARG user=cypress-app
ARG uid=1000
ARG gid=1000

# make directory inside container
RUN mkdir /app

WORKDIR /app
# copy cypress code from host to container
COPY . /app

RUN groupadd -g $gid -o $user
RUN useradd -m -u $uid -g $gid -o -s /bin/bash $user

USER $user

ENTRYPOINT ["tail", "-f", "/dev/null"]
