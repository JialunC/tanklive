FROM alexellis2/streaming:17-5-2017
COPY entry.sh entry.sh
RUN chmod +x entry.sh
ENTRYPOINT ["./entry.sh"]