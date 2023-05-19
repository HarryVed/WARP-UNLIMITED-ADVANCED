FROM python:3.9-alpine

WORKDIR /app

RUN apk add --no-cache curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apk add --no-cache nodejs
RUN node --version && npm --version

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x run.sh

CMD ["bash","run.sh"]
# CMD ["python3","warp-plus.py"]
