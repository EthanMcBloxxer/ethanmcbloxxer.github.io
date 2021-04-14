# ProtonMail: Privacy-Centered Email
*A easy-to-switch Gmail alternative for privacy*  
*Created on February 21st, 2021*

It's recently come to my attention via multiple methods, such as the [DuckDuckGo help pages](https://help.duckduckgo.com/duckduckgo-help-pages/features/email/) when I was looking in to the search bar on the home page. On the DuckDuckGo help pages, multiple email providers are offered, but [ProtonMail](https://protonmail.com) is the only one with a viable free plan.

To my amazement, I found this at the perfect time -- I was making PGP keys for future use. I now have those keys inside of my ProtonMail account. But, this isn't the only amazing thing ProtonMail can do. In fact, ProtonMail isn't even all privacy features. It's got some really useful features other than just "Inbox", objectively more than Gmail. Let's start out with some of the features:

## Basic Features

### Desktop Notifications
ProtonMail, like most email providers, also has desktop notifications. This is in vain for me, because Opera GX has no idea what those mean, or my system has a grudge on Opera GX. I'm unsure which it is at the moment.

### Keyboard Shortcuts
There are quite a few different keyboard shortcuts, and some require you to move your hand across the keyboard, so that should give you a general idea of how many there are. If you'd like to not care about that, then you can always forget about it and just use these:

![ProtonMail beta: Keyboard shortcuts - Basic navigation/actions](https://bloxxing.is-ne.at/S111hp.png)

### Quality of Life
Like Gmail, ProtonMail has quite a few Quality of Life features that just improve your experience using the service, like

* Undo send
* Drafts
* Auto-reply (paid)
* Signatures
* Filters

### Customization
Like Gmail and unlike Gmail, starting with unlike Gmail, you can't change the background of ProtonMail to a cute dog. You can, however, change the layout of almost everything else. The composer can be a popup or a full window, the inbox can be two-column or one (preferably two, I got used to that from Gmail -- it's just better), conversation groups can be disabled (like in Outlook when you reply to a message and it continues without making a new email), the density can be more compact, and you can change the order of read/unread buttons. Probably best of all this: there's a dark mode.

### Aliases
This feature could also be known as subaddressing.  
If you created your own `junk@gmail.com` (I really want to know who owns that) with some other characters or your name, you no longer need to do so for ProtonMail because of aliases. What's an alias?, you might ask. Aliases are email name extensions (sounds like domain name extensions like .com, and it is kind of like that) that are somewhat part of your email. They look a bit like this: `yourname+alias@protonmail.com`, with `yourname` being your username and `+alias` being the alias. The alias and username are seperated with a `+`. You can't create them, they're all already created, you just need to have someone send them an email. The whole reason for these is to allow you to use filters to sort email sent to this address. For example, if someone sends email to `ethanmcbloxxer+junk@protonmail.com`, then I can make a filter to move that into a folder called "Junk", filter it into Spam, or label it "Junk". In my mind, these exist so people don't create more accounts, as by the Proton ToS, you can only have 1 free account. I didn't realize this for a week and created 2 more accounts, `ethanmcjunk@protonmail.com` and `ethanmcbloxxeryt@protonmail.com`. When I realized aliases exist and that more free accounts are against the ToS, I deleted them quickly. Although, from Proton on Reddit,

[!["While you can have more than one free account - say, a backup email address - having too many free accounts is not considered an acceptable use of our service. Also please note that attempting to create multiple accounts will trigger more difficult verification methods such as Email or SMS."](https://bloxxing.is-ne.at/gf5YIT.png)](https://www.reddit.com/r/ProtonMail/comments/lcbmmv/multiple_protonmail_accounts/glzgvcj)

### @pm.me
Great for ProtonMail, they made a thing that Gmail doesn't have: @pm.me (short for ProtonMail me or Private Message me). If you go into your Settings and Addresses, you can create a @pm.me address. Sadly, unless you have a paid plan, you can't actually send messages with it. I, personally, don't really care about sending messages too much. You can actually create more of them if you have a paid plan along with sending with it. Another thing that makes this feature better, though -- telling people either `@gmail.com`, `@yahoo.com`, or `@outlook.com` is pretty normal and very easy for them to remember (they've already heard of the service) but `@pm.me` could actually be easier to remember because of its uniqueness and meaning.

### Custom Domains
This is a paid feature (which is kind of mean considering a custom domain is about $12/yr anyways) which allows you to use ProtonMail on your domain, like `me@blox.er` (I wish I had that email). I don't care too much for the feature, as in total it's about $15/yr when in reality it'll probably be easier to tell cashiers "first.last@pm.me" instead of "me@somerandomdomain.name".

### Folders, Labels, and Filters
I do believe Gmail has something similar to this feature, however ProtonMail makes it very customizable, as they allow you to make custom filters via [Sieve](https://en.wikipedia.org/wiki/Sieve_(mail_filtering_language)), which is actually a very bad idea because free users can only create a single filter, basic or Sieve, however in Sieve you can create an elseif block. In fact, I have my own Sieve filter designed for filing 3 different aliases into folders and labels:

```sieve
require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "fileinto", "imap4flags"];

if anyof (address :all :comparator "i;unicode-casemap" :matches ["To", "Cc", "Bcc"] ["ethanmcbloxxer@pm.me"]) {
    fileinto "PMs";
    keep;
}
elsif anyof (address :all :comparator "i;unicode-casemap" :matches ["To", "Cc", "Bcc"] ["ethanmcbloxxer+junk@protonmail.com", "ethanmcbloxxer+junk@protonmail.ch", "ethanmcbloxxer+junk@pm.me"]) {
    fileinto "Junk";
    addflag "\\Seen";
    keep;
}
elsif anyof (address :all :comparator "i;unicode-casemap" :matches ["To", "Cc", "Bcc"] ["ethanmcbloxxer+yt@protonmail.com", "ethanmcbloxxer+yt@protonmail.ch", "ethanmcbloxxer+yt@pm.me"])  {
    fileinto "YouTube";
    keep;
}
```

This files @pm.me emails into the "PMs" label, `+junk` into the "Junk" folder, and `+yt` into the "YouTube" folder.

## Security Features

### Passwords
Obviously, right? Of course ProtonMail has a password. The thing is, though, it's completely possible to have 2 passwords -- one for login and one for inbox decryption. For most users, this isn't a great option. In fact, I don't use it, but then again, my password is somewhere in the 50-500 range, so I have some justified doubts on whether or not I'll need 2 passwords.

### 2FA
Two factor authentication is also present on ProtonMail, via TOTP. I recommend ditching Google Authenticator if you're using it and switching to something else, like Authy. (I hate saying that because I use MYKI for 2FA and never really liked Authy)

### U2F
ProtonMail does not currently support U2F or security keys like Yubikey. They are, however, [planning to release it](https://www.reddit.com/r/ProtonMail/comments/cheoy6/when_u2f/feh2lw0/).

### Recovery
Recovery Email and SMS are supported, and you can turn off password resetting from a specific one if you believe that your recovery email or phone number isn't secure enough. I recommend setting at least one of them to allow password reset.

### PGP
As advertised, PGP is a big part of ProtonMail. You can create RSA 2048/4096 and X25519 (ed25519) keys for email encryption and a RSA 2048 created by default for encrypting contacts. You can send this key as an attachment for all email sent as well as signing the messages.

### .onion
Aside from being zero-access end2end encrypted, there is additionally a .onion service domain at [protonirockerxow.onion](https://protonirockerxow.onion/). This could probably fit better in a privacy features category, but there's not much else other than "we can't read your data".
