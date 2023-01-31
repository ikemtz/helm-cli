# helm-cli
A Container Image with Helm, and the OpenShift CLI applications preloaded.

In addition, the [Chart Museum cm-push](https://github.com/chartmuseum/helm-push) plugin has also been preloaded.

Example usage:
```Docker
FROM ikemtz/helm-cli
COPY your-helm-chart-directory .
RUN helm lint .
RUN helm package .
```