
# Graph implemented using adjacency lists

module Color
  WHITE = 0
  BLACK = 1
  GRAY = 2
end

Vertex = Struct.new(:label, :color, :parent, :d, :f)

class Graph

  def self.create(vs)
    vertices = vs.map { |v| Vertex.new(v) }
    Graph.new(vertices)
  end

  def initialize(vs)
    @vertices = {}
    @adj = {}
    vs.each do |vertex|
      @vertices[vertex.label] = vertex
      @adj[vertex.label] = []
    end
  end

  def edge(u, v)
    raise ArgumentError, "No such vertex: #{u.label}" unless @adj.has_key? u.label
    raise ArgumentError, "No such vertex: #{v.label}" unless @adj.has_key? v.label
    @adj[u.label] << v
    self
  end

  def edges(u, *vs)
    vs.each do |v|
      self.edge(u, v)
    end
    self
  end

  def vertices
    @vertices.values
  end

  def adjacent_vertices(v)
    raise ArgumentError, "No such vertex: #{v.label}" unless @adj.has_key? v.label
    @adj[v.label]
  end

  def ancestral_path(v)
    if v.parent.nil?
      return [v]
    else
      return [ancestral_path(v.parent), v].flatten
    end
  end
end

