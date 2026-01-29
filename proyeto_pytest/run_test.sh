#!/bin/bash

echo "Iniciando ejecución de pruebas Jenkins..."

# 2. Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv --without-pip
    curl https://bootstrap.pypa.io/get-pip.py | ./venv/bin/python3
fi

# 3. Activar el entorno
export VIRTUAL_ENV="./venv"
export PATH="$VIRTUAL_ENV/bin:$PATH"

# 4. Instalar dependencias
echo "Instalando dependencias..."
./venv/bin/python3 -m pip install --upgrade pip
./venv/bin/python3 -m pip install pytest pytest-html

# 5. Crear carpeta de reportes y ejecutar
mkdir -p reports
echo "Ejecutando pruebas con pytest..."
./venv/bin/python3 -m pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas."