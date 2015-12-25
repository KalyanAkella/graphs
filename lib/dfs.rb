
require 'graph'

def dfs(g, &visitor)
  g.vertices.each do |v|
    v.color = Color::WHITE
    v.parent = nil
  end

  $time = 0
  g.vertices.each do |v|
    if v.color == Color::WHITE
      dfs_visit(g, v)
      visitor.call(v) if visitor and visitor.arity == 1
    end
  end
end

def dfs_visit(g, v)
  v.color = Color::GRAY
  $time += 1
  v.d = $time
  g.adjacent_vertices(v).each do |av|
    if av.color == Color::WHITE
      av.parent = v
      dfs_visit(g, av)
    end
  end
  v.color = Color::BLACK
  $time += 1
  v.f = $time
end

