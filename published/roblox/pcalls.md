# Roblox `pcall`

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
