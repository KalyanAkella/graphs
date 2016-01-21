
require 'graph'
require 'scc'

describe 'scc algorithm on a graph' do

  before(:all) do
    @graph = Graph.create %w(a b c d e f g h)
    a, b, c, d, e, f, g, h = @graph.vertices
    @graph.edge(a, b)
    @graph.edges(b, e, f, c)
    @graph.edges(c, d, g)
    @graph.edges(d, c, h)
    @graph.edges(e, a, f)
    @graph.edge(f, g)
    @graph.edges(g, f, h)
    @graph.edge(h, h)
  end

  it 'should return the strongly connected components' do
    sccs = find_scc(@graph)
    p sccs
  end
end

