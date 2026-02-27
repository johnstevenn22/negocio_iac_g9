## Guia completa - Despligue de Infraestructura 

1. Generar una clave con una cuenta en AWS

Ir a Amazon Web Services, crear un usuario con permiso como Aministrador Acces

Instalar AWS CLI segun tu sistema operativo

Configurar AWS CLI dentro de la terminal 

```
aws configure
```

Posteriormente ingresar las credenciales 

```
AWS Acces Key ID
AWS Secret Acces Key
```

2. Git Pull
   
Instalar Git y verificar la instalacion 

 ```
 git --version
 ```

Configurar Git con tus datos

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu-email@ejemplo.com"

# Verificar configuración
git config --list
```

 Clonar el repositorio con git

 ```
git clone https://github.com/johnstevenn22/negocio_iac_g9.git
 ```

Actualizar el repositorio desde su rama principal, dependiendo de donde se este trabajando, en este caso la rama de desarrollo es develop.




```bash
git pull origin main

git pull origin develop

#Evaluamos el estado del repositorio
git status
```

Para movernos de una rama a otra ejecutamos:

```
git checkout nombreDeLaRama
```


1. Instalar dependencias 

Verificar la instalacion de terraform:

```
terraform --version
```



4. Testing de aplicacion 

Inicializamos el directorio del trabajo:

```bash 
terraform init

# Resultado esperado: 
Terraform has been successfully initialized!
```






5. Calidad de Aplicacion 

En este caso usaremos SonarQube

Crear una nueva carpeta que se llame docker-compose.yaml

```bash
services:

  sonarqube:

    container_name: sonarqube

    image: sonarqube:latest

    ports:

      - 9000:9000
```

Segundo ejecutamos el comando 

```
npm init

npm install --save-dev sonarqube-scanner
```

Luego se agrega una fraccion de codigo en el .json

```bash
# Dentro de los scprits se debe mostrar algo como:
 "sonar": "npx sonarqube-scanner -Dsonar.host.url=http://localhost:9000 -Dsonar.projectKey=negocio_iac_g9 -Dsonar.sources=."
 ```

Ejecutamos SonarQube

```
npm run sonar
```

Luego abrimos el localhost: 9000 e insertamos el usuario y contraseña predeterminados: admin para luego cambiar la contraseña 

6. Instalar dependencias de Infraestructura 


7. Test de vulnerabilidades 

Checkov escanea el código de Terraform en busca de configuraciones inseguras antes del despliegue

Abrir docker compose

Ejecutar el siguiente comando en la terminal 

```
docker pull bridgecrew/checkov:3

docker run --rm -v ./iac:/tf --workdir /tf bridgecrew/checkov:3 --directory /tf -o junitxml --output-file-path results.xml
```

los resultados que se generen al momento de ejecutar los comandos anteriores ingresarlo en la siguiente url:

https://lotterfriends.github.io/online-junit-parser/#suite.0 

Esto nos ayudara a visualizar los resultados del test de checkov

8. Despliegue 

Generar el plan de ejecucion (este comando no aplicara cambios, solo mostrara que hara)

```bash 
terraform plan

# Nos debe mostrar una salida como:
Plan: 12 to add, 2 to change, 0 to destroy
```

Aplicar la infraestructura de manera manual con 

```bash
terraform apply

# Salida esperada
Apply complete! Resources: 12 added, 2 changed, 0 destroyed.

# Verificar el historial de estados 
terraform state list

# De ser el caso de presentar algun error ejecutar
terraform destroy 
```
