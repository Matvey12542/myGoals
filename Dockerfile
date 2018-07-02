FROM golang

ARG app_env
ENV APP_ENV $app_env

COPY ./src/github.com/mmateychuk/myGoals /go/src/github.com/user/myGoals/app
WORKDIR /go/src/github.com/user/myGoals/app

RUN go get ./
RUN go build

CMD if [ ${APP_ENV} = production ]; \
	then \
	app; \
	else \
	go get github.com/pilu/fresh && \
	fresh; \
	fi

EXPOSE 8081