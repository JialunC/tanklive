FROM alexellis2/streaming:17-5-2017
COPY entry.sh newentry.sh
RUN chmod +x newentry.sh
VOLUME /audio
ENTRYPOINT ["./newentry.sh"]