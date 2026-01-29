#!/bin/bash

echo "Iniciando ejecución de pruebas Jenkins..."

# 1. Asegurarnos de estar en la carpeta correcta
cd proyeto_pytest || exit 1

# 2. Crear entorno virtual asegurando que incluya pip
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv --without-pip
    curl https://bootstrap.pypa.io/get-pip.py | ./venv/bin/python3
fi

# 3. Activar el entorno (Uso de variables de entorno para mayor compatibilidad)
echo "Activando el entorno virtual..."
export VIRTUAL_ENV="./venv"
export PATH="$VIRTUAL_ENV/bin:$PATH"

# 4. Instalar dependencias usando el python del venv directamente
echo "Instalando dependencias..."
./venv/bin/python3 -m pip install --upgrade pip
./venv/bin/python3 -m pip install pytest pytest-html

# 5. Crear carpeta de reportes
mkdir -p reports

# 6. Ejecutar pruebas
echo "Ejecutando pruebas con pytest..."
./venv/bin/python3 -m pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas."