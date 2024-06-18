# serverless-sample

## Required

* Docker
* VS Code
  * Extensions: [Dev Containers](vscode:extension/ms-vscode-remote.remote-containers)

## Folder Structure

<pre>
./
├── docs/
│  ├── adr/
│  │  └── …
│  ├── adr/
│     ├── dist/
│     │  └── architecture.svg
│     └── src/
│        └── architecture.drawio
│  └── diagram/
│     ├── dist/
│     │  └── architecture.svg
│     └── src/
│        └── architecture.drawio
├── terraform/
│  ├── envs/
│  │  ├── _share/
│  │  │  ├── main.tf
│  │  │  ├── outputs.tf
│  │  │  ├── README.md
│  │  │  ├── variables.tf
│  │  │  └── versions.tf
│  │  ├── dev/
│  │  │  ├── files/
│  │  │  │  └── gpg.public.key
│  │  │  ├── backend.tf
│  │  │  ├── main.tf -> ../_share/main.tf
│  │  │  ├── outputs.tf -> ../_share/outputs.tf
│  │  │  ├── README.md -> ../_share/README.md
│  │  │  ├── terraform.tfvars
│  │  │  ├── variables.tf -> ../_share/variables.tf
│  │  │  └── versions.tf -> ../_share/versions.tf
│  │  └── …
│  └── modules/
│     ├── billing/
│     │  ├── main.tf
│     │  ├── outputs.tf
│     │  ├── README.md
│     │  ├── variables.tf
│     │  └── versions.tf
│     └── …
└── README.md
</pre>

## [Redocly CLI Commands](https://redocly.com/docs/cli/commands/#redocly-cli-commands)

### Lint

```sh
redocly lint docs/open_api/src/sample_api.yaml
```

### Preview Docs

```sh
redocly preview-docs docs/open_api/src/sample_api.yaml
```

### Generate HTML file

```sh
redocly build-docs docs/open_api/src/sample_api.yaml --output=docs/open_api/dist/sample_api.html
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

## Terraform Commands

### Validate

```sh
terraform validate
```

### See execution plan by Terraform

```sh
terraform plan
```

### Create resource

```sh
terraform apply
```

### See resource status

```sh
terraform show
```

### See execution plan by delete resource

```sh
terraform plan -destroy
```

### Delete resource

```sh
terraform destroy
```

#### Automatic code formatting

```sh
terraform fmt
```
