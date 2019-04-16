FROM ruby:alpine

RUN apk --no-cache --update add tmux && gem install tmuxinator

ENTRYPOINT ["tmuxinator"]
