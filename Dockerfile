FROM node:17-alpine3.14

RUN addgroup app && adduser -S -G app app

WORKDIR /home/app/web
RUN chown -R app:app $(pwd)

COPY --chown=app:app package*  ./
RUN ["npm", "i"]

COPY --chown=app:app . .

USER app

EXPOSE 3000

CMD ["npm", "start"]