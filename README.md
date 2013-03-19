trie <img src="https://secure.travis-ci.org/jamesmoriarty/trie.png" />
=====

```ruby
> trie = Trie.new
 # => #<Trie:0x007fba74854a18 @root={}>
> trie.build("more")
 # => #<Trie:0x007fba74854a18 @root={"m"=>{"o"=>{"r"=>{"e"=>{:end=>true}}}}}>
> trie.build("morph")
 # => #<Trie:0x007fba74854a18 @root={"m"=>{"o"=>{"r"=>{"e"=>{:end=>true}, "p"=>{"h"=>{:end=>true}}}}}}>
> trie.prefixed("mo")
 # => ["more", "morph"]
> trie.prefixed("more")
 # => ["more"]
> trie.to_a
 # => ["more", "morph"]
```

Contributing to trie
--------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2012 James Moriarty. See LICENSE.txt for
further details.

