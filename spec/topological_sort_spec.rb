
require 'graph'
require 'topological_sort'

describe 'topological sort on a graph' do
  before(:all) do
    @graph = Graph.create %w(shorts pants belt shirt tie jacket socks shoes watch)
    shorts, pants, belt, shirt, tie, jacket, socks, shoes, watch = @graph.vertices
    @graph.edges(shorts, pants, shoes)
    @graph.edges(pants, belt, shoes)
    @graph.edge(belt, jacket)
    @graph.edges(shirt, belt, tie)
    @graph.edge(tie, jacket)
    @graph.edge(socks, shoes)
  end

  it "should list vertices in the correct order" do
    shorts, pants, belt, shirt, tie, jacket, socks, shoes, watch = @graph.vertices
    expect(topological_sort(@graph)).to eq([watch, socks, shirt, tie, shorts, pants, shoes, belt, jacket])
  end
end

