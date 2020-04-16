FROM ruby:2.5.3 as builder

ENV APP_HOME=/figma
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME

RUN bundle install
RUN bundle exec jekyll build


FROM jekyll/jekyll
EXPOSE 4000

ENTRYPOINT ["/figma/entrypoint.sh"]

ENV APP_HOME=/figma
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY --from=builder $APP_HOME $APP_HOME

RUN chmod -R 777 $APP_HOME