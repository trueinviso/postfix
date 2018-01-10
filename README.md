## Postfix ##

Reverse Polish Notation calculator written in Ruby.

### Installation ###
  # Cloning the repository
  $ git clone git@github.com:trueinviso/postfix.git

  # Requires bundler
  $ gem install bundler
  $ bundle install

### Usage ###
  $ ruby postfix.rb
    > 5
      5.0
    > 8
      8.0
    > +
      13.0
    > q
      "Have a good day."

### High-level description ###

The solution I wrote uses the Ruby programming language.  I decided to have a high-level
ruby file called `postfix.rb` that can be run from the command line and will call one method
that runs the calculator.  It seemed like a good idea to break up the responsibilities of
the classes into one that reads input, one that evaluates the input, and one that validates
input (`StandardInputUtility`, `ExpressionEvaluator`, and `Validator`).

### Architectural/Technical Choices ###

I decided to use an array as the "stack" for the digits because ruby has built in
methods on the `Array` class that make it easy to make it operate like a stack.

Because everything in Ruby is an "Object", I decided the easiest thing to do to evaluate
the expressions would be to call the `send` method on the left digit with the operand and
right digit.

I decided to wrap the `Validator` in a method inside the `ExpressionEvaluator` since the
validations are so simple right now.  I am only validating the 4 operands.  However, if
given more time, or if different validators might be used in different contexts, I might
inject the validator into the `ExpressionEvaluator` class to make that possible.

