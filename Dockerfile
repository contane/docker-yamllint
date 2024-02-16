FROM python:3.12-alpine3.19

# Note: Labels are applied automatically by the CI/CD pipeline

RUN addgroup -g 1000 yamllint && \
    adduser -u 1000 -G yamllint -s /bin/sh -D yamllint
RUN pip3 install --root-user-action=ignore --no-cache-dir --no-compile "yamllint==v1.35.1"

WORKDIR /data
ENTRYPOINT ["yamllint"]
CMD ["--help"]
