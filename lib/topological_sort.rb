
require 'dfs'

def topological_sort(g)
  res = []
  dfs(g) { |v| res.unshift(v) }
  res
end

