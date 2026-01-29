#!/bin/bash

echo "activando el entorno virtual"
if [ ! -d "venv" ]; then
    echo "creando el entorno virtual"
    python3 -m venv venv
fi
source venv/bin/activate

echo "instalando independencias"
pip install --upgrade pip
pip install -r requirements.txt

echo "ejecutando pruebas con pytest"
pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas resultados en reports"