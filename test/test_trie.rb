require 'helper'

class TestTrie < Test::Unit::TestCase
  
  def setup
    @trie = Trie.new
    @trie.build("more")
    @trie.build("morph")
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
    assert_equal @trie.prefixed("z"), []
    assert_equal @trie.prefixed("m"), ["more", "morph"]
    assert_equal @trie.prefixed("morp"), ["morph"]
  end

end
