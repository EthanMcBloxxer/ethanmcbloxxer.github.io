# Luau Documentation

*A compiled list of very simply explained functions and constants part of the Luau (Roblox's sandboxed Lua) language.*

[Contributions](https://github.com/EthanMcBloxxer/ethanmcbloxxer.github.io/edit/main/published/luau-documentation.md) are welcome, but you'll need a GitHub account and know how to pull request.

## Primitive

tba (string, number, int, Variant, type checking, etc)

### ModuleScripts

These are extremely simple to understand on a basic level. There is a deeper level of understanding you can achieve, but you don't need to have an immense amount of understanding to use these.

Now, to be blunt, ModuleScripts are functions.

That's it.

Inside of a ModuleScript, you may notice there is a `return` keyword at the end. This is what gets returned when using the `require` keyword.

Say I have the following code in a ModuleScript:

```lua
return "This is a ModuleScript"
```

and this in a Script:

```lua
local module = require(ModuleScript) -- (replace ModuleScript with path)
print(module) --> "This is a ModuleScript"
```

In the Script, you call the ModuleScript and the ModuleScript returns `"This is a ModuleScript"`. That return value is stored in the `module` variable, which we print.

The ModuleScript's code can be thought of more like this:

```lua
function module()
	return "This is a ModuleScript"
end
```

Most use ModuleScripts with tables as return values, like so:

```lua
return {
	say = function(text)
		print(text)
	end,
	addCash = function(player, cash)
		player.leaderstats.Cash.Value += cash -- this is just an example
	end,
}
```

which allows us to do this in Scripts:

```lua
local module = require(ModuleScript)

module.say("Some text is cool") --> "Some text is cool"
module.addCash(game.Players.EthanMcBloxxer, 1000)
```

you may also see table assignments like this, which also works:

```lua
local exports = {}

exports.say(text)
	print(text)
end

return exports
```

and some even utilize Metatables.

Another thing to note is that code inside of the ModuleScript will be ran. Functions inside of them don't run automatically (as functions don't run without being called), so you can make code inside of the ModuleScript run on calling:

```lua
print("Ran ModuleScript")

return true
```

which would do the following in a Script:

```lua
local bool = require(ModuleScript) --> Ran ModuleScript
print(tostring(bool)) --> true
```

## Functions

### Metatables

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

### pcall

You might want to know what `pcall` does, and it is actually extremely simple.

Take this example:

```lua
pcall(function(Words)
    print(Words)
end, "pcalls are cool!")
```

Right here, we're simply creating an anonymous function (a function that only runs once, inside of the `pcall`) and providing it to `pcall`.  
If you notice the comma after `end`, you'll also see that another argument was passed. All extra arguments that `pcall` has are passed to the provided function.

We could also use this code, which functions the exact same way but you'll be able to run the function again afterwards:

```lua
local function MyCoolFuction(Words)
    print(Words)
end

pcall(MyCoolFunction, "pcalls are cool!")
```

But, you may be thinking, what are the advantages of using `pcall` over just a normal function call (or just executing code)?

That reason is error handling.

When you create a `pcall`, you're also able to assign its return value to a variable.

`pcall` returns two things, a boolean (`true` if the function had no errors and `false` otherwise), and a varying value that, if the function had no errors, is `nil`, otherwise the error message.

So, we can get those values like so:

```lua
local function MyCoolFuction(Words)
    print(Words)
end

local success, message = pcall(MyCoolFunction, "pcalls are cool!")
```

In this example, no errors will be created when calling the function, so `success` is `true` and `message` is `nil`. However, if we were to make a function like so:

```lua
local function MyCoolFunction(Words)
    error(Words)
end

local success, message = pcall(MyCoolFunction, "this function will error now.")
```

Here, since the function errors (in this case we explicitly call `error`), `success` is `false` and `message` is `"this function will error now."`. We could've also used `assert(nil, "this function will error now.")` instead of `error` (as `assert` is a function that will error if the first argument is `nil` or `false`, and errors with the second argument as the message).

Remember, we can still use anonymous functions if you don't need to use the function multiple times:

```lua
local success, message = pcall(function(Words)
    error(Words)
end, "this function will error now.")
```

like before, this function will make `success` `false` and `message` `"this function will error now."`.

Similarly, there is another function called `xpcall`. Put simply, this is `pcall` with a second function argument. This second argument will handle errors from the `pcall` and Roblox will not do anything else with it. There is a second return value you can learn more about at [the Roblox Developer Wiki](https://developer.roblox.com/en-us/api-reference/lua-docs/Lua-Globals#variables) as that is out of the tutorial's scope.

```lua
local function MyCoolFunction(Words)
    error(Words)
end

local function ErrorHandler(Message)
    print("[Error Handler] "..Message)
end

local success = xpcall(MyCoolFunction, ErrorHandler, "Just stop the function.")
```

You also might want to know why this is useful, but this isn't really something I can just explain. It is useful when it is useful. Anyway, the example makes it so that the error handler prints `[Error Handler] Script: "Just stop the function."`. `success` is `false`, as would be expected.

## Constants
