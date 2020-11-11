FROM golang as builder

WORKDIR /src

RUN git clone https://github.com/grafana-tools/sdk /src

COPY * .
RUN make build

FROM golang

COPY --from=builder /src/out/* /
COPY ./grafana-tools.sh /.

RUN mkdir /grafana-data

VOLUME [ "/grafana-data" ]
ENTRYPOINT ["/grafana-tools.sh"]
