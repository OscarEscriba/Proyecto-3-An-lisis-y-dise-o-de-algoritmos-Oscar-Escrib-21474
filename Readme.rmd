# Reporte del Proyecto 3 - Análisis y Diseño de Algoritmos
## Autor: Oscar Escriba
## Curso: Análisis y Diseño de Algoritmos
## Profesor: Gabriel Brolo

### Enlaces requeridos
- Repositorio privado: [Incluir enlace a GitHub]
- Video en YouTube (no listado): [Incluir enlace al video]

---

## Introducción
Este proyecto tiene como objetivo comprender la interacción entre el análisis amortizado, el análisis competitivo y los algoritmos on-line. Se implementó el algoritmo MTF (Move-To-Front) y su variante mejorada IMTF, y se analizaron distintos tipos de secuencias para estudiar su comportamiento y costo.

El **costo de acceso** de un elemento en la lista es la posición que ocupa (índice + 1) en el momento en que es accedido. Después del acceso, el algoritmo MTF mueve el elemento al inicio de la lista. La versión mejorada IMTF solo lo mueve si se reutilizará pronto.

---

## Parte 1: Secuencia ordenada
- Configuración inicial: [0, 1, 2, 3, 4]
- Secuencia: 0, 1, 2, 3, 4 repetido 4 veces
- Resultado: Costo total = **90**

### Explicación:
La primera vuelta tiene costos crecientes (1 a 5). A partir de la segunda, debido al reordenamiento, los elementos solicitados están al fondo, así que cada acceso cuesta 5. Este comportamiento refleja cómo MTF puede empeorar cuando se pierde la estructura original.

---

## Parte 2: Secuencia invertida y mixta
- Configuración inicial: [0, 1, 2, 3, 4]
- Secuencia: [4, 3, 2, 1, 0, 1, 2, 3, 4, 3, 2, 1, 0, 1, 2, 3, 4]
- Resultado: Costo total = **67**

### Explicación:
Aunque inicia con accesos al final (costosos), rápidamente MTF reacomoda la lista, y varios elementos se acercan al frente, reduciendo el costo en siguientes accesos.

---

## Parte 3: Mejor caso
- Secuencia: [0] × 20
- Resultado: Costo total = **20**

### Explicación:
El elemento 0 ya está al frente, así que cada acceso cuesta 1 y nunca cambia su posición. Este es el mejor escenario posible para MTF.

---

## Parte 4: Peor caso
- Secuencia: [4, 3, 2, 1, 0] × 4
- Resultado: Costo total = **100**

### Explicación:
Cada elemento es accedido cuando está en el fondo. Aunque MTF lo mueve al frente, el siguiente elemento está ahora al fondo, generando el peor patrón posible de accesos.

---

## Parte 5: Repetición de elementos
### a) Secuencia: [2] × 20
- Resultado: Costo total = **22**
### b) Secuencia: [3] × 20
- Resultado: Costo total = **23**

### Explicación:
El primer acceso cuesta 3 o 4 según la posición inicial del número. Una vez que se mueve al frente, todos los siguientes accesos cuestan 1. Esto refleja el beneficio de MTF con datos altamente repetitivos.

---

## Parte 6: Algoritmo mejorado IMTF
- Mejor caso (secuencia [0] × 20): Costo total = **20**
- Peor caso (secuencia [4,3,2,1,0] × 4): Costo total = **60**

### Explicación:
IMTF solo mueve un elemento si aparecerá nuevamente dentro de los próximos `i-1` elementos. En el mejor caso, 0 ya está al frente. En el peor caso, no hay beneficio en reordenar, así que no se mueven y se accede según la posición original.

### Comparación:
| Algoritmo | Caso       | Costo total |
|-----------|------------|--------------|
| MTF       | Mejor      | 20           |
| MTF       | Peor       | 100          |
| IMTF      | Mejor      | 20           |
| IMTF      | Peor       | 60           |

---

## Conclusión
Este experimento demuestra que:
- MTF es útil cuando los datos se repiten con frecuencia.
- MTF puede ser muy ineficiente si los accesos no aprovechan el reordenamiento.
- IMTF mejora el rendimiento en el peor caso, evitando reordenamientos innecesarios.

Ambos algoritmos representan bien el análisis amortizado: aunque un acceso pueda parecer caro individualmente, el costo promedio a lo largo del tiempo puede ser menor si hay repetición o patrones predecibles en los accesos.

---

**Fin del reporte.**
