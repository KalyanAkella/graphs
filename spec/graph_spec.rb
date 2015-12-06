
require 'graph'

describe Graph do
  before(:all) do
    @graph = Graph.create %w(u v w x y z)
    u, v, w, x, y, z = @graph.vertices
    @graph.edge(u, v).edge(u, x)
    @graph.edge(x, v)
    @graph.edge(v, y)
    @graph.edge(y, x)
    @graph.edge(w, y).edge(w, z)
    @graph.edge(z, z)
  end

  it "should return the adjacent vertices for a given vertex" do
    u, v, w, x, y, z = @graph.vertices
    expect(@graph.adjacent_vertices(u)).to contain_exactly(v, x)
    expect(@graph.adjacent_vertices(v)).to contain_exactly(y)
    expect(@graph.adjacent_vertices(x)).to contain_exactly(v)
    expect(@graph.adjacent_vertices(y)).to contain_exactly(x)
    expect(@graph.adjacent_vertices(w)).to contain_exactly(y, z)
    expect(@graph.adjacent_vertices(z)).to contain_exactly(z)
  end

  it "should return the ancestral path for a given vertex" do
    u, v, w, x, y, z = @graph.vertices
    z.parent = y
    y.parent = x
    x.parent = w
    w.parent = v
    v.parent = u
    expect(@graph.ancestral_path(z)).to eq([u,v,w,x,y,z])
  end
end

