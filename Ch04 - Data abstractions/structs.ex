# f = %Fraction{a: 5, b: 10}

defmodule Fraction do
  defstruct a: nil, b: nil

  def new(a,b) do %Fraction{a: a, b: b} end

  # Pattern matches function, pattern fraction is enforced here and function will fail if input type is not an Fraction
  def value(%Fraction{a: a,b: b}) do
    a / b
    # the same as fraction.a/fraction.b and passed fraction is an input
  end

  def add(%Fraction{a: a1,b: b1},%Fraction{a: a2,b: b2})do
    new(a1 * b2 + a2 * b1, b2 * b1)
  end

end
# Fraction.add(Fraction.new(1,2), Fraction.new(1,4))

 #%Fraction{a: a, b: b} = f

# updating
# one_half = %Fraction{a: 1, b: 2}
# one_quarter = %Fraction{one_half | b:4}


# struct pattern cannot match plain map!!!
%Fraction{} = %{a: 5, b: 10}
# map mapptern can match struct
%{a: a, b: b} = f1
