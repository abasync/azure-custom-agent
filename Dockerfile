FROM docker:27-dind
ENV TARGETARCH="linux-musl-x64"

# Another option:
# FROM arm64v8/alpine
# ENV TARGETARCH="linux-musl-arm64"

RUN apk update
RUN apk upgrade
RUN apk add bash curl git icu-libs jq aws-cli nodejs npm

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN adduser -D agent
RUN chown agent ./

USER agent

RUN mkdir -p ~/.npm-global/lib
RUN npm config set prefix '~/.npm-global'
ENV PATH=/home/agent/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=~/.npm-global

# Another option is to run the agent as root.
ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT [ "./start.sh" ]
