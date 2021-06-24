import networkx as nx

G = nx.Graph()
G.add_node(1)
G.add_node(2)
G.add_edge(1, 2)

# Add several nodes or links at once:
G.add_nodes_from([3, 4, 5])
G.add_edges_from([(3, 4), (3, 5), (4, 5)])

# Get lists of nodes, links, and neighbors of a given node:
G.nodes()
G.edges()
G.neighbors(3)

# Loop over nodes or links:
for n in G.nodes:
  print(n, G.neighbors(n))

for u,v in G.edges:
  print(u, v)

# Create a directed network
D = nx.DiGraph()
D.add_edge(1, 2)
D.add_edge(2, 1)
D.add_edges_from([(2, 3), (3, 4), (4, 1)])

D.number_of_nodes()
D.number_of_edges()

D.neighbors(2)
D.predecessors(2)
D.successors(2)

# Functions to generate networks of many types.
B = nx.complete_bipartite_graph(4, 5)
C = nx.cycle_graph(4)
P = nx.path_graph(5)
S = nx.star_graph(6)

# Density
nx.density(G)
nx.density(D)
CG = nx.complete_graph(8471) # a large complete network
print(nx.density(CG))

# Subnetwork
K5 = nx.complete_graph(5)
clique = nx.subgraph(K5, (0, 1, 2))