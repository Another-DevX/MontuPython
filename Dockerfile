# Usamos una imagen base de Python 3.10
FROM python:3.10-slim-buster

# Establecemos el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiamos el archivo requirements.txt al directorio de trabajo
COPY requirements.txt ./

# Instalamos las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código de la aplicación al directorio de trabajo
COPY montu-app/ /usr/src/app/

# Exponemos el puerto en el que se ejecutará la aplicación
EXPOSE 8060

# Especificamos el comando para iniciar la aplicación
CMD ["gunicorn", "-b", "0.0.0.0:8060", "app:server"]
