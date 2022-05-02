FROM python:3.10.4-slim-buster AS build
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt

FROM python:3.10.4-alpine
ENV PATH="/opt/venv/bin:$PATH"
COPY --from=build /opt/venv /opt/venv
ADD src/app.py .
CMD [ "python", "app.py"]
