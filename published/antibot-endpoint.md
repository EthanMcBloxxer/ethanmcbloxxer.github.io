<!-- I want to give up on interacting with this so badly, why can't they just HAVE ANOTHER REPOSITORY with this information? -->

You can create a custom instance of [AntiBot](https://github.com/codehouseRBLX/AntiBot) on Replit which allows you to use your own domain with AntiBot, like `scammer-sword.yourname.repl.co`. Just fork their project on Replit, run it, and change `APIurl` to your Replit URL inside of `AntiBotMain.lua`.

I **highly** recommend making a `GetRequest` to this endpoint at `/ping` when the game starts.  
Replit could put your repl to sleep if you don't have the "Hacker" plan otherwise.
