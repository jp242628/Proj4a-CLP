import matplotlib.pyplot as plt

# Dados para C ANSI
sizes_c = [10, 100, 1000, 10000, 100000]
insertion_sort_c = [0.000000, 0.000000, 0.000700, 0.064100, float('inf')]  # float('inf') para valores que excederam o limite
bubble_sort_c = [0.000000, 0.000000, 0.002100, 0.219500, float('inf')]
merge_sort_c = [0.000000, 0.000000, 0.000100, 0.001400, 0.016500]
quick_sort_c = [0.000000, 0.000000, 0.000100, 0.001500, 0.017500]

# Dados para Java
sizes_java = [10, 100, 1000, 10000, 100000]
insertion_sort_java = [0.000002, 0.000087, 0.000931, 0.008837, 0.722601]
bubble_sort_java = [0.000002, 0.000222, 0.001407, 0.103249, float('inf')]
merge_sort_java = [0.000007, 0.000076, 0.000148, 0.001659, 0.015598]
quick_sort_java = [0.000003, 0.000041, 0.000067, 0.000692, 0.006471]

# Dados para Prolog
sizes_prolog = [10, 100, 1000, 1500]
insertion_sort_prolog = [0, 1, 26, 52]
bubble_sort_prolog = [0, 22, 14713, 49809]
merge_sort_prolog = [0, 1, 3, 6]
quick_sort_prolog = [5, 0, 3, 2]

# Plotagem
plt.figure(figsize=(16, 8))

# Plot para Insertion Sort
plt.subplot(2, 2, 1)
plt.plot(sizes_c, insertion_sort_c, marker='o', linestyle='-', color='b', label='C ANSI')
plt.plot(sizes_java, insertion_sort_java, marker='o', linestyle='-', color='g', label='Java')
plt.plot(sizes_prolog, insertion_sort_prolog, marker='o', linestyle='-', color='r', label='Prolog')
plt.xscale('log')
plt.yscale('log')
plt.xlabel('Tamanho da Lista')
plt.ylabel('Tempo de Execução (segundos)')
plt.title('Insertion Sort')
plt.grid(True)
plt.legend()

# Plot para Bubble Sort
plt.subplot(2, 2, 2)
plt.plot(sizes_c, bubble_sort_c, marker='o', linestyle='-', color='b', label='C ANSI')
plt.plot(sizes_java, bubble_sort_java, marker='o', linestyle='-', color='g', label='Java')
plt.plot(sizes_prolog, bubble_sort_prolog, marker='o', linestyle='-', color='r', label='Prolog')
plt.xscale('log')
plt.yscale('log')
plt.xlabel('Tamanho da Lista')
plt.ylabel('Tempo de Execução (segundos)')
plt.title('Bubble Sort')
plt.grid(True)
plt.legend()

# Plot para Merge Sort
plt.subplot(2, 2, 3)
plt.plot(sizes_c, merge_sort_c, marker='o', linestyle='-', color='b', label='C ANSI')
plt.plot(sizes_java, merge_sort_java, marker='o', linestyle='-', color='g', label='Java')
plt.plot(sizes_prolog[:len(merge_sort_prolog)], merge_sort_prolog, marker='o', linestyle='-', color='r', label='Prolog')
plt.xscale('log')
plt.yscale('log')
plt.xlabel('Tamanho da Lista')
plt.ylabel('Tempo de Execução (segundos)')
plt.title('Merge Sort')
plt.grid(True)
plt.legend()

# Plot para Quick Sort
plt.subplot(2, 2, 4)
plt.plot(sizes_c, quick_sort_c, marker='o', linestyle='-', color='b', label='C ANSI')
plt.plot(sizes_java, quick_sort_java, marker='o', linestyle='-', color='g', label='Java')
plt.plot(sizes_prolog[:len(quick_sort_prolog)], quick_sort_prolog, marker='o', linestyle='-', color='r', label='Prolog')
plt.xscale('log')
plt.yscale('log')
plt.xlabel('Tamanho da Lista')
plt.ylabel('Tempo de Execução (segundos)')
plt.title('Quick Sort')
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.show()
