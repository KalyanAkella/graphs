
require 'graph'

# Given a graph g, two vertices u and v, it returns the number of
# unique paths from u to v in g.
def count(g, u, v)
  g.vertices.each do |v|
    v.data = 0
    v.parent = nil
  end

  dfs_count(g, u, v)
  v.data
end

def dfs_count(g, u, v)
  g.adjacent_vertices(u).each do |av|
    av.parent = u
    dfs_count(g, av, v)
    if av.label == v.label
      v.data += 1
      #      p "Found #{g.ancestral_path(v).map(&:label).join}"
    end
  end
end

