class Trie

  def initialize
    @root = {}
  end

  def add(word)
    node = @root
    word.chars.each do |char|
      node[char] ||= {}
      node = node[char]
    end

    node[:end] = true
  end

  def include?(word)
    node = @root
    word.chars.each do |char|
      return false if node.nil?
      node = node[char]
    end

    !!node and node[:end]
  end

  def to_a(node = @root, prefix = "", array = [])
    return array if node.nil?
    node.each do |key, value|
      key == :end ? array << prefix : to_a(value, prefix + key, array)
    end

    array
  end

  def prefixed(prefix, node = @root)
    prefix.chars.each do |char|
      return [] unless node[char]
      node = node[char]
    end

    to_a(node).map { |suffix| prefix + suffix }
  end

end
