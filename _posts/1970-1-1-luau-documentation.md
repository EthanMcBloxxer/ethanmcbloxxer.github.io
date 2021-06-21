---
title: Lua*u* Documentation
subtitle: A tutorial for the Luau (Roblox's sandboxed Lua) language.
---

Luau is an extension of Lua, so you will also be learning Lua if you follow this tutorial.

## Scripts

Scripts are the core of Roblox's engine, and where Luau actually runs inside of Roblox.

To make one, go into your Explorer menu (View → Explorer) and hover over ServerScriptService. Right click on it and then click on `Insert Object...`. Search for just "Script", and click on `Script`. You should now be in the script editor. If you ever leave the script editor you can get back into it by double clicking on the script you want to edit.

On Roblox, "Script"s run on the server and "LocalScript"s run on the client. Scripts can run in Workspace, but this is only for compatibility with some features like Tools. **Never put Scripts in Workspace**. ServerScriptService is the proper alternative which does not allow exploiters to scan for vulnerabilities in your code.

## LocalScripts

LocalScripts function the same way as Scripts, but they only run on the local computer. These are often used for GUIs and other scenarios which you would need to send data from the client to server. This is possible with Remote Events & Functions, but that is outside the scope of this section.

<!-- Pre-rendered --><details><summary><h2>Comments and Output</h2></summary>

<p>A comment in Lua is begun with <code>--</code> (two hyphens).</p>

<p>Output or return values are denoted when a <code>&gt;</code> (greater than) symbol succeeds it, and has no other special meaning. This convention may only be used in this guide, meaning that you won’t find <code>--&gt;</code> in use all the time.</p>

<p>Block comments also exist, which are created when two brackets (<code class="language-plaintext highlighter-rouge">[[]]</code>) succeed a normal comment (<code class="language-plaintext highlighter-rouge">--</code>). The commented text is inside of the double brackets. Generally, block comments follow this convention:</p>

<div class="language-lua highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="cm">--[[
function ThisCodeDoesNotWork do
	"what"?/?; if(This Works) { Kill(Everything); }
end
--]]</span>
</code></pre></div></div>

<p>as you are able to just add a single hyphen to the beginning of the block comment and the contents will become runnable:</p>

<div class="language-lua highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="c1">---[[</span>
<span class="k">function</span> <span class="nf">ThisCodeDoesNotWork</span> <span class="k">do</span>
	<span class="s2">"what"</span><span class="err">?</span><span class="o">/</span><span class="err">?</span><span class="p">;</span> <span class="k">if</span><span class="p">(</span><span class="n">This</span> <span class="n">Works</span><span class="p">)</span> <span class="p">{</span> <span class="n">Kill</span><span class="p">(</span><span class="n">Everything</span><span class="p">);</span> <span class="p">}</span>
<span class="k">end</span>
<span class="c1">--]]</span>
</code></pre></div></div>

<p>Any number of equals signs (<code class="language-plaintext highlighter-rouge">=</code>) can be in between the brackets and it will still render as a block comment:</p>

<div class="language-lua highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="cm">--[==[
function ThisCodeDoesNotWork do
	"what"?/?; if(This Works) { Kill(Everything); }
end
--]==]</span>
</code></pre></div></div>

<p>The same number of equals signs are required in both of the brackets.</p>

</details>

## Variables

A variable is something that can be referenced and changed with assignments. They are always case-sensitive.

There are (technically) two ways to create them:

```lua
local variable = "data"
-- or
variable = "data"
```

`local`{:.language-lua} is a keyword that represents a locally-scoped variable. Think of `let`{:.language-js} in JavaScript. It only exists in the current block (ifs, loops, etc) or, in the absence of one, across the entire script.

When there is no keyword, it creates a globally-scoped variable (`var`{:.language-js} in JavaScript). You can use this new variable throughout the entire running script.

Locally scoped variables are always preferred. Conversely to JavaScript (which is just an example language to compare to), locally-scoped variables offer a hefty (30%+) performance boost over globally scoped ones. This is because they are only integrated within the containing block environment.

If you need to, you can initiate a variable without a value. This is most often used when you need a variable to be accessible in a previous block from where you are changing said variable (referred to as a forward declaration or upvalue).

```lua
local variable
```

Luau will warn you that this is unnecessary until you use it later. Appending `= nil`{:.language-lua} will silence this warning, as `nil`{:.language-lua} is just the absense of a value (think `null`{:.language-cs} in most other languages). Not assigning a value is a lot like assigning `nil`{:.language-lua}.

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

Inside of these variables, many different types of data are able to be used. As previously mentioned, there are only two ways to make a variable. This means that strings aren't prefixed with `string`, numbers not `int`, `float`, or `double`, etc.

The primitive and most used values are as follows:

* nil (`nil`{:.language-lua})
* boolean (`true`{:.language-lua} / `false`{:.language-lua})
* number (`13209`{:.language-lua} and `042389.0239`{:.language-lua})
* string (`"Hello"`{:.language-lua}, `'Hello'`{:.language-lua .highlight}, and `[[Hello]]`{:.language-lua})
* function (`function() end`{:.language-lua})
* table (`{"array item", "array item"}`{:.language-lua}, `{key = "value", item = "content"}`{:.language-lua})
* userdata (other type)

Roblox additionally has other custom data types like `Color3`, `Vector2`, `CFrame`s, `Instance`s, [and more](https://developer.roblox.com/en-us/api-reference/data-types).

### `nil`

`nil`{:.language-lua}, as aforementioned, is the absense of a value (like `null`{:.language-cs}).

Don't assign this with instances (or their Parent), though: there exists a method called "Destroy" which is a better alternative that moves the instance and its children to `nil`{:.language-lua}, locks the parent property, and disconnects all connections. This will be built on in a later section.

### `boolean`

Either yes or no, on or off, `true`{:.language-lua} or `false`{:.language-lua}. They can be used with ifs and conditional statements. In Luau, a value **not** either `false`{:.language-lua} or `nil`{:.language-lua} will evaluate to true and is considered truthy. `0`{:.language-lua}, `""`{:.language-lua}, etc. evaluate to true.

Operators can be used in conditional statements to evaluate booleans in a different way. Read more in the Operators section.

### `number`

Any number falls under this type, which may be new if you know other languages. Integers, doubles, and floats are all a part of this type. If needed, you can still check whether the number is an integer with math functions:

```lua
if x ~= math.ceil(x) then
	print(x, "is not an integer!")
end
```

### `string`

Strings are strands of text. They can be made using either quotes (`""`{:.language-lua}), apostrophes (`''`{:.language-lua}), or double brackets (`[[]]`{:.language-lua}). Conversely to most lower-level languages, apostrophes do not denote a singular character.

### `function`

Functions are types that can be called on with *arguments*, which can be accepted by the function in the form of *parameters*.

```lua
local variable = function(param1)
	print(param1)
end

variable("arg1") --> "arg1"
```

They can also be called with their name and parenthesis with arguments inside, which pass to the function's parameters.

Normally, functions are made using `function variable()`{:.language-lua} instead of `variable = function()`{:.language-lua}. The latter is assigning <var>variable</var> to an anonymous function (a function without a name, often provided to other functions since functions can be arguments) instead of making a function called <var>variable</var>. Doing the former is syntactic sugar and are often preferred:

```lua
local function variable(param1)
	print(param1)
end

variable("arg1") --> "arg1"
```

This syntatic sugar also allows you to properly define methods in more advanced object-orientated programming, which we'll get to later.

Functions can also have *return values*, which when called can be assigned to a variable for later use.

```lua
local function GetText(text)
	return text
end

print(GetText("Yahallo")) --> "Yahallo"
local text = GetText("Yahallo")
print(text) --> "Yahallo"
```

A `return`{:.language-lua} keyword halts the execution of a function, so any code under it will not be run. This allows for compatibility with different return statements in logic, but not execution of code after returning.

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

`print`{:.language-lua} is a variadic function that takes infinite arguments and prints them, for example.

```lua
local function Variadic(...)
	local args = {...}
	print(...)
end
```

The `...` itself could be thought of as a literal list of each argument as they were called, so a table with `...` as its only item (`{...}`) will be a table of all arguments, as the arguments are comma-separated. This is why it also works with `print`{:.language-lua}, because each argument in a list gets passed the same way.

Calling `Variadic("My name is ", false, " but you can call me Al.")`{:.language-lua} would, in practice, make the variadic function see this, all under `...`:

```lua
local args = {"My name is ", false, " but you can call me Al."}
print("My name is ", false, " but you can call me Al.")
```

Remember that type checking is possible, along with recursive functions (functions which call themselves again).

### `table`

A table can be created with two curly brackets (`{}`{:.language-lua}) and assigned to inside of those brackets, with dot syntax, or with bracket syntax. Table values can contain **any** datatype inside of them.

Note that <var>table</var> is a reserved Lua Library and you cannot name a variable "<var>table</var>".

#### Arrays

Arrays are tables when you simply need to store an array of values, like the current nonplayer characters inside of a game. In this case, you could do the following:

```lua
local a = {
	workspace.NPC1,
	workspace.NPC2,
	workspace.NPC3, -- the comma can be omitted on the final value
}
```

and you'd have an array. This is only really useful when you iterate through it, but you can also get the values with bracket syntax like so:

```lua
t[2] --> workspace.NPC2
```

Note that Lua and Luau use 1-based indexes, so `[0]`{:.language-lua} doesn't exist.

An array is the same thing as a dictionary that uses bracket index counting from 1:

```lua
local d = {
	[1] = workspace.NPC1,
	[2] = workspace.NPC2,
	[3] = workspace.NPC3,
}
```

#### Dictionaries

Dictionaries are tables where each value has a given key, like `Cash`, `Gems`, etc.

```lua
local t = {
	Cash = 500,
	Gems = 20, -- the comma can be omitted on the final value
}

t.ActiveBoost = "Sprint"

t.Cash --> 500
t["Cash"] --> 500
t.ActiveBoost --> "Sprint"
t["ActiveBoost"] --> "Sprint"
```

If needed, you can enclose values in brackets to define a key or index the table with a spaced name (or reserved keyword!) or in place of dot syntax:

```lua
local t = {
	NormalKey = Vector2.new(1, 1),
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

t.NormalKey --> [Vector2] 1, 1
t["NormalKey"] --> [Vector2] 1, 1
t.Cash and Cents --> SYNTAX ERROR
t["Cash and Cents"] --> 500.4
t.Active Boost --> SYNTAX ERROR
t["Active Boost"] --> "Sprint"
t.if --> SYNTAX ERROR
t["if"] --> true
t.Vector2 --> nil --(this is referencing ["Vector2"] not [Vector2])
t[Vector2] --> { ... }
t["Vector2"] --> nil
```

### `userdata`

Denotes a custom Roblox type. You can also create your own with the [`newproxy()`{:.language-lua}](https://devforum.roblox.com/t/what-is-newproxy-and-what-is-it-good-for/184454) function, but that requires extensive knowledge of types and metatables (and in most cases is unnecessary).

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
((not (1 == 1)) or (4 ~= 57)) --> true --(4 is not 57)
```

### Assignment

All assignments are [statements, not expressions](https://programming.guide/statements-vs-expressions.html). This means that `print(a = 1)`{:.language-lua} will not set `a` to `1` nor print `1` and will instead error.

| Operator | Description | Example |
|----------|-------------|---------|
| `=` | Assign | `i = 527` |
| `+=` | Addition | `i += 1 == i = i + 1` |
| `-=` | Subtraction | `i -= 1 == i = i - 1` |
| `*=` | Multiplication | `i *= 3 == i = i * 3` |
| `^=` | Exponentiation | `i ^= 3 == i = i ^ 3` |
| `/=` | Division | `i /= 3 == i = i / 3` |
| `%=` | Modulus (Division Remainder) | `i %= 3 == i = i % 3` |
| `..=` | Concatenation | `i ..= "." == i = i .. "."` |

### Arithmetic

| Operator | Description | Example |
|----------|-------------|---------|
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
|----------|-------------|---------|
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

In Luau, there is only `if`{:.language-lua} - `elseif`{:.language-lua} - `else`{:.language-lua}. No "case" function exists.

### `if`

`if`{:.language-lua}s let you run code based on whether or not a conditional statement is true or false. If the statement evaluates to true, it will run. If not, it won't. It uses `then`{:.language-lua} and `end`{:.language-lua} keywords to wrap the contents inside. The `end`{:.language-lua} keyword is for the entire block.

```lua
if ConditionalStatement then
	
end
```

Conditional statements were previously mentioned in the `boolean` section. If a statement containing operators evaluates to true, the conditional statement is truthy and allows the block of code to continue.

Note that familiarity with other languages can be achieved by surrounding the conditional statement in parenthesis. As said in the Operators section, parenthesis allow for order of operations parsing, but surrounding with them won't do anything.

```lua
if (ConditionalStatement) then
	
end
```

### `elseif`

Mainly a fallback for `if`{:.language-lua} that evaluates a second conditional statement if the one above it fails. You can have infinite `elseif`{:.language-lua}s inside of an if block. It uses the `then`{:.language-lua} keyword to wrap the contents inside.

```lua
if ConditionalStatement then
	
elseif OtherConditionalStatement then
	
end
```

### `else`

A final fallback for if blocks which doesn't allow for another conditional statement. It handles everything when `if`{:.language-lua} and all `elseif`{:.language-lua}s were false. No keywords are required other than itself (`else`{:.language-lua}).

```lua
if ConditionalStatement then
	
elseif OtherConditionalStatement then
	
else
	
end
```

`else`{:.language-lua}s are allowed without the usage of `elseif`{:.language-lua}s.

## Loops

There are 3 different loop types to choose from. Two of them are very similar, and one is a conventional thing you'd think of as a loop.

You can also use `do`{:.language-lua} and `end`{:.language-lua} without a loop to [alter the variable scope](https://stackoverflow.com/questions/23895406/why-use-a-do-end-block-in-lua).

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

For those who don't know, the first thing we're doing is assigning the locally scoped <var>i</var> to 1, which is where the loop starts at. The second parameter is the maximum (ending) value, where the loop should stop. The final value is the *step* value, which is how much <var>i</var> is automatically incremented by. This is automatically `1` when not specified.

You may also count down with this loop, just make <var>i</var> larger than the maximum value, and specify a negative step.

```lua
for i = 5, 1, -1 do
	print(i) --[[> 5
	               4
	               3
	               2
	               1 <]]--
end
```

Skipping a certain loop cycle is possible with the `continue`{:.language-lua} keyword, and ending it is possible with the `break`{:.language-lua} keyword.

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

Where `...` are the arguments that function <var>x</var> has passed to the loop. <var>x</var> is not the iterator function, but the function that returns the iterator function. <var>x</var> could look like this:

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

and this is the default behavior of `ipairs`{:.language-lua}!

```lua
for index, value in ipairs({"item", "meti", 528}) do
	print(index, value) --[[> 1, "item"
	                          2, "meti"
			          3, 528 <]]--
end
```

`ipairs`{:.language-lua} is a function that returns both the current index and value of the table to the loop.

`pairs`{:.language-lua} has similar behavior, but it is used on dictionaries to return the current key and value to the loop. It can be used in place of `ipairs`{:.language-lua}, but `ipairs`{:.language-lua} cannot be used in place of this.

When using `ipairs`{:.language-lua} or `pairs`{:.language-lua}, it is common practice to abbreviate "index" to `i`, "key" to `k`, and "value" to `v`:

```lua
local variable = {}

for k, v in pairs(variable) do
	
end
```

### `while`

This is probably the simplest loop of the 3, the `while`{:.language-lua} loop. It executes its body while the conditional statement given is met.

```lua
local i = 0

while i < 10 do
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

This can also be used with infinite loops, but you must also add a yield somewhere in the body or the game/script/thread will freeze and crash. Just make a condition that will never be `false`{:.language-lua}.

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

**Do not use these loops as a way to wait for an instance.** `:WaitForChild()`{:.language-lua} and `:Wait()`{:.language-lua} / `Player.CharacterAdded:Wait()`{:.language-lua} exist for a reason. Never repeat `wait()`{:.language-lua}.

## ModuleScripts

These are extremely simple to understand on a basic level. There is a deeper level of understanding you can achieve, but you don't need to have an immense amount of understanding to use these.

Now, to be blunt, ModuleScripts are functions.

That's it.

Inside of a ModuleScript, you may notice there is a `return`{:.language-lua} keyword at the end. This is what gets returned when using the `require`{:.language-lua} function, but only once. Roblox stores the return value in memory so there is only one execution of a singular ModuleScript.

Say I have the following code in a ModuleScript:

```lua
return "This is a ModuleScript"
```

and this in a Script:

```lua
local Module = require(ModuleScript) -- replace ModuleScript with path
print(Module) --> "This is a ModuleScript"
```

In the Script, you call the ModuleScript and the ModuleScript returns `"This is a ModuleScript"`{:.language-lua}. That return value is stored in the <var>Module</var> variable, which we print.

The ModuleScript's code can be thought of more like this:

```lua
function Module()
	return "This is a ModuleScript"
end
```

Most use ModuleScripts with tables as return values, like so:

```lua
return {
	Say = function(text)
		print(text)
	end,
	AddCash = function(player, cash)
		player.leaderstats.Cash.Value += cash -- this is just an example
	end,
}
```

which allows us to do this in Scripts:

```lua
local Module = require(ModuleScript)

Module.Say("Some text is cool") --> "Some text is cool"
Module.AddCash(game.Players.EthanMcBloxxer, 1000)
```

you may also see table assignments like this, which also works:

```lua
local Exports = {}

Exports.Say(text)
	print(text)
end

return Exports
```

and some even utilize Metatables or Methods.

Another thing to note is that code inside of the ModuleScript will be ran. Functions inside of them don't run automatically (as functions don't run without being called), so you can make code inside of the ModuleScript run on calling:

```lua
print("Ran ModuleScript")

return true
```

which would do the following in a Script:

```lua
local bool = require(ModuleScript) --> "Ran ModuleScript"
print(tostring(bool)) --> "true"
```

ModuleScripts are also a way to use custom classes and objects. Read more about that in the Objects section.

## Instances

So you know how Luau works, but now how do we apply that to Roblox itself?

To begin with, the entirety of Roblox is built upon things called "Instances". They inherit the properties of their parent on [the hierarchy](https://roblox.fandom.com/wiki/Class_reference).

When you reference an instance inside of the game, you use the global <var>game</var> variable. The <var>game</var> variable points to the DataModel, which you can think of as the *entire* game, not just what you see when playing (which is the workspace).

The game directly contains special instances called "Services" which cannot be created and can be semantically retrieved using the `GetService`{:.language-lua} method of <var>game</var>.

```lua
local ServerScriptService = game:GetService("ServerScriptService")
```

You can think of the DataModel like a giant dictionary:

```lua
game = {
	Workspace = {
		Camera = {
			ClassName = "Camera",
		},
		Terrain = {
			ClassName = "Terrain",
		},
		Baseplate = {
			Texture = {
				Texture = "rbxassetid://6372755229",
				Transparency = 0.8,
				StudsPerTileU = 8,
				StudsPerTileV = 8,
				Face = Enum.NormalId.Top,
				ClassName = "Texture",
			},
			ClassName = "Part",
			Position = Vector3.new(0, -8, 0),
			Size = Vector3.new(2048, 16, 2048),
		},
	},
	Players = {},
	
	-- etc
	
}
```

There is another global similar to this which references the current script's path, called <var>script</var>. Because scripts are instances, you can do `script.Parent`{:.language-lua} to get the parent of the script.

You can set your own coding formatting guidelines, but we will always prefer not using relative paths (like `script.Parent`{:.language-lua}) and instead absolute paths (like `game:GetService("ServerScriptService")`{:.language-lua}). If relative paths are absolutely required, you can use them.

Some services exist but are not visible in Explorer, as there is no reason to add any content under them inside of Studio. These can still be referenced with `:GetService`{:.language-lua}. Most of the hidden ones have -Service at the end of them.

### Workspace

Workspace is a service of the DataModel which contains all of the visible parts and terrain of a Roblox game.
Spawn locations, guns, walls, buildings, and everything interactable in the 3 dimensional scope.

With workspace, it is recommended not to use `game:GetService("Workspace")`{:.language-lua} (which still works!) and instead `game.Workspace`{:.language-lua} or <var>workspace</var>. `game.Workspace`{:.language-lua} is a property of the game that will always point to workspace, and <var>workspace</var> is a seperate global which also references the workspace.

We'll be using <var>workspace</var>.

### Players

A service which contains the data for each player in the game. It contains only [`Player`](https://developer.roblox.com/en-us/api-reference/class/Player) instances. Since workspace is the only service that contains visible parts, a seperate model is added to workspace that can be referenced with the <var>Character</var> property of Player, which contains all of the parts, textures, and meshes of a player.

#### Player

An instance categorized under this service since it is the only location it can exist.

##### Character

A property pointing to the player's character, which is inside of the Workspace.

##### DisplayName

The player's display name.

##### Name

The instance name, which is the player's current username.

##### UserId

The player's user id, which should be used programmatically since the user can change their user and display names.

##### CharacterAdded

An event that fires when a player's character is added or respawns.

##### CharacterRemoving

An event that fires when a player's character is removed or dies.

#### PlayerAdded

A highly useful event used to perform actions on a new player, which can be used to load data or change their appearance.

```lua
game:GetService("Players").PlayerAdded:Connect(function(Player)
	print(Player.UserId) --> 234945843 --(if user 234945843 had joined the game)
end)
```

#### PlayerRemoving

Similar to PlayerAdded, but when a player leaves the game. This is the best time to save data.

```lua
game:GetService("Players").PlayerRemoving:Connect(function(Player)
	print(Player.UserId) --> 234945843 --(if user 234945843 had left the game)
end)
```

#### GetPlayers

Can be used to iterate through all players in a game.

```lua
for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
	print(Player.Name) --> "EthanMcBloxxer" --(if EthanMcBloxxer was the only player in the game)
end
```

### Lighting

Stores instances which change certain aspects of lighting and shading [(post-processing)](https://developer.roblox.com/en-us/articles/post-processing-effects). Sky instances change the sky when in this service, and [Effects](https://developer.roblox.com/en-us/api-reference/class/PostEffect) will apply changes.

### ReplicatedStorage

A container which instances will be replicated to the client. When the server moves an object to this service, it will also replicate across all clients. Scripts and LocalScripts will not execute here. Client modifications to children of this service will not be replicated to neither other clients or the server.

This is the ideal location to store [RemoteEvents](https://developer.roblox.com/en-us/api-reference/class/RemoteEvent) and [RemoteFunctions](https://developer.roblox.com/en-us/api-reference/class/RemoteFunction).

### ServerScriptService

The service which contains all Scripts that will be executed on server creation. Prefer storing Scripts in this service opposed to workspace, as exploiters cannot read it.

### ServerStorage

An alternative to ReplicatedStorage which can only be read by the server. Store important data here, like player data or keys.

### StarterGui

All children of this service will get copied to every new player's PlayerGui. In order to create GUI, you must first make a ScreenGui instance, which acts as a container for all other GUI objects. Inside of LocalScripts here, do not refer to StarterGui as the container, but `game.Players.LocalPlayer:WaitForChild("PlayerGui")`{:.language-lua} should be used instead.

### StarterPack

Similar to StarterGui, all children (specifically [Tools](https://developer.roblox.com/en-us/articles/intro-to-player-tools)) will get copied to each player's Backpack.

### StarterPlayer

Allows modification of the player when created, like WalkSpeed and JumpPower.

#### StarterPlayerScripts / StarterCharacterScripts

An ideal location for LocalScripts. When referring to the player, use `game.Players.LocalPlayer`{:.language-lua}. StarterCharacterScripts should be used when the player's character is needed for the LocalScript to execute.

### DataStoreService

A storage solution for games, meant to store persistent data for players, like their money, inventory, etc.

They are stored per game, meaning a game (or creator through the command bar) can access any key inside of a data store.

DataStoreService is only accessible and usable through `Script`s (the server). Doing any function in a `LocalScript` will call an error.

All read or write functions which are part of either this service or a DataStore instance are *highly* recommended to be wrapped in a `pcall`{:.language-lua}. DataStores can error for a number of reasons without warning, as they are essentially network calls.

#### GetDataStore

Returns the provided DataStore which has the same name as the provided string.

```lua
local CashData = game:GetService("DataStoreService"):GetDataStore("Cash")
```

If you need to store generic data without a given name, you can use the `GetGlobalDataStore` function to get the default DataStore. This is not recommended for player data.

When storing player data, you should use their UserID (as a string) for the data key.

##### GetAsync

Gets the data stored in the DataStore with the provided key name, given that the key exists.

```lua
local Success, Experience = pcall(function()
	return game:GetService("DataStoreService"):GetDataStore("Experience"):GetAsync("1234")
end)

if Success then
	print("Player ID 1234 has", Experience, "exp.")
end
```

##### SetAsync

Sets the given key to the given value in the DataStore it is called on.

When knowing the previous value is important, use `UpdateAsync` instead. This will result in fewer calls opposed to storing `GetAsync`'s return (which can be cached) and doing logic before calling `SetAsync`, which could then fail.

```lua
local Success, Message = pcall(function()
	return game:GetService("DataStoreService"):GetDataStore("Experience"):SetAsync("1234", 500)
end)

if not Success then
	-- Error Handling (maybe retry later?)
end
```

##### UpdateAsync

First gets the provided key, and passes the old value to the other function, which returns what the provided key should be set to.

```lua
local Success, Message = pcall(function()
	game:GetService("DataStoreService"):GetDataStore("Experience"):UpdateAsync("1234", function(Old)
		if Old == 69 then
			return "69 (nice)"
		end
	end)
end)

if not Success then
	-- Error Handling (maybe retry later?)
end
```

##### IncrementAsync

Similar to UpdateAsync, but instead increments the provided key (which has to be a number) by the given increment.

```lua
local Success, Experience = pcall(function()
	return game:GetService("DataStoreService"):GetDataStore("Experience"):IncrementAsync("1234", 100)
end)

if not Success then
	-- Error Handling (maybe retry later?)
end
```

##### RemoveAsync

To be used almost exclusively in Studio's command bar by a developer, mostly because Roblox needs a key deleted (because of GDPR, CCPA, etc.), you can delete a key like so:

```lua
game:GetService("DataStoreService"):GetDataStore("Experience"):RemoveAsync("1234")
```

## Builtins

Reference for built-in functions, constants, and libraries. Often called "Globals".

### print / warn / error

Prints the provided message to the output. If you use `warn`{:.language-lua}, the message will appear orange. `error`{:.language-lua} is special in that it terminates the execution of the script with the given message and also allows a "level" number argument that changes how the message links back to the script. 0 gives no information, 1 gives the position where `error`{:.language-lua} was called, and 2 links to the function that called `error`{:.language-lua}.

You may also notice there is a function called `printidentity`{:.language-lua}, which prints the Script's thread security level. You can [learn about that](https://devforum.roblox.com/t/a-current-explanation-of-normal-identities-and-security-tags/219471) on your own.

### tostring/tonumber

`tostring`{:.language-lua} converts the argument (of any type) given into a string.

```lua
tostring(40193) --> "40193"
tostring(true) --> "true"
tostring(Vector2) --> "table: 0x684b2c9b31db5858" --(Vector2 is technically a table/userdata that has a metatable)
tostring(Vector2.new(1, 5)) --> "1, 5"
```

`tonumber`{:.language-lua} is similar, but requires the first argument to be a string. A second argument is also allowed which will specify the base to interpret the number in.

```lua
tonumber("1337") --> 1337
tonumber("1.25") --> 1.25
tonumber("3e2") --> 300
tonumber("25", 8) --> 21
tonumber("0x100") --> 256
tonumber("roblox") --> nil
```

### \_G / shared

These are global variables which serve the exact same purpose, but are different tables. They're shared across every script with the same execution level, meaning that you can assign `_G.text`{:.language-lua} to `"hello"`{:.language-lua} or `shared.text`{:.language-lua} to `"hello"`{:.language-lua} and later reference that in another script. Think of them like the automatic global ModuleScript, but prefer real ModuleScripts.

### assert

Throws an error when the first argument is falsy (`false`{:.language-lua} or `nil`{:.language-lua}) with an optional second argument as the error message.

Can be used in conjunction with `pcall`{:.language-lua}.

### select

When the first argument passed is a number, `select`{:.language-lua} will convert the arguments to a table, get the index from that argument, and convert the values back. (It won't actually do that, but it behaves the same way.) If the number is negative, it will take the values from the end and back.

```lua
select(2, "A", "B", "C") --> B C
select(-1, "A", "B", "C") --> C
```

When the first argument is a string and `"#"`{:.language-lua}, it will return the total amount of arguments passed to it.

```lua
select("#", "A", "B", "C") --> 3
```

### wait

`wait`{:.language-lua} is a function which yields the current thread/script for the provided seconds (or 29 miliseconds if not provided).

Unfortunately, `wait`{:.language-lua} does not wait the exact amount of time inputted, as it is based on framerate and not time. It only guarantees that the *minimum* time it waits is the provided seconds.

It also returns how much time it did actually wait, so you can make use of the delta time in some scenarios.

```lua
print(wait(5)) --> 5.00318529843 --(also waits this time before outputting)
```

When using Luau, it is *highly* recommended to use the `:Wait()`{:.language-lua} method on Events to yield the thread until the event is triggered. There is also [another alternative](https://devforum.roblox.com/t/avoiding-wait-and-why/244015) which uses BindableEvents, even if they are costly.

### delay

Similar to JavaScript's `setTimeout`{:.language-js}, this takes a delay time and a function and will run the function after the specified delay time. The delayed time is very similar to the behavior of `wait`{:.language-lua}, so an alternative to this function is preferred if accuracy is needed.

### get/setfenv

The "fenv" in this function means "function environment", and is a table of everything the function has access to. This will not include locally-scoped variables, as globally-scoped variables are stored in this environment.

When getting the environment (`getfenv`{:.language-lua}), you can provide a function as the only argument to get the environment of that function, or you can use an integer to get the function based on stack:

* 0 is global
* 1 is function (same as `nil`{:.language-lua} in this function)
* 2 is function calling function
* 3 is function calling function calling function
* 4 is function calling function calling function calling function
* etc

Remember that the function environment only has <var>script</var> by default, as globally-scoped variables are added to it.

Setting the environment (`setfenv`{:.language-lua}) sets the first function argument's function environment to the second (table) argument. Global values from that environment can be referenced like normal.

### (x)pcall

A pcall (protected call) is a function which is similar to `try`{:.language-js} and `catch`{:.language-js} in most languages, but you have to implement custom logic for it to be used in that way.

```lua
pcall(function(Words)
	print(Words)
end, "pcalls are cool!") --> "pcalls are cool!"
```

Right here, we're simply creating an anonymous function and providing it to `pcall`{:.language-lua}. All extra arguments that `pcall`{:.language-lua} has are passed to the provided function.

Importantly, `pcall`{:.language-lua}s allow for error handling.

When you create a `pcall`{:.language-lua}, you're also able to assign its return value, a boolean (`true`{:.language-lua} if the function had no errors and `false`{:.language-lua} otherwise), and a varying value that, if the function had no errors, is `nil`{:.language-lua}, otherwise the error message to a variable.

So, we can get those values like so:

```lua
local function MyCoolFuction(Words)
	print(Words)
end

local Success, Message = pcall(MyCoolFunction, "pcalls are cool!")
```

In this example, no errors will be created when calling the function, so <var>Success</var> is `true`{:.language-lua} and <var>Message</var> is `nil`{:.language-lua}. However, if we were to make a function like so:

```lua
local function MyCoolFunction(Words)
	error(Words)
end

local Success, Message = pcall(MyCoolFunction, "this function will error now.")
```

Here, since the function errors (in this case we explicitly call `error`{:.language-lua}), <var>Success</var> is `false`{:.language-lua} and <var>Message</var> is `"this function will error now."`{:.language-lua}. We could've also used `assert(nil, "this function will error now.")`{:.language-lua} instead of `error`{:.language-lua}.

Similarly, there is another function called `xpcall`{:.language-lua}. Put simply, this is `pcall`{:.language-lua} with a second function argument: an error handler.

```lua
local function MyCoolFunction(Words)
	error(Words)
end

local function ErrorHandler(Message)
	print("[Error Handler] " .. Message)
end

local Success = xpcall(MyCoolFunction, ErrorHandler, "Just stop the function.") --> "[Error Handler] Script: Just stop the function."
```

A simple `try`{:.language-js}-`catch`{:.language-js} statement using `xpcall`{:.language-lua} could look like the following:

```lua
xpcall(function()
	-- try
end, function(err)
	-- catch
end)
```

~~`ypcall`~~{:.language-lua} is another function that acts the same as `pcall`{:.language-lua}, but can yield. Since `pcall`{:.language-lua} has since been tweaked to allow yielding, it has been deprecated. It's still sometimes used for an example of a deprecated global.

### get/setmetatable

Think of metatables like normal Roblox "Events". The only difference is that you don't use `:Connect`{:.language-lua} and instead assign the value to a function. This is because metatables **are** just tables with the events (metamethods) assigned to functions.

To set a metatable to a table, use the `setmetatable`{:.language-lua} function, like this:

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

As you can see, the "Metatable" table has a `__call`{:.language-lua} function item. When the `setmetatable`{:.language-lua} function sets <var>Metatable</var> to <var>Table</var>, the events (metamethods) in <var>Metatable</var> are called, in this case `__call`{:.language-lua}, which executes when the table is called like a function.

`__call`{:.language-lua} is not the only event (metamethod). There are more as documented in the [Roblox Developer Wiki](https://developer.roblox.com/en-us/articles/Metatables#metamethods).

You can then get the metatable of a table by doing `getmetatable`{:.language-lua} if `__metatable`{:.language-lua} is not present.

#### rawget

A simple function to get the real value of the second passed argument from the first argument (as a table), without invoking `__index`{:.language-lua} or `__newindex`{:.language-lua} metamethods.

```lua
rawget(Table, "Cash") --> 100
```

#### rawset

Sets the value of the second passed argument to the third argument in the first argument (which has to be a table), without invoking `__index`{:.language-lua} or `__newindex`{:.language-lua} metamethods.

```lua
rawset(Table, "Cash", 500)
```

#### rawequal

Checks if the provided two tables are equal without invoking the `__eq`{:.language-lua} metamethod.

### collectgarbage(\"count\")

Returns the total memory in use by Lua (in kilobytes). No other parameter/argument is allowed by Luau (it must be "count").

### loadstring

Loads the only argument (which is a string) as Luau code, excluding binary or bytecode. It only works with `game.ServerScriptService.LoadStringEnabled`{:.language-lua} set to true, and you must do that in Studio.

Some better alternatives exist which *can* execute bytecode, but that isn't a part of this function. [vLua](https://roblox.com/library/4689019964/vLua-5-1) is a good choice for that.

## Libraries

### coroutine

A co-routine is Luau's version of another thread in a single script. A big usage of these would be code after an infinite loop, since the loop never breaks and you may need to code after it. To do this simply, both of the following work:

```lua
coroutine.resume(coroutine.create(function(parameter)
	while true do
		print(parameter) --> "Something to print" (x1, xinf)
		wait()
	end
end), "Something to print")

print("Outside of the coroutine loop") --> "Outside of the coroutine loop" (x1)
```

```lua
coroutine.wrap(function(parameter)
	while true do
		print(parameter) --> "Something to print" (x1, xinf)
		wait()
	end
end)("Something to print")

print("Outside of the coroutine loop") --> "Outside of the coroutine loop" (x1)
```

although this is somewhat basic usage of coroutines. Some more advanced usage could be in custom objects' asynchronous methods.

A quick thing to note: Lua is a single-threaded language. Coroutines are just a replacement for more threads and are not proper threads. When a coroutine yields, another coroutine or the main thread regains control. In the above example, the coroutine's execution stops during the `wait()`{:.language-lua}, the bottom print statement runs, and the coroutine's loop continues again.

If the main thread or a coroutine calls a blocking operation, no other coroutine or the main thread can continue running.

#### create

Makes a new coroutine with the body of the given function. If you print this, it will return `thread:` and a hexadecimal memory address of the new coroutine.

#### resume

Either starts or continues the provided coroutine's execution. All arguments other than the coroutine are passed to the coroutine's function. It returns true if no errors were raised, and any values returned by the function or passed by `yield`.

#### wrap

Returns a function that, when called, resumes the passed function as a coroutine.

#### yield

When called inside a coroutine, it suspends its execution and makes `resume` return any additional arguments passed to it. After resuming, it will begin the coroutine back at the yield point and return any values passed again by `resume`.

```lua
local thread = coroutine.create(function(x)
	print(x) --> 1 --(x was defined in the first resume as 1)
	print(coroutine.yield(2)) --> 3 --(resume was called again with 3, and the coroutine starts here)
	return 4
end)

print(coroutine.resume(thread, 1)) --> 2 --(yield makes resume return its arguments, here 2)
print(coroutine.resume(thread, 3)) --> 4 --(4 was returned by the coroutine since the yield resumed at that statement)
```

Another function exists called `isyieldable` which should be used to check whether the current coroutine is yieldable. This exists in the main thread.

#### running

Returns the current running coroutine. This can be the main thread.

```lua
thread = coroutine.create(function()
	getfenv(0)["thread"] == coroutine.running() --> true
end)

coroutine.resume(thread)
```

#### status

Returns the status of the current running coroutine, as one of these strings:

* `running`: Currently running.
* `normal`: Has resumed another coroutine and is waiting for it to yield or return.
* `suspended`: Waiting for a `resume`, either because it hasn't been run yet or it was yielded.
* `dead`: Either returned or thrown an error. The coroutine is unusable.

#### spawn

This is not a function of the `coroutine`{:.language-lua} library, but an independent alternative that behaves on its own. While not deprecated, [coroutines are a much better option](https://gist.github.com/evaera/3db84579866c099cdd5bb2ff37947cec).

If the usage of this is required, then provide a function to it. After about a `wait()`{:.language-lua} or longer (or never), it will execute the function in a new thread. No guarantees can be made of when it does execute, if at all.

### math

An interface to C's math library through Luau.

<var>x</var> is the first given value, and <var>y</var> is the second given value, which only exists when mentioned.

| Function | Description |
|----------|-------------|
| abs | Returns the absolute value of <var>x</var>. |
| acos | Returns the arc cosine of <var>x</var>. |
| asin | Returns the arc sine of <var>x</var>. |
| atan | Returns the arc tangent of <var>x</var>. |
| atan2 | Returns the arc tangent of <var>x</var> ÷ <var>y</var> and uses their signs to determine the quadrant of the result. |
| ceil | Returns <var>x</var> as an integer, rounded up, with double precision (~16 decimal points). |
| clamp | Returns <var>x</var> if it is in the range of <var>min</var> and <var>max</var>, <var>min</var> if <var>x</var> is smaller than <var>min</var>, and <var>max</var> if <var>x</var> is greater than <var>max</var>. |
| cos | Returns the cosine of <var>x</var>. |
| cosh | Returns the hyperbolic cosine of <var>x</var>. |
| deg | Returns <var>x</var> in degrees. |
| exp | Returns <var>x</var> to the power of e (Euler's constant). |
| floor | Returns <var>x</var> as an integer, rounded down, with double precision (~16 decimal points). |
| fmod | Returns <var>x</var> % <var>y</var>. |
| frexp | Returns the mantissa and exponent of <var>x</var> (`x = m*2^e`{:.language-lua}), as a pair. |
| ldexp | Returns `x*2^y`{:.language-lua} where <var>y</var> is an integer. This is the inverse of `math.frexp`. |
| log | Returns the logarithm of <var>x</var> using <var>y</var> as the base (or e if not provided). |
| max | Returns the biggest value of the given arguments. |
| min | Returns the smallest value of the given arguments. |
| modf | Returns the integral and fractional parts of <var>x</var>, as a pair. |
| noise | Returns a perlin noise value from <var>x</var>, often between -1 and 1. If <var>y</var> and <var>z</var> are not provided, they default to 0. |
| pow | Returns <var>x</var> ^ <var>y</var>. |
| rad | Returns <var>x</var> in radians. |
| random | Interfaces ANSI C's pseudo-random `rand` function. When called without arguments, it returns a double in the range 0, 1. When called with just <var>x</var>, it returns an integer in the range 1, <var>x</var>. When called with both <var>x</var> and <var>y</var>, it returns an integer in the range <var>x</var>, <var>y</var>. |
| randomseed | Specifies <var>x</var> as the seed for <var>math.random</var>. |
| round | Rounds <var>x</var>. When <var>x</var> is equidistant to two integers, it will round away from 0. |
| sign | Returns -1 when <var>x</var> is less than 0, 0 if <var>x</var> is 0, or 1 if <var>x</var> is greater than 0. |
| sin | Returns the sine of <var>x</var>. |
| sinh | Returns the hyperbolic sine of <var>x</var>. |
| sqrt | Returns the square root of <var>x</var>. |
| tan | Returns the tangent of <var>x</var>. |
| tanh | Returns the hyperbolic tangent of <var>x</var>. |

| Constant | Description |
|----------|-------------|
| huge | Positive infinity. |
| pi | Pi, to the precision of a double. |

### os

Provides functions that can be used when time parsing is necessary. No system alterations are possible.

#### time

When no arguments are passed, it will return the number of seconds since the Unix Epoch (January 1st, 1970 at 00:00:00) under the current UTC (Universal Time Coordinated, +00:00) time.

If a dictionary is passed with keys "year", "month", "day", "hour", "min" (minute), and "sec" (second), it will return the number of seconds since that time instead.

#### date

Formats the given string with the given time (or what `os.time()`{:.language-lua} returns if not provided), with the specifiers from [strftime](http://www.strftime.net). Values smaller than a second aren't supported.

When the format string is either `"*t"`{:.language-lua} (local time) or `"!*t"`{:.language-lua} (UTC) it will return a dictionary with the same keys as required with `os.time`{:.language-lua}, with "wday" (weekday), "yday" (year day, which can be 366), and "isdst" (a boolean, "is daylight savings time") added.

#### difftime

Returns the number of seconds from the first time to the second time (where the first time is greater than the second), provided both times are in "seconds since Unix Epoch" format.

```lua
local time = os.time()

wait(30)

os.difftime(os.time(), time) --> 30 --(although it could also be 29 or 31 as this depends on the behavior of wait())
```

#### clock

Returns the processor time used by Luau in seconds. It has precision of around a microsecond and is intended for use with benchmarking.

```lua
local startTime = os.clock()
-- something to measure the performance of
local deltaTime = os.clock() - startTime
```

#### tick

This is not a function of the `os`{:.language-lua} library, but an independent alternative which returns the number of seconds since the Unix Epoch, but in the local timezone. As such, its only usage is time differences and benchmarking, but `os.clock`{:.language-lua} would be a better alternative for both use cases.

### string

A library which contains generic string manipulation functions.

Additionally sets a metatable for strings where the `__index` field points to the string table. Therefore, you can use the string functions in object-oriented style. For instance, `string.byte(s, i)`{:.language-lua} can be written as a method, `s:byte(i)`{:.language-lua}. When using this functionality, <var>s</var> must already be a variable. To avoid this, surround the datatype in parenthesis. `"Hello":len()`{:.language-lua} won't work, but `("Hello"):len()`{:.language-lua} will.

#### byte

Returns the decimal-formatted codepoints of characters <var>i</var> through <var>j</var> in the given string. By default, <var>i</var> is `1`{:.language-lua} and <var>j</var> is <var>i</var>.

```lua
local CodepointH, CodepointE, AnotherThing = string.byte("Hello, world!", 1, -1)
string.byte("Hello, world!", 1, -1) --> 72, 101, 108, 108, 111, 44, 32, 119, 111, 114, 108, 100, 33
print(CodepointH, CodepointE, AnotherThing) --> 72, 101, 108
```

#### char

Converts the provided decimal-formatted codepoints into a string.

```lua
string.char(72, 101, 108, 108, 111, 44, 32, 119, 111, 114, 108, 100, 33) --> "Hello, world!"
```

#### find

Finds the first match of the given [pattern](https://developer.roblox.com/en-us/articles/string-patterns-reference) in the given string, returning the beginning and end positions (or `nil`{:.language-lua} if no match was found). Two other arguments are allowed, where to start and whether to perform a plain search (change pattern to raw string).

```lua
local Pattern = "^%s+[%w%p%s]*%s+$"
string.find("	   A random string with some whitespace on the ends.   	", Pattern) --> 1, 57
string.find("The same pattern on a string without whitespace on the ends.", Pattern) --> nil
string.find("  	  The same pattern on a string with whitespace on one end.", Pattern) --> nil
string.find("The same pattern on a string with whitespace on the other end.  	  ", Pattern) --> nil

string.find(" This is a string using a raw search. ", "raw search", 1, true) --> 27, 36
string.find(" This is a string using a raw search (still). ", "%w-%u[%l%p%s]*%w*", 1, true) --> nil
string.find(" This is a string using a pattern search. ", "%w-%u[%l%p%s]*%w*") --> 2, 42
```

#### format

Formats the given string (which is a [formattable string](https://developer.roblox.com/en-us/articles/Format-String)) with the given arguments. Throws an error if an argument of the incorrect type is given.

```lua
string.format("We're running Roblox %s", version()) --> "We're running Roblox 0.478.1.422443"
string.format("Your team has %i points.", 15) --> "Your team has 15 points"
```

#### gmatch

Returns an iterator function that provides each capture to the loop.

```lua
for word in string.gmatch("We're matching each word & punctuation character here.", "[%w%p]+") do
	print(word) --[[> We're
	                  matching
	                  each
	                  word
	                  &
	                  punctuation
	                  character
	                  here. <]]--
end
```

#### gsub

Returns a copy of the given string where all (or a provided number) occurances of the given pattern are replaced with the given replacement. After those arguments, you can provide a maximum number of replacements to perform.

The replacement can be a string, which replaces directly, a table, which defines what to replace (key) with (value), or a function, which has the match passed to it and returns what to replace with.

```lua
string.gsub("I love tacos!", "tacos", "Roblox") --> "I love Roblox!", 1
string.gsub("I like red!", "%w+", "word") --> "word word word", 3
string.gsub("I play Roblox.", "%w+", {I="Je", play="joue à"}) --> "Je joue à Roblox.", 3
string.gsub("I have 2 cats.", "%d+", function(Match)
	return tonumber(Match) * 12
end) --> "I have 24 cats.", 1
string.gsub("aaa", "a", "b", 2) --> "bba", 2
```

#### len

Returns the length of the provided string. The `#`{:.language-lua} (length) operator can be used in place of this. Both return the amount of characters in the string.

#### lower

Changes all uppercase letters to lowercase.

#### match

Returns the given string's first pattern match. Returns `nil`{:.language-lua} if none were found. Another optional argument specifies what character to start the pattern search at.

```lua
string.match("wor wod wro wrd wdo wdr", "%w+") --> wor
```

#### rep

Repeats the given string (concatenates the given string with itself) the given number of times.

#### reverse

Reverses the given string.

#### split

Splits the given string into an ordered table based on the given separator, with whitespace preserved. The separator is `,` if not given.

#### sub

Returns the substring of the given string, which begins at <var>i</var> and ends at <var>j</var>. If <var>j</var> is `-1`{:.language-lua}, it represents the end of the string. By default, <var>i</var> is `1`{:.language-lua} and <var>j</var> is `-1`{:.language-lua}. To find the positions you need, press the insert key to better visualize at which character you're at.

Remember you can always use Studio's command bar to print the string with trial and error. It shouldn't take too long to get the proper values.

```lua
string.sub("!fly me", 2) --> "fly me" --("f" is the 2nd character and we end at the last character, "m")
string.sub("This sentence shouldn't have an ellipsis...", 1, 41) --> "This sentence shouldn't have an ellipsis." --("." is the 41st character)
string.sub("It is 10:05 AM.", 7, -5) --> "10:05" --("1" is the 7th character, "." is the -1st character, and "5" is the -5th character)
```

#### upper

Changes all lowercase letters to uppercase.

### table

[tba]

### utf8

Basic UTF-8 encoding support.

#### char

Converts the provided **decimal-formatted** Unicode Codepoints into a string. This has much more support for characters than `string.char`.

```lua
utf8.char(24432) --> 彰
string.char(24432) --> error --(invalid value)
```

#### codes

Returns an iterator function to loop through each position and codepoint in the provided string.

```lua
for pos, code in utf8.codes("Hello") do
	print(pos, code) --[[> 1, 72
	                       2, 101
	                       3, 108
	                       4, 108
	                       5, 111 <]]--
end
```

#### codepoint

Returns the codepoints in the provided string, starting at <var>i</var> and ending at <var>j</var>. If it found an invalid codepoint, it will instead return `nil`{:.language-lua} and the codepoint's string position.

#### len

Incredibly similar to `string.len`{:.language-lua} but with UTF8 support, and, if an invalid codepoint was found, return `nil`{:.language-lua} and the codepoint's string position.

#### offset

Returns the byte position in the provided string where the provided codepoint starts, beginning at <var>i</var>. `nil`{:.language-lua} is returned when no matches were found.

#### graphemes

Returns an iterator function so that

```lua
for first, last in utf8.graphemes(str) do 
	local grapheme = string.sub(str, first, last)
	
end
```

will loop through the grapheme clusters of the provided string. Useful when using Unicode on [surrogate characters / pairs](https://stackoverflow.com/questions/51001150/what-are-surrogate-characters-in-utf-8), such as [🍎](https://medium.com/flutter-community/working-with-unicode-and-grapheme-clusters-in-dart-b054faab5705).

#### nfcnormalize

Converts the inputted string to [Normal Form C](http://unicode.org/reports/tr15/tr15-23.html), which tries to convert decomposed characters into composed ones.

#### nfdnormalize

Converts the inputted string to [Normal Form D](http://unicode.org/reports/tr15/tr15-23.html), which tries to break up composed characters into decomposed ones.

#### charpattern

A constant containing the pattern `"[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*"`{:.language-lua}, which matches exactly zero or more UTF-8 byte sequence (assuming that the subject is a valid UTF-8 string).

## Objects

An object can contain data (fields) and code (procedures). This approach allows you to easily create something with similar behavior to something else, like in the real world.

For a basic example, an apple has a custom field specifying its mass, a read-only one specifying its weight, and a procedure called "`IngestionBreakDown`". It inherits properties from the base object, like the behavior of its atoms and molecules. Maybe it also inherits a procedure like "`Grow`" from the <var>Fruit</var> class, and has a custom property named "`GrowTime`" which impacts how "`Grow`" works.

Utilizing ModuleScripts, metatables, and metamethods, we can make an object, like an instance, with custom behavior. To do this, we'll use the `__index` metamethod, which fires when the table is indexed **and there is no value in that index**.

So, to create an object which inherits from a class, we can use [the following boilerplate](https://gist.github.com/EthanMcBloxxer/7ad771384f383b0dc18e4c12a7158d3e):

```lua
local Class = {}
Class.__index = Class

function Class.new()
	return setmetatable({}, Object)
end

return Class
```

Here, when this ModuleScript is `require()`{:.language-lua}ed, it returns a custom function called <var>new</var>, which then returns a new object that always points to a new <var>Class</var> table which was made with `setmetatable`{:.language-lua} and a blank table.

If we were to specify a property of <var>Class</var>, that would be accesible in the new object, since it exists in <var>Class</var>, but not in the new one. Since all indexes point to <var>Class</var>, as there are no keys in the created table, it will find if the key exists in <var>Class</var> instead. This means that you can specify custom properties inside of the <var>new</var> function to be used in the object.

```lua
local Class = {}
Class.__index = Class

function Class.new(Driver)
	local Object = setmetatable({}, Class)
	
	Object.Driver = Driver
	
	return Object
end

return Class
```

Which will allow a normal script to access the Driver key from the new object. Then, functions inside of the class or object can access those keys and manipulate them to whatever is needed.

Variable naming conventions also change a bit when using objects, specifically prefixing private (not to be tampered) values with an underscore (`_`). Methods which return said private value would be used instead.

### Methods

You'll see these in non-Luau classes, like instances. They are functions which use the `:`{:.language-lua} syntax instead of `.`{:.language-lua}s and belong to a specific object. When a function is specified as a method with `:`{:.language-lua} syntax inside of an object, it will automatically make the variable <var>self</var> set to itself, the <var>Object</var>.

Because of this, you can set functions to use the <var>self</var> variable which will be passed when calling it as a method.

```lua
local Class = {
	_InternalValue = 1,
}

function Class.GetInternalValue(self)
	return self._InternalValue
end
```

Will produce the following results when `require()`{:.language-lua}ed:

```lua
local Class = require(Class)

-- Function
Class.GetInternalValue() --> error
Class.GetInternalValue(Class) --> 1

-- Method
Class:GetInternalValue() --> 1
```

Inside of the ModuleScript, you can also use `:`{:.language-lua} syntax in the function itself to omit the <var>self</var> variable as a parameter:

```lua
local Class = {
	_InternalValue = 1,
}

function Class:GetInternalValue()
	return self._InternalValue
end
```

### Clock Example

Using everything we've learned, we can make a custom class which allows us to use a basic clock with custom methods.

```lua
local Clock = {}
Clock.__index = Clock

function Clock.new()
	local Object = setmetatable({}, Clock)
	
	Object._text = os.date("%I:%M %p", os.time())
	
	Object._event = Instance.new("BindableEvent", script)
	Object.Updated = Object._event.Event
	
	Object._coroutine = coroutine.create(function()
		while true do
			Object:Update()
			Object._event:Fire(Object._text)
			wait(1)
		end
	end)
	return Object
end

function Clock:Start()
	coroutine.resume(self._coroutine)
	return self
end

function Clock:GetTime()
	return self._text
end

function Clock:Update()
	self._text = os.date("%I:%M %p", os.time())
	return self
end

return Clock
```

Which allows some functionality in a script:

```lua
require(Clock).new():Start().Updated:Connect(function(NewTime) -- The :Start() method returns the Object (`return self`) so we can instantly reference properties
	print(NewTime) --[[> 12:00 PM
	                     12:00 PM
	                     ... <]]--
end)
```

Since the clock updates every second, the time may not change, and it may get less accurate due to `wait()`.
