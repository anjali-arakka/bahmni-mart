FROM amazoncorretto:8

COPY build/libs/bahmni-mart*.jar /bahmni-mart/app.jar
COPY package/docker/files/ /bahmni-mart
COPY conf /bahmni-mart/conf

RUN chmod +x /bahmni-mart/setup.sh

RUN apt-get update && apt-get upgrade
RUN apt-get install -y cron

CMD ["sh", "./bahmni-mart/setup.sh"]