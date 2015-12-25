
require 'dfs'
require 'graph'

describe 'depth first search on a graph' do

  before(:all) do
    @graph = Graph.create %w(u v w x y z)
    u, v, w, x, y, z = @graph.vertices
    @graph.edges(u, v, x)
    @graph.edge(x, v)
    @graph.edge(v, y)
    @graph.edge(y, x)
    @graph.edges(w, y, z)
    @graph.edge(z, z)
    dfs(@graph)
  end

  it "should visit all vertices" do
    expect(@graph.vertices.all? { |vertex| vertex.color == Color::BLACK }).to be true
  end

  it "should set parents correctly" do
    u, v, w, x, y, z = @graph.vertices(false)
    expect(@graph.ancestral_path(u)).to eq([u])
    expect(@graph.ancestral_path(v)).to eq([u, v])
    expect(@graph.ancestral_path(x)).to eq([u, v, y, x])
    expect(@graph.ancestral_path(y)).to eq([u, v, y])
    expect(@graph.ancestral_path(w)).to eq([w])
    expect(@graph.ancestral_path(z)).to eq([w, z])
  end
end

