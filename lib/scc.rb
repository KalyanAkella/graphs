
require 'graph'
require 'dfs'

def find_scc(graph)
  dfs(graph)
  tgraph = graph.transpose
  result = []
  dfs(tgraph) { |v| result << tgraph.ancestral_path(v).map(&:label) }
  result
end

