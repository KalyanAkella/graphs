
require 'graph'

def dfs(g, &visitor)
  g.vertices.each do |v|
    v.color = Color::WHITE
    v.parent = nil
  end

  $time = 0
  g.vertices.each do |v|
    if v.color == Color::WHITE
      dfs_visit(g, v, &visitor)
    end
  end
end

def dfs_visit(g, v, &visitor)
  v.color = Color::GRAY
  $time += 1
  v.d = $time
  g.adjacent_vertices(v).each do |av|
    if av.color == Color::WHITE
      av.parent = v
      dfs_visit(g, av, &visitor)
    end
  end
  v.color = Color::BLACK
  $time += 1
  v.f = $time
  visitor.call(v) if visitor and visitor.arity == 1
end

def topological_sort(g)
  res = []
  dfs(g) { |v| res << v }
  res
end

