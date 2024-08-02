## Proyecto gimnasio Rodrigo Furlani 
Alumno: Rodrigo Furlani

Comisión: 57190

Profesor: Anderson Ocaña

Tutor: Ariel-annone

## segunda entrega proyecto SQL
En esta parte del proyecto avance acorde se pedia en los documentos de actividades  
* Listado de Vistas más una descripción detallada, su objetivo.
* Listado de Funciones que incluyan una descripción detallada y su objetivo para la cual fueron creadas.
* Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto.
# las vistas
![image](https://github.com/user-attachments/assets/40dc3719-3e8a-47d9-9560-f0d6c5c9fc94)

## Vista de Feedback
### Objetivo:
Su objtivo es dar una visión consolidada de los comentarios y calificaciones de los clientes sobre las clases que han tomado, incluyendo detalles del cliente y la clase.

### Tablas que la componen:

* Feedback (f)
* Clientes (c)
* Clases (cl)

# Script de creacin
![image](https://github.com/user-attachments/assets/ed6fbcd8-df28-4506-803e-268bfc9b9168)

## Vista de Reservas
### Objetivo:
Su objetivo es mostrar las reservas realizadas por los clientes para las diferentes clases, incluyendo el estado de la reserva y los detalles del cliente y la clase.
## Tablas que la componen:

* Reservas (r)
* Clientes (c)
* Clases (cl)

# Script de creacion
![image](https://github.com/user-attachments/assets/69aad670-69e8-4f38-a5b7-ed45ce245bde)

## Vista de Asistencias
### Objetivo:
Proporcionar información sobre la asistencia de los clientes a las clases, indicando si estuvieron presentes y los detalles de la clase.

# Tablas que la componen:

* Asistencias (a)
* Clientes (c)
* Clases (cl)

# Script de creacion
![image](https://github.com/user-attachments/assets/50338475-f369-4622-bdb1-d39c396a7df0)

## Vista de Clases y Horarios
### Objetivo:
Proveer un resumen de las clases y sus horarios, facilitando la consulta de la programación de clases.

# Tablas que la componen:

* Clases (c)
* Horarios (h)

# Script de creacion
![image](https://github.com/user-attachments/assets/1a9e6339-d8ee-4eec-923b-f6f15fa38e09)

## Vista de Clientes y Rutinas
### Objetivo:
Mostrar las rutinas asignadas a los clientes, incluyendo detalles del cliente, la rutina y el entrenador responsable.

# Tablas que la componen:

* Clientes (c)
* Rutinas (r)
* Entrenadores (e)

# Script de creacion:
![image](https://github.com/user-attachments/assets/44e2e7a2-9e9a-406c-bfc1-4724dbb4a856)

## Vista de Entrenadores y Clases
### Objetivo:
Proporcionar una visión de las clases impartidas por cada entrenador, detallando tanto la especialidad del entrenador como la descripción de las clases.

Tablas que la componen:

* Entrenadores (e)
* Clases (c)
# Script de creacion:
![image](https://github.com/user-attachments/assets/7cb2754a-00f0-4123-b145-13cc9c8a14cb)

# Funciones 
![image](https://github.com/user-attachments/assets/b3f49b19-aabd-4ece-b8bc-30fc41f733bb)
## 1) Función calcularTotalPagado
## Objetivo:
La función calcularTotalPagado tiene de objetivo calcular el total de pagos realizados por un cliente específico identificado por su CUIL.
# Script de creacion:
![image](https://github.com/user-attachments/assets/432c7e25-45b0-4535-84e5-7306966658fd)

*Funcionamiento:
1) Declara una variable total_pagado para almacenar el total de pagos.
2) Ejecuta una consulta que suma todos los montos de la tabla Pagos asociados al cliente cuyo CUIL coincide con el parámetro de entrada.
3) Almacena el resultado en la variable total_pagado.
4) Retorna el valor de total_pagado.
# Script de uso:
![image](https://github.com/user-attachments/assets/9d4579cd-17f2-49e4-9eed-b49dba5af6f6)

## 2) Función obtenerNombreCompletoCliente
## Objetivo:
La función "obtenerNombreCompletoCliente" tiene de objetivo obtener el nombre completo de un cliente específico identificado por su CUIL.
# Script de creacion:
![image](https://github.com/user-attachments/assets/a5d1cd20-cc1f-4f08-9b84-901791a0e05c)

#Descripción Detallada:

* Parámetro de Entrada: in_cuil de tipo VARCHAR(100), que representa el CUIL del cliente.
* Valor de Retorno: Un valor de tipo VARCHAR(200) que representa el nombre completo del cliente.
# Funcionamiento:
1) Declara una variable nombre_completo para almacenar el nombre completo del cliente.
2) Ejecuta una consulta que concatena el nombre y el apellido del cliente cuyo CUIL coincide con el parámetro de entrada.
3) Almacena el resultado en la variable nombre_completo.
4) Retorna el valor de nombre_completo.
# script de uso:
![image](https://github.com/user-attachments/assets/1844b2ce-470e-42b9-8fcb-075a4a6be51f)

# Stored Procedures
## 1) Procedimiento ReporteAsistenciaCliente
Descripción:

* Objetivo: Generar un reporte detallado de la asistencia de un cliente específico a las clases.
* Funcionamiento:
1) Parámetro de Entrada: p_id_cliente (ID del cliente).
2) Consulta: Se seleccionan los nombres de las clases, las fechas de asistencia y el estado de presencia (Presente) de la tabla Asistencias y se unen con la tabla Clases para obtener el nombre de las clases.
3) Condición: La consulta filtra los registros de asistencia para el cliente específico cuyo ID se proporciona como parámetro.
## Beneficios para el Proyecto:

1) Monitoreo de Asistencia: Facilita el seguimiento de la participación de los clientes en las clases, lo que puede ser bueno para evaluar el compromiso y la regularidad.
2) Personalización del Servicio: Permite a los entrenadores y al personal del gimnasio personalizar el seguimiento y las recomendaciones basadas en la asistencia del cliente.
3) Análisis de Comportamiento: Proporciona datos valiosos para analizar los patrones de comportamiento de los clientes y ajustar las ofertas de clases y horarios en consecuencia.
# Script de uso:
![image](https://github.com/user-attachments/assets/20bc4e54-81b0-4a30-9051-509309745e98)

# call consulta:
![image](https://github.com/user-attachments/assets/944706ab-01de-48cc-9170-7d3b73beeef3)

## 2) Procedimiento RegistrarCliente
Descripción:

* Objetivo: Registrar un nuevo cliente en la base de datos.
* Funcionamiento:
1) Parámetros de Entrada: p_nombre, p_apellido, p_fecha_nacimiento, p_email, p_telefono, p_cuil.
2) Inserción: Inserta un nuevo registro en la tabla Clientes con los datos proporcionados.
## Beneficios para el Proyecto:

* Automatización del Registro: Simplifica y automatiza el proceso de registrar nuevos clientes, reduciendo el riesgo de errores humanos.
* Eficiencia Operativa: Aumenta la eficiencia en la gestión de datos de clientes, permitiendo una inserción rápida y estructurada de la información.
* Consistencia de Datos: Asegura que todos los campos necesarios para un nuevo cliente sean proporcionados y almacenados correctamente en la base de datos.
# Script de creacion:
![image](https://github.com/user-attachments/assets/110525e5-58cf-43d6-b2cf-7f23fa11aeb6)
# call consulta:
![image](https://github.com/user-attachments/assets/671c21b8-9dff-4f03-b918-e77eaa8884b0)

## 3) Procedimiento verCliente
Descripción:

* Objetivo: Consultar y mostrar la información de un cliente específico basado en su CUIL.
* Funcionamiento:
1) Parámetro de Entrada: p_cuil (CUIL del cliente).
2) Consulta: Selecciona todos los campos de la tabla Clientes donde el CUIL coincide con el parámetro proporcionado.
## Beneficios para el Proyecto:

* Acceso Rápido a Información: Permite obtener rápidamente toda la información relevante de un cliente, mejorando la atención al cliente y la toma de decisiones.
* Precisión en las Consultas: Facilita consultas precisas basadas en el CUIL, asegurando que se obtiene la información del cliente correcto.
* Soporte Administrativo: Ayuda al personal administrativo y de atención al cliente a gestionar de manera eficiente las consultas y solicitudes de información sobre clientes.

# Script de creacion:

![image](https://github.com/user-attachments/assets/8a1aa99f-5998-431f-b69d-98d5377b9121)

# call consulta:
![image](https://github.com/user-attachments/assets/5e627100-e0b3-4dba-b7fb-eeb4da9eb47c)

# A diferencia de la entrega anterior, ahora la base esta formada con 17 tablas
* aqui adjunto el diagrama entidad relacion actualizado
![image](https://github.com/user-attachments/assets/e31f626c-b584-4d2e-9516-0db41abed9bf)










