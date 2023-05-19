FROM python:3.9-alpine

WORKDIR /app

# Install necessary packages
RUN apk add --no-cache curl && \
    apk add --no-cache bash && \
    apk add --no-cache make && \
    apk add --no-cache gcc && \
    apk add --no-cache g++ && \
    apk add --no-cache linux-headers && \
    apk add --no-cache binutils-gold && \
    apk add --no-cache libstdc++

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apk add --no-cache nodejs
RUN node --version && npm --version

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x run.sh

CMD ["sh","run.sh"]
# CMD ["python3","warp-plus.py"]
