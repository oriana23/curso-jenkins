#!/bin/bash

echo "Iniciando ejecuciòn de pruebas Jenkins..."

# Verificar si el entorno virtual existe
if [ ! -d "venv" ]; then
    echo "Entorno virtual no encontrado. Creandolo..."
    python3 -m venv venv
fi

# Activar el entorno virtual correctamente
echo "activando el entorno virtual"
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
else
    echo "No se pudo activar el entorno virtual"
    exit 1
fi

# Verificar si pip esta instalado correctamente
echo "instalando independencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

mkdir -p reports

echo "ejecutando pruebas con pytest"
pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"