FROM ethereum/client-go

COPY wait-for .
COPY run-scripts .

COPY scripts ./scripts