FROM alpine:latest 
RUN apk --no-cache add bash
WORKDIR /app
COPY proyecto.sh proyecto.sh
RUN chmod +x proyecto.sh
ENTRYPOINT ["/app/proyecto.sh"]