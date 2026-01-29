#!/bin/bash
set -e
echo "Iniciando ejecución de pruebas Jenkins..."

# 1. Si el venv existe pero no tiene pip, lo borramos para recrearlo bien
if [ -d "venv" ] && [ ! -f "venv/bin/pip" ]; then
    echo "Entorno virtual corrupto detectado. Limpiando..."
    rm -rf venv
fi

# 2. Crear entorno virtual con pip asegurado
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
    # Forzar instalación de pip si falta (algunas versiones de Linux lo omiten)
    ./venv/bin/python3 -m ensurepip --upgrade || curl https://bootstrap.pypa.io/get-pip.py | ./venv/bin/python3
fi

# 3. Activar y actualizar
export VIRTUAL_ENV="./venv"
export PATH="$VIRTUAL_ENV/bin:$PATH"

echo "Instalando dependencias..."
python3 -m pip install --upgrade pip
python3 -m pip install pytest pytest-html

# 4. Reportes y Ejecución
mkdir -p reports
echo "Ejecutando pruebas con pytest..."
python3 -m pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas."