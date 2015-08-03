FROM ruby

RUN apt-get -qq update \
    && apt-get -qqy install xvfb libav-tools unzip \
    && gem install selenium-cucumber

COPY ./script/setup-browsers /setup-browsers
ENV FIREFOX_VERSION 39.0
ENV GOOGLE_CHROME_DATE Tue, 28 Jul 2015 17:56:00 GMT
ENV CHROMEDRIVER_VERSION 2.16
RUN /setup-browsers

ENV SCREEN_WIDTH 1024
ENV SCREEN_HEIGHT 768
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0
ENV BROWSER ff

COPY ./app-tests-example /app-tests
COPY ./script/docker-entrypoint /docker-entrypoint

WORKDIR /app-tests
ENTRYPOINT ["/docker-entrypoint"]
CMD ["cucumber"]
