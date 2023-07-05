FROM bitnami/node
EXPOSE 80
RUN mkdir /aptypo.io
WORKDIR /aptypo.io
COPY . /aptypo.io
RUN npm install
RUN npm install -g http-server
RUN npm run build
COPY --from=ghcr.io/aptypo/react-tetris:main /tetris/build /aptypo.io/build/tetris
ENTRYPOINT ["http-server", "-p", "80", "build"]