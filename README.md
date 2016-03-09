# BinaryTree

An implmentation of [`Hash`](http://ruby-doc.org/core-2.3.0/Hash.html)- and [`Set`](http://ruby-doc.org/stdlib-2.3.0/libdoc/set/rdoc/Set.html)-compatible objects using a binary tree.

This was an exercise done to test the performance of the interpreted version as compared to the native data types.
It seems that [MRI's version of Hash](http://ruby-doc.org/core-2.3.0/Hash.html) uses a binary tree internally anyway, and because it is implemented in C, it's much faster.

## Installation

This has not been published as a gem, and it's not likely to be.
Don't use it in a production application.

## Usage

```ruby
  a = BinaryTree::Hash.new
  a[:the_answer] = 42
  a[:the_answer] # => 42
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/binary_tree/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
