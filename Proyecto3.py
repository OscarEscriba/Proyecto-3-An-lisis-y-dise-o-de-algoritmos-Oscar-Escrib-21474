# Proyecto 3 - Análisis y Diseño de Algoritmos
# Autor: Oscar Escriba
# Tema: Análisis Amortizado y Algoritmos Online - MTF e IMTF

from typing import List, Tuple


def mtf(sequence: List[int], initial_config: List[int]) -> Tuple[List[Tuple[List[int], int, int, List[int]]], int]:
    config = initial_config[:]
    total_cost = 0
    trace = []
    for request in sequence:
        cost = config.index(request) + 1
        total_cost += cost
        before = config[:]
        config.remove(request)
        config.insert(0, request)
        trace.append((before, request, cost, config[:]))
    return trace, total_cost


def imtf(sequence: List[int], initial_config: List[int]) -> Tuple[List[Tuple[List[int], int, int, List[int]]], int]:
    config = initial_config[:]
    total_cost = 0
    trace = []
    n = len(sequence)
    for idx, request in enumerate(sequence):
        cost = config.index(request) + 1
        total_cost += cost
        before = config[:]
        i = config.index(request)
        lookahead = sequence[idx + 1:idx + i]
        config.remove(request)
        if request in lookahead:
            config.insert(0, request)
        else:
            config.insert(i, request)
        trace.append((before, request, cost, config[:]))
    return trace, total_cost


def print_trace(trace: List[Tuple[List[int], int, int, List[int]]]):
    for before, req, cost, after in trace:
        print(f"Lista antes: {before} | Solicitud: {req} | Costo: {cost} | Lista después: {after}")


if __name__ == "__main__":
    initial = [0, 1, 2, 3, 4]

    # Parte 1
    seq1 = [0, 1, 2, 3, 4]*4
    print("\n--- Parte 1: Secuencia ordenada ---")
    trace1, total1 = mtf(seq1, initial)
    print_trace(trace1)
    print(f"Costo total: {total1}\n")

    # Parte 2
    seq2 = [4,3,2,1,0,1,2,3,4,3,2,1,0,1,2,3,4]
    print("\n--- Parte 2: Secuencia invertida y mixta ---")
    trace2, total2 = mtf(seq2, initial)
    print_trace(trace2)
    print(f"Costo total: {total2}\n")

    # Parte 3 - Mínimo costo
    print("\n--- Parte 3: Mejor caso ---")
    best_seq = [0]*20
    trace3, total3 = mtf(best_seq, initial)
    print_trace(trace3)
    print(f"Mejor secuencia: {best_seq} | Costo total: {total3}\n")

    # Parte 4 - Peor caso
    print("\n--- Parte 4: Peor caso ---")
    worst_seq = [4,3,2,1,0]*4
    trace4, total4 = mtf(worst_seq, initial)
    print_trace(trace4)
    print(f"Peor secuencia: {worst_seq} | Costo total: {total4}\n")

    # Parte 5 - Repetición
    rep_seq_2 = [2]*20
    rep_seq_3 = [3]*20
    print("\n--- Parte 5: Repetición de 2 ---")
    trace5a, total5a = mtf(rep_seq_2, initial)
    print_trace(trace5a)
    print(f"Costo total para [2]*20: {total5a}\n")

    print("\n--- Parte 5: Repetición de 3 ---")
    trace5b, total5b = mtf(rep_seq_3, initial)
    print_trace(trace5b)
    print(f"Costo total para [3]*20: {total5b}\n")

    # Parte 6 - IMTF con mejores y peores secuencias
    print("\n--- Parte 6: IMTF - Mejor caso ---")
    trace6a, total6a = imtf(best_seq, initial)
    print_trace(trace6a)
    print(f"Costo total con IMTF (mejor caso): {total6a}\n")

    print("\n--- Parte 6: IMTF - Peor caso ---")
    trace6b, total6b = imtf(worst_seq, initial)
    print_trace(trace6b)
    print(f"Costo total con IMTF (peor caso): {total6b}\n")
