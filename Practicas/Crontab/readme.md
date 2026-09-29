# 🖥️ Monitor de Salud de la Computadora con Cron

![Linux](https://img.shields.io/badge/Linux-Ubuntu_Desktop-E95420?logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Script-Bash-4EAA25?logo=gnubash&logoColor=white)
![Cron](https://img.shields.io/badge/Automatización-Cron-blue)
![Frecuencia](https://img.shields.io/badge/Frecuencia-cada_2_minutos-success)

> Práctica de Linux: un script en Bash que se ejecuta **en segundo plano cada 2 minutos** mediante `cron` y registra la "salud" de mi computadora (RAM, almacenamiento y procesador) en mi carpeta personal.

---

## 🧭 Navegación rápida

| Sección | Enlace |
|---|---|
| 📌 Introducción | [Ir](#-introducción) |
| 🎯 Objetivo | [Ir](#-objetivo) |
| 🛠️ Desarrollo paso a paso | [Ir](#️-desarrollo-paso-a-paso) |
| 📸 Evidencias | [Ir](#-evidencias) |
| 📊 **Reporte generado** | [📂 Abrir carpeta de reportes](./reportes/) · [📄 Ver `salud_pc.log`](./reportes/salud_pc.log) |
| ✅ Conclusiones | [Ir](#-conclusiones) |

---

## 📌 Introducción

Al usar Ubuntu Desktop para estudiar o programar, abrimos múltiples pestañas en el navegador (Chrome/Firefox), reproductores de música, editores de código y terminales. Esto puede saturar la **memoria RAM** y llenar el **almacenamiento** de la computadora sin que nos demos cuenta.

## 🎯 Objetivo

Como usuario avanzado de Linux, crear una **tarea automatizada** que se ejecute en segundo plano cada 2 minutos y registre la "salud" de mi computadora en mi propia carpeta personal (`~`).

---

## 🛠️ Desarrollo paso a paso

### 1️⃣ Crear el script `salud_pc.sh`

Se creó el archivo en la carpeta personal con el editor `gedit`:

```bash
sudo gedit salud_pc.sh
```

<details>
<summary><b>👉 Haz clic para ver el contenido del script</b></summary>

```bash
#!/bin/bash

echo "============================================="
echo "SALUD DE LA COMPUTADORA"
echo "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================="
echo ""
echo "--- MEMORIA RAM ---"
free -h
echo ""
echo "--- ALMACENAMIENTO ---"
df -h
echo ""
echo "--- PROCESADOR ---"
uptime
echo ""
```

| Sección | Comando | Qué muestra |
|---|---|---|
| Memoria RAM | `free -h` | Total, usada, libre y disponible (RAM y swap) |
| Almacenamiento | `df -h` | Espacio usado y disponible por partición |
| Procesador | `uptime` | Tiempo encendido, usuarios y carga promedio (1, 5 y 15 min) |

</details>

### 2️⃣ Dar permisos de ejecución

```bash
sudo chmod 777 ~/salud_pc.sh
```

> 💡 **Nota:** `777` funciona, pero da permisos totales a cualquier usuario. Para un script personal es más seguro usar `chmod 755 ~/salud_pc.sh` (o `chmod +x`).

### 3️⃣ Probar el script manualmente

```bash
~/salud_pc.sh
```

Antes de automatizarlo, se verificó que imprimiera correctamente la información en pantalla.

### 4️⃣ Programar la tarea en cron

Se abrió el editor de crontab:

```bash
crontab -e
```

Y se agregó la siguiente línea:

```cron
*/2 * * * * /home/chullv/salud_pc.sh >> /home/chullv/salud_pc.log 2>&1
```

<details>
<summary><b>👉 Haz clic para entender cada parte de la línea</b></summary>

| Campo | Valor | Significado |
|---|---|---|
| Minuto | `*/2` | Cada 2 minutos |
| Hora | `*` | Todas las horas |
| Día del mes | `*` | Todos los días |
| Mes | `*` | Todos los meses |
| Día de la semana | `*` | Todos los días de la semana |
| Comando | `/home/chullv/salud_pc.sh` | Script a ejecutar |
| `>>` | `salud_pc.log` | **Agrega** la salida al final del log sin borrar lo anterior |
| `2>&1` | | Envía también los errores al mismo archivo |

</details>

Al guardar, el sistema confirmó con el mensaje `crontab: installing new crontab`.

### 5️⃣ Verificar el registro

```bash
tail ~/salud_pc.log    # últimas líneas del log
cat ~/salud_pc.log     # log completo
```

---

## 📸 Evidencias

> 🔍 **Haz clic en cualquier imagen para verla en tamaño completo.**

### Configuración: script, permisos, crontab y lectura del log

[![Evidencia 1 - Configuración de cron y lectura del log](./img/crontab2.png)](./img/crontab2.png)

En la captura se observa la creación del script, el cambio de permisos, la instalación del crontab y la lectura del log con `tail` y `cat`.

### Ejecución automática cada 2 minutos

[![Evidencia 2 - Ejecuciones automáticas del reporte](./img/crontab1.png)](./img/crontab1.png)

Aquí se ve cómo `cron` ejecutó el script de forma automática a las **15:56:01** y a las **15:58:01**, es decir, **exactamente cada 2 minutos**.

---

## 📊 Reporte generado

| Recurso | Enlace |
|---|---|
| 📂 Carpeta de reportes | [**`/reportes`**](./reportes/) |
| 📄 Archivo de log | [**`reportes/salud_pc.log`**](./reportes/salud_pc.log) |

<details>
<summary><b>👉 Haz clic para ver un ejemplo de una ejecución del reporte</b></summary>

```text
=============================================
SALUD DE LA COMPUTADORA
Fecha y hora: 2026-09-29 15:56:01
=============================================

--- MEMORIA RAM ---
               total       usado       libre  compartido  búf/caché  disponible
Mem:           7.0Gi       3.3Gi       1.9Gi       136Mi       2.2Gi       3.7Gi
Inter:         511Mi          0B       511Mi

--- ALMACENAMIENTO ---
S.ficheros     Tamaño Usados  Disp Uso% Montado en
tmpfs            712M   2.1M  710M   1% /run
/dev/nvme0n1p5    68G    13G   52G  20% /
tmpfs            3.5G    47M  3.5G   2% /dev/shm
/dev/nvme0n1p1   256M    90M  167M  35% /boot/efi

--- PROCESADOR ---
 15:56:01 up 47 min,  1 user,  load average: 0.09, 0.15, 0.23
```

</details>

### 🔎 Interpretación de los resultados

| Recurso | Valor observado | Estado |
|---|---|---|
| 🧠 RAM | 3.3 Gi usados de 7.0 Gi (3.7 Gi disponibles) | 🟢 Saludable |
| 💾 Disco `/` | 13 G usados de 68 G (20 %) | 🟢 Saludable |
| ⚙️ Carga del CPU | 0.09, 0.15, 0.23 | 🟢 Muy baja |

---

## 🧰 Comandos útiles de gestión

```bash
crontab -l                       # Ver las tareas programadas
crontab -e                       # Editar las tareas programadas
tail -f ~/salud_pc.log           # Ver el log en vivo
crontab -r                       # ⚠️ Eliminar TODAS las tareas de cron
```

---

## ✅ Conclusiones

- Se automatizó el monitoreo de **RAM, almacenamiento y procesador** sin intervención manual.
- `cron` permite ejecutar tareas periódicas en segundo plano de forma confiable.
- El operador `>>` conserva el historial completo de mediciones, útil para detectar cuándo se satura el sistema.
- Con este registro es posible identificar tendencias de consumo de recursos antes de que causen problemas.

---

## 📁 Estructura del proyecto

```text
.
├── README.md
├── img/
│   ├── crontab1.png
│   └── crontab2.png
└── reportes/
    ├── README.md
    └── salud_pc.log
```

<p align="center">
  <a href="#️-monitor-de-salud-de-la-computadora-con-cron">⬆️ Volver arriba</a>
</p>

