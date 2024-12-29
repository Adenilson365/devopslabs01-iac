### Terraform GCP (Google Cloud Platform)
- Cria uma VPC no GCP
- Cria um cluster do GKE

### Objetivos
- Praticar Terraform
- Preticar modules do Terraform
- Prover infraestrutura básica para os Laboratórios de estudos de Kubernetes e DevOps


###  Como usar

- Crie o arquivo terraform.tfvars com os valores para as variáveis do variables.tf do main, seguindo o exemplo:

```HCL
vpc_name = "nome_da_sua_vpc"
```
- Crie uma key para sua service account na gcp e salve na raiz com o nome credentials.json

- crie o arquivo providers como abaixo:
```HCL
provider "google" {
  project     = "id_projeto_google_cloud"
  credentials = file("./credentials.json")
  region      = "região_onde_serão_criados_resources"
}
```
- Crie seu bucket no GCS e crie o arquivo de backend como abaixo:

```HCL
terraform {
  backend "gcs" {
    bucket      = "nome_seu_bucket"
    prefix      = "terraform/state"
    credentials = "./credentials.json"
  }
}

data "terraform_remote_state" "remote" {
  backend = "gcs"
  config = {
    bucket = "nome_seu_bucket"
    prefix = "prod"

  }
}
```

