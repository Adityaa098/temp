@echo off
echo === IntelliInspect Docker Build Script ===

REM Clean up any existing containers
echo Cleaning up existing containers...
docker compose down -v
docker system prune -f

REM Create Storage directory if it doesn't exist
echo Creating Storage directory...
if not exist "Storage" mkdir Storage

echo Building and starting services...
docker compose up --build

echo === Build complete ===
echo Services should be available at:
echo   - Frontend: http://localhost:4200
echo   - Backend API: http://localhost:5230
echo   - ML Service: http://localhost:8000

pause