# RoForums

A Roblox game centered around forums

## Concepts

As Roblox uses LuaU to program their games, it would be helpful to document the concepts and general code snippets that may go with them.

### Sections

Similar to the original interface of the Roblox Forums, there is a ScrollingFrame with buttons to click on different forum sections. [CustomEnums](https://devforum.roblox.com/t/1-0-0-customenums-create-your-custom-enum/573300) might be a good idea to use here, so I can easily tell the code what section to look at.

The sections divide the forum into different interests, so when DataStores are implemented it should be able to fetch said thread.

### Thread Lists

This should get all the threads in the category, page them by about 10, then allow you to navigate through them. Metadata in the form of Values should exists inside of these "Threads".

### Thread

A thread remotes to "Moderate" and sends it back to the client for review. When the string is moderated and the client submits it, it gets pushed to the DataStore.

### DataStores

#### Thread

```lua
[258624] { -- thread id
  Author = 1, -- userid
  Category = Categories.AllThingsRoblox, -- enum type
  Title = "Test Post", -- title field
  Description = "This is a test post", -- desc field
  Content = "This is an extremely large string that probably goes ahead and describes the post in more detail or gives you some stuff to know.", -- content field
  Timestamp = 1618074333 -- os.time()
  Replies = { -- store the replies in the post
    [2357345] = { -- reply id (seperate from threads)
      Author = 2, -- userid
      Content = "This is a reply by user 2.", -- reply content
      Timestamp = 1618074313, -- os.time()
    }
  }
}
```
