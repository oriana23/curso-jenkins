#!/bin/bash

echo "Iniciando ejecución de pruebas Jenkins..."

# 1. Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
fi

# 2. Activar el entorno virtual
# Usamos '.' que es más compatible en shells de Jenkins
echo "Activando el entorno virtual..."
. venv/bin/activate

# 3. Instalar dependencias
echo "Instalando dependencias..."
pip install --upgrade pip
# Instalamos pytest directamente por si no está en requirements.txt
pip install pytest pytest-html
# Si tienes el archivo, descomenta la siguiente línea:
# pip install -r requirements.txt

# 4. Crear carpeta de reportes
mkdir -p reports

# 5. Ejecutar pruebas
echo "Ejecutando pruebas con pytest..."
# Usamos 'python3 -m pytest' para asegurar que use el del venv
python3 -m pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas. Resultados en la carpeta 'reports'."