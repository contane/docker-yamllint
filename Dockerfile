FROM python:3.13-alpine3.20

# Note: Labels are applied automatically by the CI/CD pipeline

RUN addgroup -g 1000 yamllint && \
    adduser -u 1000 -G yamllint -s /bin/sh -D yamllint
RUN pip3 install --root-user-action=ignore --no-cache-dir --no-compile "yamllint==v1.36.1"

WORKDIR /data
ENTRYPOINT ["yamllint"]
CMD ["--help"]
