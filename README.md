# docker-yamllint

[yamllint](https://github.com/adrienverge/yamllint) packaged as a container
image, published by [Contane](https://contane.net).

## Usage

The image is Alpine-based. By default, it runs in the `/data` directory with
the root user. A non-root user named `yamllint` is also available and should
be used if possible.

See the [yamllint documentation](https://yamllint.readthedocs.io/en/stable/configuration.html)
for available configuration options that can be set in a `.yamllint.yaml` or
`.yamllint.yml` file in the working directory.

### Command Line

To run `yamllint` on the current directory:

```sh
docker run --rm --user yamllint -v $(pwd):/data contane/yamllint -f colored .
```

### GitLab CI

To use this image in a GitLab CI pipeline, add the following to your `.gitlab-ci.yml`:

```yaml
yamllint:
  stage: test
  image:
    name: contane/yamllint
    entrypoint: ["/bin/ash", "-c"]
    docker:
      user: yamllint
  script:
    - yamllint -f colored .
```
