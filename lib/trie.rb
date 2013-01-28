# Copyright (c) 2012 James Moriarty
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
class Trie

  def initialize
    @root = {}
  end

  # Add a <tt>String</tt> to the trie.
  #
  # <tt>trie.add("word") # => true</tt>
  def add(word)
    node = @root
    word.chars.each do |char|
      node[char] ||= {}
      node = node[char]
    end

    node[:end] = true
  end

  # Returns boolean indicating if the trie contains the given <tt>String</tt>.
  #
  # <tt>trie.include?("word") # => true</tt>
  def include?(word)
    node = @root
    word.chars.each do |char|
      return false if node.nil?
      node = node[char]
    end

    !!node and node[:end]
  end

  # Returns an array of all the words contained in the trie.
  #
  # <tt>trie.to_a # => ["word"]</tt>
  def to_a(node = @root, prefix = "", array = [])
    return array if node.nil?
    node.each do |key, value|
      key == :end ? array << prefix : to_a(value, prefix + key, array)
    end

    array
  end

  # Returns an array of all the words contained in the trie prefixed with the given <tt>String</tt>.
  #
  # <tt>trie.prefixed("wo") # => ["word"]</tt>
  def prefixed(prefix, node = @root)
    prefix.chars.each do |char|
      return [] unless node[char]
      node = node[char]
    end

    to_a(node).map { |suffix| prefix + suffix }
  end

end
