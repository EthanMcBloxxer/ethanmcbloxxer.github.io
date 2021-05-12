# Lua*u* Documentation

*A compiled list of very simply explained functions and constants part of the Luau (Roblox's sandboxed Lua) language.*

[Contributions](https://github.com/EthanMcBloxxer/ethanmcbloxxer.github.io/edit/main/published/luau-documentation.md) are welcome, but you'll need a GitHub account and know how to pull request.

> This is a *living document* and can change at any time.

## Scripts

Scripts are the core of Roblox's engine, and where Luau actually runs inside of Roblox.

To make one, go into your Explorer menu (View → Explorer) and hover over ServerScriptService. Right click on it and then click on `Insert Object...`. Search for just "Script", and click on `Script`. You should now be in the script editor. If you ever leave the script editor you can get back into it by double clicking on the script you want to edit.

On Roblox, "Script"s run on the server and "LocalScript"s run on the client. Scripts can run in Workspace, but this is only for compatibility with some features like Tools. **Never put Scripts in Workspace**. ServerScriptService is the proper alternative which does not allow exploiters to scan for vulnerabilities in your code.

## LocalScripts

LocalScripts function the same way as Scripts, but they only run on the local computer. These are often used for GUIs and other scenarios which you would need to send data from the client to server. This is possible with Remote Events & Functions, but that is outside the scope of this section.

## Variables

A variable is something that can be referenced and changed with assignments. They are always case-sensitive.

There are (technically) two ways to create them:

```lua
local variable = "data"
-- or
variable = "data"
```

`local` is a keyword that represents a locally-scoped variable. Think of `let` in JavaScript. It only exists in the current function (which includes functions, ifs, loops, etc) or, in the absense of one, across the entire script.

When there is no keyword, it creates a globally-scoped variable (`var` in JavaScript). You can use this new variable throughout the entire running script.

Locally scoped variables are always preferred. Conversely to JavaScript (which is just an example language to compare to), locally-scoped variables offer a hefty (30%+) performance boost over globally scoped ones.

If you need to, you can initiate a variable without a value:

```lua
local variable
```

Luau will warn you that this is unnecessary until you use it later. Doing

```lua
local variable = nil
```

Will silence this warning, as `nil` is just the absense of a value (think `null` in most other languages). Not assigning a value is the same as assigning `nil`.

Assignment also permits variables being assigned to other variables in place of a data type.

```lua
local a = 1
local b = a

print(a) --> 1
print(b) --> 1

a = 2

print(a) --> 2
print(b) --> 1
```

Lua automatically handles [whether or not the variable is a reference](https://stackoverflow.com/a/11218501).

## Datatypes

Luau also contains many different types of data to use. As previously mentioned, there are only two ways to make a variable. This means that strings aren't prefixed with `string`, numbers not `int`, `float`, or `double`, etc.

The primitive and most used values are as follows:

* nil (`nil`)
* boolean (`true` / `false`)
* number (`13209` and `042389.0239`)
* string (`"Hello"`, `'Hello'`, and `[[Hello]]`)
* function (`function() end`)
* table (`{"array item", "array item"}`, `{key = "value", item = "content"}`)
* userdata (other type)

Roblox additionally has other custom data types like `Color3`, `Vector2`, `CFrame`s, `Instance`s, [and more](https://developer.roblox.com/en-us/api-reference/data-types).

### `nil`

`nil`, as aforementioned, is the absense of a value (like `null`).

Don't assign this with instances (or their Parent), though: there exists a method called "Destroy" which is a better alternative that moves the instance and its children to `nil`, locks the parent property, and disconnects all connections. This will be built on in a later section.

### `boolean`

Either yes or no, on or off, `true` or `false`. They can be used with ifs and conditional statements. In Luau, a value **not** either `false` or `nil` will evaluate to true and is considered truthy. `0`, `""`, etc. evaluate to true.

Operators can be used in conditional statements to evaluate booleans in a different way. Read more in the Operators section.

### `number`

Any number falls under this type, which may be new if you know other languages. Integers, doubles, and floats are all a part of this type. If needed, you can still check whether the number is an integer with math functions:

```lua
if x ~= math.ceil(x) then
	print(x, "is not an integer!")
end
```

### `string`

Strings are strands of text. They can be made using either quotes (`""`), apostrophes (`''`), or double brackets (`[[]]`). Conversely to C++, apostrophes do not denote a singular character.

### `function`

Functions are types that can be called on with *arguments*, which can be accepted by the function in the form of *parameters*.

```lua
local variable = function(param1)
	print(param1)
end

variable("arg1") --> "arg1"
```

They can also be called with their name and parenthesis with arguments inside, which pass to the function's parameters.

Semantically, functions are made using `function variable()` instead of `variable = function()`. The latter is assigning `variable` to an anonymous function (a function without a name, often provided to other functions since functions can be arguments) instead of making a function called `variable`.

Always prefer the following:

```lua
local function variable(param1)
	print(param1)
end

variable("arg1") --> "arg1"
```

This syntax also allows you to properly define methods in more advanced object-orientated programming.

Functions can also have *return values*, which when called can be assigned to a variable for later use.

```lua
local function GetText(text)
	return text
end

print(GetText("Yahallo")) --> "Yahallo"
local text = GetText("Yahallo")
print(text) --> "Yahallo"
```

A `return` keyword halts the execution of a function, so any code under it will not be run. This allows for compatibility with different return statements in logic, but not execution of code after returning.

```lua
local function WhatIsIt(value)
	if type(value) == "string" then
		return "It's a string!"
	elseif type(value) == "number" then
		return "It's a number!"
	end
	return "I don't know what it is..."
	print("This is after the return keyword")
end

print(WhatIsIt(23409)) --> "It's a number!"
print(WhatIsIt(false)) --> "I don't know what it is..."
```

If you need a function with infinite optional arguments, you can specify this with the `...` parameter. The functions with this as a parameter are referred to as a [**variadic function**](https://en.wikipedia.org/wiki/Variadic_function).

`print` is a variadic function that takes infinite arguments and prints them, for example.

```lua
local function Variadic(...)
	local args = {...}
	print(...)
end
```

The `...` itself is a literal list of each argument as they were called, so a table with `...` as its only item (`{...}`) will be a table of all arguments, as the arguments are comma-separated. This is why it also works with print, because each argument in a list gets passed the same way.

```lua
Variadic("My name is ", false, " but you can call me Al.")
```

Would make the variadic function see this, all under `...`:

```lua
local args = {"My name is ", false, " but you can call me Al."}
print("My name is ", false, " but you can call me Al.")
```

Remember that type checking is possible.

### `table`

A table can be created with two curly brackets (`{}`) and assigned to inside of the brackets or with dot syntax. Table values can contain **any** datatype inside of them.

Note that `table` is a reserved Lua Library and you cannot name a variable "`table`".

#### Arrays

Arrays are tables when you simply need to store an array of values, like the current nonplayer characters inside of a game. In this case, you could do the following:

```lua
local myTable = {
	workspace.NPC1,
	workspace.NPC2,
	workspace.NPC3,
}
```

and you'd have an array. This is only really useful when you iterate through it, but you can also get the values with bracket syntax like so:

```lua
print(myTable[2]) --> workspace.NPC2
```

Note that Lua and Luau use 1-based indexes, so `[0]` doesn't exist.

An array is the same thing as a dictionary that uses bracket index counting from 1:

```lua
local myTable = {
	[1] = workspace.NPC1,
	[2] = workspace.NPC2,
	[3] = workspace.NPC3,
}
```

#### Dictionaries

Dictionaries are tables where each value has a given key, like `Cash`, `Gems`, etc.

```lua
local myTable = {
	Cash = 500,
	Gems = 20, -- the comma can be omitted on the final value
}

myTable.ActiveBoost = "Sprint"

print(myTable.Cash) --> 500
print(myTable["Cash"]) --> 500
print(myTable.ActiveBoost) --> "Sprint"
print(myTable["ActiveBoost"]) --> "Sprint"
```

If needed, you can use bracket syntax to define a key or index the table with a spaced name (or reserved keyword!) or in place of dot syntax:

```lua
local myTable = {
	["Cash and Cents"] = 500.4,
	["Active Boost"] = "Sprint",
	["if"] = true,
	[Vector2] = {
		"tables can be nested, and can have varying types!",
		"this is an array, but we could make a table item inside of this too",
		{
			key = "value",
			[2] = "and this is a nested dictionary (d > a > d)"
		},
	},
}

print(myTable.Cash and Cents) --> SYNTAX ERROR
print(myTable["Cash and Cents"]) --> 500.4
print(myTable.Active Boost) --> SYNTAX ERROR
print(myTable["Active Boost"]) --> "Sprint"
print(myTable.if) --> SYNTAX ERROR
print(myTable["if"]) --> true
print(myTable.Vector2) --> nil --(this is referencing ["Vector2"] not [Vector2])
print(myTable[Vector2]) --> true
print(myTable["Vector2"]) --> nil
```

### `userdata`

Denotes a custom Roblox type. You can also create your own with the [`newproxy()`](https://devforum.roblox.com/t/what-is-newproxy-and-what-is-it-good-for/184454) function, but that requires extensive knowledge of types and metatables.

### `type()`

`type` is a type-checking function that returns the primitive type of its only argument, as a string.

```lua
type("hello") --> "string"
type("1948") --> "string"
type(49318) --> "number"
type(Instance.new("Model")) --> "userdata"
```

### `typeof()`

`typeof` is a Luau extension to `type` that also allows for custom parsing of userdata, or custom types. `type` is still useful when you only need to know if the argument is one of the primitive data types, since `type` is generally faster than `typeof`.

```lua
typeof("hello") --> "string"
typeof("1948") --> "string"
typeof(49318) --> "number"
typeof(Instance.new("Model")) --> "Instance"
```

## Operators

Parenthesis allow for order of operations-based conditional statement evaluation:

```lua
print((not (1 == 1)) or (4 ~= 57)) --> true --(4 is not 57)
```

### Assignment

All assignments are statements, not expressions. This means that

```lua
print(a = 1)
```

will not set `a` to `1` nor print `1` and will instead error.

| Operator | Description | Example |
| -------- | ----------- | ------- |
| `=` | Assign | `i = 527` |
| `+=` | Addition | `i += 1` == `i = i + 1` |
| `-=` | Subtraction | `i -= 1` == `i = i - 1` |
| `*=` | Multiplication | `i *= 3` == `i = i * 3` |
| `^=` | Exponentiation | `i ^= 3` == `i = i ^ 3` |
| `/=` | Division | `i /= 3` == `i = i / 3` |
| `%=` | Modulus (Division Remainder) | `i %= 3` == `i = i % 3` |
| `..=` | Concatenation | `i ..= "."` == `i = i .. "."` |

### Arithmetic

| Operator | Description | Example |
| -------- | ----------- | ------- |
| `+` | Addition | `1 + 1 == 2` |
| `-` | Subtraction | `1 - 1 == 0` |
| `*` | Multiplication | `5 * 5 == 25` |
| `^` | Exponentiation | `2 ^ 4 == 16` |
| `/` | Division | `10 / 5 == 2` |
| `%` | Modulus (Division Remainder) | `13 % 7 == 6` |
| `-` | Unary (Negation) | `-2 == 0 - 2` |
| `..` | Concatenation | `"Hello," .. "World!" == "Hello,World!"` |
| `#` | Length | `#{"Item", "Item"} and #"Hi" == 2` |

### Logical

| Operator | Description | Example |
| -------- | ----------- | ------- |
| `==` | Equal to | `1 == 1` |
| `~=` | Not equal to | `1 ~= 2` |
| `>` | Greater than | `2 > 1` |
| `<` | Less than    | `1 < 2` |
| `>=` | Greater than or equal to | `2 >= 1` |
| `<=` | Less than or equal to | `1 <= 1` |

### Relational

#### `and`

Returns the first argument if it is false or nil, otherwise it returns the second argument.

#### `or`

If the first value is neither false nor nil, the or operator returns the first value. If the first value is false or nil, then it returns the second value.

This can be used with assignments like so:

```lua
local x = y or 0
print(x) --> 0 (as `y` is `nil`)
```

#### `not`

Returns true if the argument is false or nil, otherwise false.

## Logic

Logic is objectively the most important part of coding. Nothing could exist without it.

In Luau, there is only `if` - `elseif` - `else`. No "case" function exists.

### `if`

`if`s let you run code based on whether or not a conditional statement is true or false. If the statement evaluates to true, it will run. If not, it won't. It uses `then` and `end` keywords to wrap the contents inside. The `end` keyword is for the entire block.

```lua
if ConditionalStatement then
	
end
```

Conditional statements were previously mentioned in the `boolean` section. If a statement containing operators evaluates to true, the conditional statement is truthy and allows the block of code to continue.

### `elseif`

Mainly a fallback for `if` that evaluates a second conditional statement if the one above it fails. You can have infinite `elseif`s inside of an if block. It uses the `then` keyword to wrap the contents inside.

```lua
if ConditionalStatement then
	
elseif OtherConditionalStatement then
	
end
```

### `else`

A final fallback for if blocks which doesn't allow for another conditional statement. It handles everything when `if` and all `elseif`s were false. No keywords are required other than itself (`else`).

```lua
if ConditionalStatement then
	
elseif OtherConditionalStatement then
	
else
	
end
```

`else`s are allowed without the usage of `elseif`s.

## Loops

There are 3 different loop types to choose from. Two of them are very similar, and one is a conventional thing you'd think of as a loop.

### `for`

You should already know how this works if you know another programming language, but the syntax might vary.

```lua
for i = 1, 10, 1 do
	print(i) --[[> 1
	               2
	               3
	               4
	               5
	               6
	               7
	               8
	               9
	               10 <]]--
end
```

For those who don't know, the first thing we're doing is assigning the locally scoped `i` to 1, which is where the loop starts at. The second parameter is the maximum (ending) value, where the loop should stop. The final value is the *step* value, which is how much `i` is automatically incremented by. This is automatically `1` when not specified.

You may also count down with this loop, just make `i` larger than the maximum value, and specify a negative step.

```lua
for i = 5, 1, -1 do
	print(i) --[[> 5
	               4
	               3
	               2
	               1 <]]--
end
```

Skipping a certain loop cycle is possible with the `continue` keyword, and ending it is possible with the `break` keyword.

```lua
for i = 1, 10, 1 do
	if i == 5 then
		continue
	elseif i == 7 then
		break
	end
	print(i) --[[> 1
	               2
	               3
	               4
	               6
	               7 <]]--
end
```

This can be used in every loop type.

For loops also allow [iterator functions](https://devforum.roblox.com/t/all-you-need-to-know-about-iterator-functions/572366) to pass variables to them:

```lua
for ... in x do
	
end
```

Where `...` are the arguments that function `x` has passed to the loop. `x` is not the iterator function, but the function that returns the iterator function. `x` could look like this:

```lua
local function x(t)
	local state = 0
	local function iterator()
		state += 1
		return t[state]
	end
	return iterator
end
```

and with it, you could make a loop to go through all of the values in a table:

```lua
for value in x({"item", "meti", 528}) do
	print(value) --[[> "item"
	                   "meti"
			   528 <]]--
end
```

and this is the default behavior of `ipairs`!

```lua
for index, value in ipairs({"item", "meti", 528}) do
	print(index, value) --[[> 1, "item"
	                          2, "meti"
			          3, 528 <]]--
end
```

`ipairs` is a function that returns both the current index and value of the table to the loop.

`pairs` has similar behavior, but it is used on dictionaries to return the current key and value to the loop. It can be used in place of `ipairs`, but `ipairs` cannot be used in place of this.

When using `ipairs` or `pairs`, it is common practice to abbreviate "index" to `i`, "key" to `k`, and "value" to `v`:

```lua
local variable = {}

for k, v in pairs(variable) do
	
end
```

### `while`

This is probably the simplest loop of the 3, the `while` loop. It executes its body while the conditional statement given is met.

```lua
local i = 0

while i ~= 10 or i < 10 do
	i += 1
	print(i) --[[> 1
	               2
		       3
		       4
		       5
		       6
		       7
		       8
		       9
	               10 <]]--
end
```

This can also be used with infinite loops, but you must also add a yield somewhere in the body or the game/script/thread will freeze and crash. Just make a condition that will never be `false`.

```lua
while true do
	-- code
	wait()
end
```

An alias for this is also

```lua
while wait() do
	-- code
end
```

but there are [many reasons](https://docs.google.com/document/d/1ieZ8OzXPiXe3R7rs_xWmYZOnhQevlagN0ZWwoj_zKP4/) why this is an undesirable alternative.

### `repeat` `until`

A bit less used, this will repeat the body until the given condition is met.

```lua
local i = 0

repeat
	i += 1
	print(i) --[[> 1
	               2
		       3
		       4
		       5
		       6
		       7
		       8
		       9
	               10 <]]--
until i >= 10
```

These loops always execute the body at least once, since it executes before checking if the condition is true.

## ModuleScripts

These are extremely simple to understand on a basic level. There is a deeper level of understanding you can achieve, but you don't need to have an immense amount of understanding to use these.

Now, to be blunt, ModuleScripts are functions.

That's it.

Inside of a ModuleScript, you may notice there is a `return` keyword at the end. This is what gets returned when using the `require` keyword, but only once. Roblox stores the return value in memory so there is only one execution of a singular ModuleScript.

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

and some even utilize Metatables or Methods.

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

ModuleScripts also have different variable naming conventions, specifically prefixing private (not to be tampered) values with an underscore (\_).

## Instances

So you know how Luau works, but now how do we apply that to Roblox itself?

To begin with, the entirety of Roblox is built upon things called "Instances". They inherit the properties of their parent on [the hierarchy](https://roblox.fandom.com/wiki/Class_reference).

When you reference an instance inside of the game, you use the global `game` variable. The `game` variable points to the DataModel, which you can think of as the *entire* game, not just what you see when playing (which is the workspace).

The game directly contains special instances called "Services" which cannot be created and can be semantically retrieved using the `GetService` method of `game`.

```lua
local ServerScriptService = game:GetService("ServerScriptService")
```

Workspace is a service of the DataModel which contains all of the visible parts and terrain of a Roblox game.
Spawn locations, guns, walls, buildings, and everything interactable in the 3 dimensional scope.

With workspace, it is recommended not to use `game:GetService("Workspace")` (which still works!) and instead `game.Workspace` or `workspace`. `game.Workspace` is a property of the game that will always point to workspace, and `workspace` is a seperate global which also references the workspace.

We'll be using `game.Workspace`.

There is another global similar to this which references the current script's path, called `script`. Because scripts are instances, you can do `script.Parent` to get the parent of the script.

You can set your own coding formatting guidelines, but we will always prefer not using relative paths (like `script.Parent`) and instead absolute paths (like `game:GetService("ServerScriptService")`). If relative paths are absolutely required, you can use them.

## Builtins

Reference for built-in functions, constants, and libraries. Often called "Globals".

### print / warn / error

Prints the provided message to the output. If you use `warn`, the message will appear orange. `error` is special in that it terminates the execution of the script with the given message and also allows a "level" number argument that changes how the message links back to the script. 0 gives no information, 1 gives the position where `error` was called, and 2 links to the function that called `error`.

You may also notice there is a function called `printidentity`, which prints the Script's thread security level. You can [learn about that](https://devforum.roblox.com/t/a-current-explanation-of-normal-identities-and-security-tags/219471) on your own.

### tostring/tonumber

`tostring` converts the argument (of any type) given into a string.

```lua
print(tostring(40193)) --> 40193
print(tostring(true)) --> "true"
print(tostring(Vector2)) --> "table: 0x684b2c9b31db5858" --(Vector2 is technically a table/userdata that has a metatable)
```

`tonumber` is similar, but requires the first argument to be a string. A second argument is also allowed which will specify the base to interpret the number in.

```lua
print(tonumber("1337")) --> 1337
print(tonumber("1.25")) --> 1.25
print(tonumber("3e2")) --> 300
print(tonumber("25", 8)) --> 21
print(tonumber("0x100")) --> 256
print(tonumber("roblox")) --> nil
```

### assert

Throws an error when the first argument is falsy (`false` or `nil`) with an optional second argument as the error message.

Can be used in conjunction with `pcall`.

### select

When the first argument passed is a number, `select` will convert the arguments to a table, get the index from that argument, and convert the values back (it won't actually do that, this is just for conceptualization). If the number is negative, it will take the values from the end and back.

```lua
print(select(2, "A", "B", "C")) --> B C
print(select(-1, "A", "B", "C")) --> C
```

When the first argument is a string and `"#"`, it will return the total amount of arguments passed to it:

```lua
print(select("#", "A", "B", "C")) --> 3
```

### wait

`wait` is a function which yields the current thread/script for the provided seconds (or 29 miliseconds if not provided).

Unfortunately, `wait` does not wait the exact amount of time inputted, as it is based on framerate and not time. It only guarantees that the *minimum* time it waits is the provided seconds.

It also returns how much time it did actually wait, so you can make use of the delta time in some scenarios.

```lua
print(wait(5)) --> 5.00318529843 --(also waits this time before outputting)
```

When using Luau, it is *highly* recommended to use the `:Wait()` method on Events to yield the thread until the event is triggered. There is also [an alternative](https://devforum.roblox.com/t/avoiding-wait-and-why/244015) which uses BindableEvents, even if they are costly.

### delay

Similar to JavaScript's `setTimeout`, this takes a delay time and a function and will run the function after the specified delay time. The delayed time is very similar to the behavior of `wait`, so an alternative to this function is preferred if accuracy is needed.

### get/setfenv

The "fenv" in this function means "function environment", and is a table of everything the function has access to. This will not include locally-scoped variables, as globally-scoped variables are stored in this environment.

When getting the environment (`getfenv`), you can provide a function as the only argument to get the environment of that function, or you can use an integer to get the function based on stack:

* 0 is global
* 1 is function (same as `nil` in this function)
* 2 is function calling function
* 3 is function calling function calling function

Remember that the function environment only has `script` by default, as globally-scoped variables are added to it.

Setting the environment (`setfenv`) sets the first function argument's function environment to the second (table) argument. Global values from that environment can be referenced like normal.

### (x)pcall

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

`ypcall` is another function that acts the same as `pcall`, but can yield. Since `pcall` has since been tweaked to allow yielding, it has been deprecated. It's still sometimes used for an example of a deprecated global.

### get/setmetatable

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

You can then get the metatable of a table by doing `getmetatable` if `__metatable` is not present.

#### rawget

A simple function to get the real value of the second passed argument from the first argument (as a table), without invoking `__index` or `__newindex` metamethods.

```lua
rawget(Table, "Cash") --> 100
```

#### rawset

Sets the value of the second passed argument to the third argument in the first argument (which has to be a table), without invoking `__index` or `__newindex` metamethods.

```lua
rawset(Table, "Cash", 500)
```

#### rawequal

Checks if the provided two tables are equal without invoking the `__eq` metamethod.

### collectgarbage("count")

Returns the total memory in use by Lua (in kilobytes). No other parameter/argument is allowed by Luau (it must be "count").

### loadstring

Loads the only argument (which is a string) as Luau code, excluding binary or bytecode. It only works with `game.ServerScriptService.LoadStringEnabled` set to true, and you must do that in Studio.

Some better alternatives exist which *can* execute bytecode, but that isn't a part of this function. [vLua](https://roblox.com/library/4689019964/vLua-5-1) is a good choice for that.
