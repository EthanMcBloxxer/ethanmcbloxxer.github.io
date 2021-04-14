# Password Misconceptions
*There are a few misconceptions about passwords and security.*  
*Created November 5th, 2020*

Passwords are one of the best things of security. They're a string of text that can be remembered or written down, but there are still misconceptions and misinformation about them.

### mW674
This, to many people, doesn't sound like a misconception, it sounds like a fact.

longer and better password can be great, especially with a password manager or a physical note. However, this is actually false.

Simply fo*p3#NAeUG3UE would make a good password*ur random common words, or something like `correct horse battery staple` would be a good password (Don't use it though, it is used as an example too much), better than a random string of characters, no matter how obscene.

You might be wondering how, and even wondering if this is a creditable source anymore. But, I do actually have proof of this (with an example).

Let's take the password `Tr0ub4dor&3`. There are a few things you'll forget here, like the capital T, 0 and 4 as substitutes, the order of the & and the 3, and your use of numerals and punctuation. The only identifiable pro to this is how the base word, troubador, is uncommon. Now, let's see some statistics:

Password: `Tr0ub4dor&3`

* Uncommon word
* Caps
* Substitutes
* Numeral
* Punctuation
* ~28 bits of entropy
* 3 days at 1000 guesses/sec

Guessing difficulty: `easy`  
Remembering difficulty: `hard`

As we can see, this password wouldn't be too great.

How about the four random common words that I mentioned earlier?
Well, let's take the password `correct horse battery staple` as mentioned before. No caps, numerals, or punctuation. Let's see more statistics:

Password: `correct horse battery staple`

* Common words
* No capitals
* No special characters
* ~44 bits of entropy
* 550 years at 1000 guesses/sec

Guessing difficulty: `hard`  
Remembering difficulty: `instant`

This seems much better, doesn't it? Well, this concept was brought up by an XKCD comic.

![XKCD Comic](https://imgs.xkcd.com/comics/password_strength.png){: .mx-auto.d-block :}

When a website asks you for these special characters, note that they might not know this either.

### Companies know your password
This could not be more false. Big companies such as Google, Facebook, Twitter, or really any decent website literally does not store your password in their database. This means a hacker, or a rouge employee, can't figure out what your password is.

They know that you've typed the right password in because of binary one-way operations. This means that the operation is really easy to do one way, but difficult if not impossible to do the other. For example, `abc` through a one-way operation may turn into something like `c4%1d`. This isn't actually what "abc" would turn into, so don't think that string means "abc".

So, when you type in your password again, they put it through the same one-way operation. If the result (or hash) is what they have in their database, then your password is correct.

If this is done right, you can't even reverse the password without centuries of computing time or billions of dollars.

### General Safety Tips
#### 1: Use a Password Manager
Passwords should be different for every website, but that doesn't mean you need to remember everything. Using a secure password manager can help. If you don't have any money to spend on internet security, I recommend [LastPass](https://www.lastpass.com/) or [Myki](https://myki.com/) (for non-cloud based storage). Otherwise, you can also use [Dashlane](https://www.dashlane.com/).

#### 2: Don't Answer "Security Questions" Truthfully
Relating to the first step, password managers often have "secure notes" as another storing type so you can easily store your security questions.

Why should you not answer them truthfully, though? Well, these are more important than your passwords (often), and more often than not **will not be encrypted in the company's servers.** General tip for you, not something crazy.
