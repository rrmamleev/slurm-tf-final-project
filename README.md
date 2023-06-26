# Slurm DevOps Upgrade: Terraform practice (Yandex Cloud provider)

## Подготовка к работе

 Для работы необходимы:
 1. Yandex Cloud CLI
 2. Terraform
 3. Packer
 4. Ansible

Необходимо инициализируем **Yandex Cloud CLI** и экспортируем переменные
```
yc init
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
export YC_TOKEN=$(yc config get token)
export TF_VAR_folder_id=$(yc config get folder-id)
```

## Работа с Packer

```
cd packer
packer init .
packer build .
```
> При необходимости можно изменить имя тега: packer build -var 'image_tag=1-0-0' .

## Работа с Terraform

Перейдите в директорию **Terraform**:
```
cd terraform
terraform init
terraform apply
```

> При необходимости можно изменить имя тега: в файле terraform.tfvars исправьте image_tag = "1-0-0" на необходимый тег.

## Удаление ресурсов

```
terraform destroy
```
