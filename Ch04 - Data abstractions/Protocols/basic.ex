# A protocol is a module in which you declare functions without implementing them.
# Like an interface in OOP


defprotocol Strings.Chars do
  def to_string(things) # functions are declared, not implemented
end

# Integer is an atom but can be Tuple, Atom, List, Map, BitString, Integer, Float, Function, PID, Port or Reference
#Can be arbitrary alias
defimpl Strings.Chars, for: Integer do
  def to_string(thing) do
    Integer.to_string(thing)
  end
end


defimpl String.Chars, for: TodoList
  do def to_string(_) do
    "#TodoList"
  end
end
