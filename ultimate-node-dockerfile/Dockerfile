FROM node:8-slim as base

LABEL org.opencontainers.image.authors=bret@bretfisher.com
LABEL org.opencontainers.image.title="Node.js Ultimate Dockerfile"
LABEL org.opencontainers.image.licenses=MIT
LABEL com.bgeyer.nodeversion=$NODE_VERSION

ENV NODE_ENV=production

EXPOSE 8080

WORKDIR /app

COPY package*.json ./

RUN npm config list \
    && npm ci \
    && npm cache clean --force

ENV PATH /app/node_modules/.bin:$PATH

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["node", "server.js"]


# Developer 
FROM base as dev

ENV NODE_ENV=development

RUN apt-get update -qq && apt-get install -qy \ 
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    --no-install-recommends

RUN npm config list \
    && npm install --only=development \
    && npm cache clean --force

USER node

CMD ["nodemon", "server.js"]

#Test 
FROM dev as test
COPY . .
RUN npm audit fix
RUN npm audit

# aqua microscanner, which needs a token for API access
# note this isn't super secret, so we'll use an ARG here
# https://github.com/aquasecurity/microscanner
#ARG MICROSCANNER_TOKEN
# ADD https://get.aquasec.com/microscanner /
#USER root
#RUN chmod +x /microscanner
#RUN /microscanner $MICROSCANNER_TOKEN --continue-on-failure

#pre production
FROM test as pre-prod
RUN rm -rf ./tests && rm -rf ./node_modules

# Production
FROM base as prod
COPY --from=pre-prod /app /app
HEALTHCHECK CMD curl http://127.0.0.1 || exit 1
USER node