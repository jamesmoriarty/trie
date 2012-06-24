require 'helper'

class TestTrie < Test::Unit::TestCase

  def setup
    @trie = Trie.new
    @trie.add("more")
    @trie.add("morph")
  end

  def test_initialize
    assert_not_nil @trie
    assert_equal Trie, @trie.class
  end

  def test_include
    assert @trie.include?("more")
    assert @trie.include?("morph")
    assert !@trie.include?("m")
    assert !@trie.include?("zoo")
  end

  def test_prefixed
    assert_equal [], @trie.prefixed("z")
    assert_equal ["morph"], @trie.prefixed("morp")
    assert_equal ["more", "morph"], @trie.prefixed("m").sort
  end

end
