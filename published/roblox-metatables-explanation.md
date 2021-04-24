# Roblox Metatables

This article is very oversimplified and doesn't touch many small details.

Think of metatables like normal Roblox "Events". The only difference is that you don't use `:Connect` and instead assign the value to a function. This is because metatables **are** just tables with the events (metamethods) assigned to functions.

To set a metatable to a table, use the `setmetatable` function, like this:

```lua
local Table = {
  Cash = 100
}
local Metatable = {
  __call = function()
    return "A table was called!"
  end
}

setmetatable(Table, Metatable)

print(Table())       --> "A table was called!"
print(Table["Cash"]) --> 100
```

you can also do this, which does the same thing:

```lua
local Table = setmetatable(
  { -- table
    Cash = 100
  }, -- notice the comma
  { -- metatable
    __call = function()
      return "A table was called!"
    end
  }
)

print(Table())       --> "A table was called!"
print(Table["Cash"]) --> 100
```

As you can see, the "Metatable" table has a `__call` function item. When the `setmetatable` function sets `Metatable` to `Table`, the events (metamethods) in `Metatable` are called, in this case `__call`, which executes when the table is called like a function.

`__call` is not the only event (metamethod). There are more as documented in the [Roblox Developer Wiki](https://developer.roblox.com/en-us/articles/Metatables#metamethods).
