# serverless-sample

## Required

* Docker
* VS Code
  * Extensions: [Dev Containers](vscode:extension/ms-vscode-remote.remote-containers)

## [Redocly CLI Commands](https://redocly.com/docs/cli/commands/#redocly-cli-commands)

### Lint

```sh
redocly lint open_api/sample.yaml
```

### Preview Docs

```sh
redocly preview-docs open_api/sample.yaml 
```

### Generate HTML file

```sh
redocly build-docs open_api/sample.yaml --output=outputs/sample_api.html
```

## Trouble Shooting

### Error on git connection

ex. git pull origin main

```sh
git pull origin source
# fatal: unable to access 'https://github.com/<<remote-url>>/': server certificate verification failed. CAfile: none CRLfile: none
```

Execute the following commands  
※Dev container, so once this way around

```sh
git config --local http.sslverify false
```
