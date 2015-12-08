
require 'graph'
require 'count_paths'

describe 'dfs on a graph' do

  before(:all) do
    @graph = Graph.create ('m'..'z').to_a
    m, n, o, p, q, r, s, t, u, v, w, x, y, z = @graph.vertices
    @graph.edges(m, r, q, x)
    @graph.edges(n, q, u, o)
    @graph.edges(o, r, v, s)
    @graph.edges(p, o, s, z)
    @graph.edge(q, t)
    @graph.edges(r, u, y)
    @graph.edge(s, r)
    @graph.edge(u, t)
    @graph.edges(v, x, w)
    @graph.edge(w, z)
    @graph.edge(y, v)
  end

  it 'should count all unique paths between a pair of vertices' do
    m, n, o, p, q, r, s, t, u, v, w, x, y, z = @graph.vertices
    expect(count(@graph, p, v)).to eq(4)
  end
end

