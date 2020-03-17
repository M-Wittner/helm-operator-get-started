FROM mhart/alpine-node:12

WORKDIR /app

RUN echo ${GITCOMMIT} > commit.txt \
	&& echo ${VERSION} > version.txt

ADD . ./
RUN yarn

ENTRYPOINT ["yarn", "run", "start"]
