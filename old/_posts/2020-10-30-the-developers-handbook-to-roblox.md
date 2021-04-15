---
layout: post
title: The Developer's Handbook to Roblox
subtitle: Ins and Outs to Roblox Development
cover-img: /assets/img/posts/cover/roblox-studio.png
thumbnail-img: /assets/img/posts/thumb/roblox-studio.svg
share-img: /assets/img/posts/thumb/roblox-studio.png
last-updated: 2020-12-4
tags: [lua]
comments: true
---

Hey there! So you want to know how to use Roblox Studio.  
I’m going to tell you everything there is to know about it, scripting, modeling, GUI designing, terrain editing, remoting, and more.  
Remember that I'm just a internet random, and the [official developer website](https://developer.roblox.com/en-us/quick-start) may be a better fit for you.

## Setting up Roblox Studio {#into_setup}

Before we can do anything, we need to set up Studio. If you already know how to do this, then you can skip ahead. Otherwise, click Start Creating. Once installed, it will prompt you for your username and password, and your 2FA code if you have 2FA enabled.
<div align="center"><a href="https://setup.rbxcdn.com/RobloxStudioLauncherBeta.exe"><img src="/assets/img/embed/start-creating.png" alt="Start Creating" width="450" height="85"/></a></div><p/>

## Using Roblox Studio {#intro_using}

Once you are inside of Studio, you can create a game from the “New” tab.  
![New Tab](/assets/img/embed/new-+.png){: .mx-auto.d-block :}

# Creating your Game {#start}

Then, you should select either Baseplate or Flat Terrain. I don’t recommend that you start out with any other template because they don’t really make a game.  
I normally start with Flat Terrain.  

## Starting with a Baseplate {#start_baseplate}

Most people start out with baseplate games.  
This is because not many know how to manipulate terrain the best, because models cannot contain terrain, or because they like using parts over terrain.  
If you would like to save terrain, then you can get [this plugin](https://web.roblox.com/library/148042198/Terrain-Save-and-Load) for studio which allows you to save your terrain.  

## Starting with Terrain {#start_terrain}

Others start with flat terrain because its the easiest way to start manipulating terrain instantly. If you want to start with this, you can use the Terrian Editor. Sadly, this is introduced as an incorporated plugin like Animation Editor, but its in a different toolbar.

## Starting 2D {#start_2d}

You may also want to start without anything and make a GUI-Based game. You can do this.  
Just open up a new baseplate game and copy the code below, then put it into the command bar at the bottom of Studio.  
```lua
--[[ Studio Command Bar 2D Game Script by @EthanMcBloxxer#2089, DM if you have questions ]] if not game.Workspace.Baseplate then error("Baseplate not found, please create a new baseplate game before running this script.") else game.Workspace.Baseplate:Destroy() game.StarterPlayer.CharacterUseJumpPower=true game.StarterPlayer.CharacterJumpPower=0 game.StarterPlayer.LoadCharacterAppearance=false Instance.new("Script", game:GetService("ServerScriptService")) game.ServerScriptService.Script.Name="PreventPlayerSpawn" game.ServerScriptService.PreventPlayerSpawn.Source='game:GetService("\x50\x6C\x61\x79\x65\x72\x73").PlayerAdded:Connect(function(_)_.CharacterAdded:Connect(function(a)for _,_ in pairs(a:GetDescendants())do if _:IsA("\x50\x61\x72\x74")or _:IsA("\x4D\x65\x73\x68\x50\x61\x72\x74")then _.Anchored=true _.Transparency=1 elseif _:IsA("\x44\x65\x63\x61\x6C")or _:IsA("\x41\x63\x63\x65\x73\x73\x6F\x72\x79")or _:IsA("\x53\x68\x69\x72\x74")or _:IsA("\x53\x68\x69\x72\x74\x47\x72\x61\x70\x68\x69\x63")or _:IsA("\x50\x61\x6E\x74\x73")or _.Name=="\x41\x6E\x69\x6D\x61\x74\x65"then _:Destroy()elseif _:IsA("\x48\x75\x6D\x61\x6E\x6F\x69\x64")then _.RigType=Enum.HumanoidRigType.R6 elseif _.Parent==a.Humanoid then if _:IsA("\x4E\x75\x6D\x62\x65\x72\x56\x61\x6C\x75\x65")then _:Destroy()end end end end)end)' Instance.new("ScreenGui", game:GetService("StarterGui")) game.StarterGui.ScreenGui.Name="HUD" Instance.new("Frame", game.StarterGui.HUD) game.StarterGui.HUD.Frame.Name="Holder" game.StarterGui.HUD.Holder.BackgroundColor3=Color3.fromRGB(165, 165, 165) game.StarterGui.HUD.Holder.BorderSizePixel=0 game.StarterGui.HUD.Holder.Position=UDim2.new(0, 0, -0.05, 0) game.StarterGui.HUD.Holder.Size=UDim2.new(1, 0, 1.05, 0) end
```
<p/>
## Publishing your Game {#start_publishing}

This will allow you to completely use any Roblox feature that couldn’t be used outside of a published game, like game settings, datastores, and more.

You can accomplish this by pressing Alt + P.  
It will then prompt you for a few different things, such as the name, description, creator (Me or groups), Genre, and the playable devices.  
I warn you that if you choose to make it available to Console users then you will have to disable chat in your game.  
To do this, go into StarterPlayer in your Explorer and open it. Then, under StarterPlayerScripts, hover over it and click the plus.  
Then type LocalScript and press enter. Remove all the code that is already in there, and paste:  
```lua
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false).
```
From here, you can learn to script, learn to model, learn to create GUI, or learn to sculpt terrain.  
We’re going to learn how instances work next, if you don’t have a preference. Note heavily that most of the things I will teach you are entirely different.  
You can specialize in one or more things, but it is easier to do only one. If you do choose to learn more, great! That’s more ability and more hiring points.  

# Scripting {#scripting}

Scripting is a very important and necessary part of your game. Luckily, it’s not assembly. It- instead- is Lua. Lua is not quite a well known language, but it is definitely powerful. Roblox also uses the client-server model, a common framework for multiplayer games. Whenever you play a Roblox game, your personal computer, phone, tablet, or game console becomes a client. Every other unique player in the game is also a client.

All clients (players) in the game are connected to a powerful Roblox computer known as a server. The server is like the game manager — it makes sure that every player is seeing and experiencing the game world the same as every other player.

## [Clients vs Servers {#scripting_clients-servers}](https://developer.roblox.com/en-us/articles/Roblox-Client-Server-Model)

When writing scripts for a game, it’s important that both clients and servers handle specific tasks as follows:

### Clients {#scripting_clients-servers-clients}

The client should detect player input and contain things that should be shown to that player specifically. Some things should be sent to the server but shown on the client for instant feedback, but other things like GUIs should be managed by client code.

Said client code runs inside of `LocalScript`s. However, `LocalScript`s will only run if they are a descendant of the following:
* A player’s Character model
* A player’s PlayerGui
* A player’s Backpack
* A player’s PlayerScripts folder
* A Tool (only when equipped by a player)
* The ReplicatedFirst folder

### Servers {#scripting_clients-servers-servers}

The game's server should be used for game logic, player data, scores, instance creation, etc. We do this because if the script code changes the game world (creates or removes parts, for example), the server makes sure that all clients see the same change.

Server code runs inside of normal `Script`s. `Script`s only run if they're a descendant of
* Workspace (not recommended)
* ServerScriptService
* A player’s Backpack

### Remote Functions / Events {#scripting_clients-servers-remotes}

Often you'll also need to send a request for the server to do something from the client, like add a part to the map. You can do this with remote events or functions, which send a request from the client to the server, vice versa, or a client to the server to all clients, or the server to clients. Basically any communication from clients and the server will use remote functions or events. Remote events are one-way communication, while remote functions read data back to the initial sender. You can read more in our [dedicated chapter]().

## Instances {#scripting_instances}

If instances didn’t exist, games wouldn’t exist. (technically, they would, but there would only be the game itself and services.)  
Instances are what you see when you are playing a game. That baseplate? Instance. Terrain? Instance. Scripts? Instances.  
Everything that you can create in Roblox from both the `Instance.new` function and from the explorer is an instance.  
There’s a long boring list of them [here](https://robloxapi.github.io/ref/class/Instance.html), under “Inherited by”.  

## Creating a Script {#scripting_create-script}

To create a server-sided script, never create one in Workspace. Always use ServerScriptService. This is because exploiters have a function in many paid exploits called “`saveinstance()`” which is a function to download all accessible things to a Roblox Place file. This means any scripts in the workspace can be copied, taken, and abused. This is especially true when you are using Remote Functions or Events, where the client sends data to the server, and the server does something with that data. If you show exploiters how the server handles their data, then they can abuse them. Now, create a script under ServerScriptService. You will see that there is already some code:
```print("Hello, World!")```
in the script. You can clear this if you’d like.

## The “File” System {#scripting_file-system}

Unlike normal Lua, Roblox Lua does not have any actual files. Instead, instances use the place of files. If you want to change something about them, then you start with `game`, `workspace`, or `script`. Game is basically the entire computer, Workspace is your main drive, and Script gets the current script's path. If you want to retreat your current directory, then you can use `Instance.Parent` in place of \..\. All of the other direct services that you see in explorer such as `StarterGui`, `Players`, etc. are more disk drives, each with varying replication permissions. Let's take `workspace` for example. `workspace` is instantly replicated to the client when they join the game. Any changes they make aren't copied to other clients or to the server. Only to that client. This is due to a Roblox feature called Filtering Enabled (FE). Then, take `ServerScriptService`. Only the server has access to the contents of it. Permissions of this sort are also replicated from different types of scripts, `Script`s and `LocalScript`s. `LocalScript`s run on the client while `Script`s run on the server. Clients can't make a `Script` run on the server, however. To actually reference instance paths, you use periods (.) instead of backslashes (\). For example, `game.Workspace.Part`. Remember that workspace and `game.Workspace` are the same, but it is good practice to use `game.Workspace` instead of workspace. Remember that instance properties like `Name` are also referenced with dots, like `game.Workspace.Name`. If you create an instance with a space in it or want to use a string to access a path then you can use `game.Workspace["My Part"].Name`. This is because you are referencing a item in a dictionary or hierarchy with the brackets. You're finding the item that has the `Name` value of `"My Part"`. Always prefer instances without spaces, though.

## Constructors {#scripting_constructors}

If you’ve ever coded before, you’ll know there are things like if statements, boolean, variable declaration, etc. These in Lua are constructors. They are pretty self-explanatory. Here they are:
* `local`
* `function` / `end`
* `if` / `then` / `else` / `elseif` / `end`
* `nil`
* `break`
* `return`
* `true` / `false`
* `and` / `not` / `or`

There are a few more that relate to loops, but we’ll get into that later. Remember that “`not`” inverts the specified boolean in an if statement, such as:
if not `“string”` then. This means that if `“string”` is `false` then do things.
“`nil`” is the same thing as `null` (from other languages). It does not mean or store any value, and it is not equivalent to `false`, `0`, or `""`, but is equivalant to `nil`.

### Comments {#scripting_comments}
This is a quick mini-subchapter to inform you that the comments in Lua are created as follows:  

Normal Comment:
```lua
-- <- Two Hyphens (then comment text like this!)
```  
Block Comment:
```lua
--[[
  This is a block comment. Anything inside the [[ and ]​] will be a comment.
  Start the brackets with two hyphens.
  Then, you can write whatever you want!
]]
```  
Hidden Comment:
```lua
                                                                                                        --[[
  This is the same as a block comment,
  but the closing and opening brackets
  are tabbed away so you can't see them.
                                                                                                          ]]
```
<p/>
## Variables & DataTypes {#scripting_variables}

There are 3 different ways to define a variable in LuaU.  
You can use the following:
```lua
local [N] (= [V])
[N] = [V]
_G.[N] = [V]
```
\[N] is Name, and \[V] is value.  
Put simply,
`local` defines a value that is in the enclosing function, if statement, etc. This can be a function, loop, or if statement. Outside of that function, the value cannot be used. You can declare a local without giving it a value.

\[N] = \[V] is simply creating a variable without declaration. This can be used throughout the entire script. Example: cheese = “cheese”.

\_G is a “global” array. What this means is that instead of inside the function or script, the entire game is able to access that variable. When I say the entire game, I mean the entire game. Exploiters can change your \_G values. I recommend you use ModuleScripts instead of \_G to store values, but we’ll get into that later. Example: \_G.name = “EthanMcBloxxer”. There is said to be a performance limit to this, which is 200.

The basic datatypes (things you can store) are as follows:  
nil · boolean · number · string · function · userdata · table  
There are more, however most are unnecessary and you will not use them. The important other ones are positions like Vector2 (2d coordinates), Vector3 (3d coordinates), CFrames (coordinate frame), Color3 (colors), and UDim2 (gui position/size).  
You can create such things by getting from an instance or using a `.new` function, which are listed below:

| Function | Creation |
|:--- |:--- |
| Instance.new(arg1, arg2) | New instance of class arg1 and parented to arg2 |
| Vector3.new(x, y, z) | Constructs a new Vector3 using the x, y, and z componets |
| Vector2.new(x, y) | Creates a new Vector2 using ordinates x & y |
| CFrame.new(x, y, z) | Complex function using more than x, y, and z, but simplified for this lesson |
| UDim2.new(xS, xO, yS, yO) | Makes a new UDim2 using xScale, xOffset, yScale, and yOffset |
| Color3.fromRGB(r, g, b) | Constructs a Color3 value from RGB values r, g, and b |
| Color3.fromHSV(h, s, v) | Constructs a Color3 value from HSV values h, s, and v |
| BrickColor.new(index,name,closeRGB,closeColor3) | Creates a BrickColor from its numerical index, name, close RGB value, or close Color3 value |

<p/>

## Loops {#scripting_loops}

Sometimes, you need to do something until something. If this is the case you can use a `repeat` > `until` loop. This isn’t optimal, however. If you are going to use a loop for this reason, you should normally use a `while` > `end` loop. The reason we do this is because when you are using a `repeat` > `until` loop, the code inside of it runs once, then checks if the until specified has been met. If so, the loop breaks. A `while` > `end` loop, however, will check if the condition is met, THEN run the code. If you ever need to run code infinitely, then you can do two things:
```lua
while true do
    wait(1)
    -- code
end
-- or
while wait(1) do
    -- code
end
```
The second one is better practice. Why? Because while true do loops unfortunately cause a horde of lag, even without any code. Because of this, you should use while wait(1) do instead. This is completely based on what you are trying to do though. If you need an infinite loop no matter what, you can set 1 to any value from math.huge (HUGE_VAL) (basically infinity) to 0.001. Anything higher or lower will be rounded. This goes for all wait() statements.
There's also a `for` > `end` loop, whos syntax looks something like this:
```lua
for i = 1, 5, 1 do
    print(i)
end
```
What this is doing is assigning a variable to the amount of times the loop ran, then specifying the times that the loop ran. Then, the last number specifies how many times `i` goes up when the loop is ran. So, `i = 1` means `i` is equal to the number of times the loop ran, then `5` means the loop will run 5 times, then `1` means `i` goes up by 1 every time the code inside the loop is run. When the loop is ran, the code inside, or `print(i)` will run. This outputs `i`, or the number of times the loop has run according to the 3rd variable. This can also be used to loop through tables, with the following syntax:
```lua
for i, v in pairs(table) do
    print("Table Index: "..i)
    print("Table Value: "..v)
end
```
In this `for` loop, it takes every index and value (or i and v) in the table `table`, run the code in the loop. `i` is now equal to the table index, and `v` is now equal to the value that the index contains. If, instead, you are looping through a dictionary, you can use `for k, v in pairs() do` loop. `k` = Key, `v` = Value.

## Tables {#scripting_tables}

A table is a Lua data type that can store multiple values including numbers, booleans, strings, functions, and more. Tables are constructed with curly braces ({}) as shown here:
```lua
-- Construct an empty table assigned to variable "t"
local t = {}
```
Tables can store any type of variable, even more tables! You can reference a value in a table by doing `table[i]`. `i` is the index of the table, or the number in which the value you want is stored. Using this you can read or write to the table. There are also functions that return tables, so you can use a `for i, v in pairs` loop for functions such as `:GetChildren()`, `:GetDescendants()`, etc. Then, you can loop for each child or descendant of the instance.

### Arrays {#scripting_tables-arrays}

Arrays are a type of table. They are the most common, where the values are stored sequentially, separated by commas. An array value can be any non-nil type (boolean, number, string, function, userdata, or even another table). Example:
```lua
local testArray = {"A string", 3.14159, workspace.Part}
-- To insert more values here, you can do 2 things:
testArray[#testArray+1] = "Another new string"
-- This is setting the number of things in testArray + 1 to "Another new string".

-- alternatively you can use a function instead of variable-setting

table.insert(testArray, 2, "NEW ITEM #2")
-- Which is using a table function to insert like so: (Table, Index, Value)
-- To remove from a table, you use:
table.remove(testArray, 2)
-- This would remove 3.14159.
```
<p/>

### Dictionaries {#scripting_tables-dictionaries}

Dictionaries are similar to arrays, but they instead store key-value pairs. For example,

| Key | Value |
| :------ |:--- |
| FruitName | Lemon |
| FruitColor | Yellow |
| Sour | `true` |

You can create them similarly to an array, but instead of just values you use \[N] = \[V] instead.
```lua
local testDictionary = {
    FruitName = "Lemon",
    FruitColor = "Yellow",
    Sour = true
}
```
Then, you read from them somewhat like arrays, but instead of the index number you do the value.
`testDictionary["FruitName"]`
If you are **not** storing strings, such as “Lemon”, then you should not use quotes for the index reference. (Sour instead of “Sour”)

### Table Operations {#scripting_tables-tableop}

There are a few operations and functions that belong to `table` that are very useful when manipulating tables, like `table.sort`, which sorts the table elements of arg1 in a given order. Here's a table of them:

| Function | Description |
|:--- |:--- |
| concat | arg1 must be an array! Returns the string arg1\[arg3]..arg2..arg1\[arg3+1] all the way through the table until arg2..arg1\[arg4]. arg2 is a seperation for table elements, and arg3 is where to start the operation |
| foreachi | arg1 must be an array! Passes function arg2 to the elements of table arg1 |
| foreach | arg1 must be a dictionary! Passes function arg2 to the elements of table arg1 |
| sort | arg1 must be an array! Sorts elements of arg1 in a given order for every table element |
| insert | arg1 must be an array! Appends arg2 to the end of arg1 |
| remove | arg1 must be an array! Removes from arg1 at arg2 and returning the removed value |

<p/>

## Boolean Functions {#scripting_booleanfuncs}

When I say “Boolean” I mean things like `true` and `false`. This is how if statements work. For example:
```lua
local helloworld = "Hello, World!"
if helloworld == "Hello, World!" then
    print("Hi!")
end
```
This checks if the local variable `helloworld` is equal to `“Hello, World!”`. If that returns true then the code inside of it will be run.

## String Operations {#scripting_stringop}

In Lua, you may need to store strings and manipulate them as well. There are a few useful functions that all begin with `string`. These include `string.sub`, `string.lower`, `string.upper`, `string.reverse`, `string.split`, and `string.find`. There are many more that you can read up on [here](https://developer.roblox.com/en-us/api-reference/lua-docs/string), but you won't find yourself using them much. Here's a table to better understand the useful ones:

| Function | Description |
|:--- |:--- |
| sub | arg1 is the string you are operating on, arg2 is where you start actually slicing the string, and arg3 is where you stop. So, if I did `string.sub("hello", 1, 2)` then I would get `"he"` because it begins on letter 1 and ends on letter 2. |
| lower | arg1 with all uppercase characters changed to lowercase |
| upper | arg1 with all lowercase characters changed to uppercase |
| reverse | arg1 reversed, "hello" changes to "olleh" |
| split | splits a string based on arg2 (the speration character). Honors whitespace. Example: `string.split("foo, bar")` would yield `["foo", " bar"]`. Yes, it does convert it into a table. Works with Unicode and Invalid UTF-8. |
| find | looks for the first match of the second argument. If it finds one, then it returns it, otherwise it returns `nil`. Argument 3 specifies where to start searching (default 1), and can be negative. The fourth argument (bool) turns on/off the pattern matching facilities. |

<p/>

## Math Operations {#scripting_mathop}

You probably, in any game, need to use math somewhere, whether it be coin multipliers, absolute values, angles, division remainders, or some other crazy pi-involving game, math is useful. So, Lua obviously has a ton of math functions. There are a [lot](https://developer.roblox.com/en-us/api-reference/lua-docs/math), but here are the more useful ones: `math.abs`, `math.ceil`, `math.floor`, `math.deg`, `math.fmod`, `math.max`, `math.min`, `math.pi`, `math.rad`, `math.random`, `math.sqrt`, and `math.huge`. Still a ton, right? Well, here's a table to better break it down.

| Function | Purpose |
|:--- |:--- |
| abs | Absolute Value of arg1 |
| ceil | Return the smallest integer larger/equal to arg1 |
| floor | Return the largest integer smaller/equal to arg1 |
| deg | Returns the angle arg1 (radians) |
| fmod | Remainder of division of arg1 by arg2 (that rounds the quotient) |
| max | The maximum value |
| min | The minimum value |
| pi | Returns true pi |
| rad | Angle arg1 (degrees + radians) |
| random | Random value, arg1 being minimum and arg2 being maximum |
| sqrt | Square root of arg1 |
| huge | `HUGE_VAL`, larger than or equal to any other numerical value |

<p/>

<div align="center"><button type="button" onclick="window.location.href='#';" style="background-color: #4CAF50;  border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;">Return to Top</button></div>

<p/>

# MORE COMING SOON!
