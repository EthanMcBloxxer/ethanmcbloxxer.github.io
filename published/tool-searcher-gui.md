# Tool Searcher GUI
*An awesome GUI for any games that use tools*  
*Created September 6th, 2020*

Hi again, internet randoms!  
Today I will be giving you an awesome GUI for any games that still use tools.

<em><sup>Note that this does not currently support hopperbins.</sup></em>

## Features:

* Grab any tool
* Tools are listed with their icon, or name if there is not a corresponding icon
* ScrollingFrame for tools automatically resizes based on it's content
* Grab All button that grabs every spawned tool in the game, and every tool in ReplicatedStorage, ReplicatedFirst, and Lighting
* Auto Pick-up toggle that grabs any tool that is dropped or spawned
* Tool ESP toggle that puts a red BoxHandleAdornment on all tools that exist and that spawn
* Sweet closing animation

Preview video:

<video width="100%" height="100%" loop controls>
  <source src="/assets/vid/embed/tool-searcher-gui-preview.mp4" type="video/mp4">
  <a href="/assets/vid/embed/tool-searcher-gui-preview.mp4">Preview video</a>
</video>

Closing animation:

![Closing animation GIF](/assets/img/embed/tool-searcher-gui-open.gif)

Script:
`loadstring(game:HttpGet('https://gist.github.com/EthanMcBloxxer/429c2317e3ba98cb7228c1c1324aadcb/raw/18929d34c09b127b688c1dff08384d32acff89f2/tool-searcher.lua'))()`

## FAQ:

Can I get tools for free?
: Technically, yes. This depends on how the game itself stores tools. You cannot get tools from ServerStorage for obvious reasons, but you can use the Grab All button to grab all tools from ReplicatedStorage, ReplicatedFirst, and Lighting.

Is this Client-Sided or Server-Sided?
: Server-sided as long as the game doesn't have OnPropertyChanged functions protecting tools. I didn't build this for Synapse, unfortunately.

Can I get tools that are created on the client?
: Yes but they will only be available on the client, which were never sent to the server either way if the tool is created on the client.

Will this lag me?
: Not as long as your computer can handle a `while wait(0.05) do` loop.

<a href="https://wearedevs.net/forum/t/14612/" title="WeAreDevs"><i title="Originally on WeAreDevs" class="fas fa-code"></i> Originally posted on WeAreDevs</a>
