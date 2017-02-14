# AWS Auth Proxy

This is a Docker image of
[aws-auth-proxy](https://github.com/coreos/aws-auth-proxy).

It's published on [DockerHub](https://hub.docker.com/r/vizir/aws-auth-proxy).

## Running this image
Just run this image and pass the required environment variables, for example:

```bash
docker run -d --name aws-auth-proxy \
  -p 3000:3000 \
  -e AWS_SECRET_ACCESS_KEY='<<aws-secret-key>>' \
  -e AWS_ACCESS_KEY_ID='<<aws-access-key>>' \
  -e AWS_REGION='<<aws-region>>' \
  -e ES_HOST='<<aws-host>>' vizir/aws-auth-proxy
```
