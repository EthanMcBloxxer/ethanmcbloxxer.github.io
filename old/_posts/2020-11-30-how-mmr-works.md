---
layout: post
title: How Rocket League MMR Works
subtitle: Written by u/ytzi13 on Reddit
tags: [gaming, excerpts]
---

I haven't seen an easy to follow post in a long time that explains how the MMR/rank system works, and I've seen a lot of questions about it around the sub lately. Here is what I understand and I hope that it clears things up for those of you who have questions.

If I have something wrong, I hope that we can get some clarification from Psyonix in the comments.

Update May 6, 2020: If you would prefer to watch a video explanation, u/RyanGoldfish5 made a great 10 minute video summary (embedded below). It should answer most of the questions you may have about the system, but if by chance it does not, or you simply prefer to read, the following post should contain the information that you’re looking for.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/5Q7BJ7_L-Pg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><p/>

## What is MMR?
MMR, or Match Making Rating, is a hidden number value that represents your rank in-game. The rank and division that you see is a visual representation of this MMR value. Each rank represents a range of MMR values, each division a smaller subset on that rank.

For simplicity's sake, the MMR values I'm using here are not real values, but numbers meant to easily illustrate how it works.

For example, let's say that each rank represents 100 MMR, each division 25.

* Bronze 1 div 1: 0-24 MMR
* Bronze 1 div 2: 25-49 MMR
* Bronze 1 div 3: 50-74 MMR
* Bronze 1 div 4: 75-99 MMR

And so on and so forth.

Where can I track my MMR?
Tracker websites:

https://rocketleague.tracker.network  
https://www.rlstats.net  
https://www.rltracker.pro  

### What determines MMR gains and losses?
MMR gains/losses are determined solely on whether you won or lost the game. Points don't matter, MVP doesn't matter, goals, assists, and shots don't matter, goals against don't matter, a teammate leaving doesn't matter, forfeiting doesn't matter. Nothing matters except the win or the loss.

### How is my MMR affected by a win or a loss?
The amount of MMR that you win or lose after a game is determined by comparing your own MMR to that of your opponent's. This is where things get a little bit complicated and there are some things that I'm unsure about, but I'll be sure to indicate where that's the case and it would be great if Psyonix would weigh in and correct me if I'm wrong.

At the most basic level, we can guarantee that 3 things are true:

* When matched against an equally ranked opponent, you will gain or lose the average amount of MMR.
* When matched against a higher ranked opponent, you will gain more or lose less than the average amount of MMR.
* When matched against a lower ranked opponent, you will gain less or lose more than the average amount of MMR.

The average MMR value seems to be around 8 or 9.

With those basic truths aside, we can address some of the more complicated aspects of the system.

## Sigma, or the Uncertainty, Variable
Each individual playlist has its own matchmaking algorithm that determines your gains and losses (one for each competitive playlist and one for all casual playlists). In order for the system to determine how confident it is in your placement, it uses a sigma value to apply weight to the matchmaking algorithm and ensure that you get to your appropriate rank as soon as possible. To put it simply, the more games you play in a playlist, the more certain the system can be sure that you are ranked appropriately. This sigma value starts out high and is gradually reduced with each game played until it reaches its normal value at somewhere around 50-100 games played, although I seem to think that it may be even lower given the fact that we no longer experience full rank resets. So, every game played up until that value is normalized will result in higher MMR gains and higher MMR losses. In other words, your rank will fluctuate more rapidly and appear a lot less stable until you've played enough games in a single playlist.

One thing associated with the sigma value that may be confusing to a lot of people is the scenario that follows:

You party up with a friend for some ranked doubles: you are silver 3 div 3 and they are silver 2 div 2. You guys do really well and win a bunch of games, but at the end of your session you find that he is gold 2 div 1 and you're stuck at gold 1 div 1. Then, you realize that your friend has only played a total of 20 games in that playlist on the season while you've played 100. The sigma value was inflating the number of points that they gained, so they passed you.

Something important to note is that the sigma value is different for brand new players versus what we experience during a reset. Brand new accounts have a much higher sigma value than returning players.

## MMR in Parties
Matchmaking is done on a weighted average, but MMR gains and losses are determined by the highest individual MMR in the party.

### Update (30 Dec. 2019): As of the Season 13 Update (4 Dec. 2019), we can confidently say that matchmaking is mostly dependent on the highest player in the party.  
### Update (13 Feb. 2019): Unless the research I did somewhere between the time this post was written and now was horribly misinformed, it seems that they changed the exemption that I had observed. After further investigation, it does seem to be the case that every party's MMR gains and losses are determined by the highest player in their party, regardless of whether or not a Champion player exists.  

*Update (3 June 2020): Confirmed by u/Psyonix_Corey (thanks to u/HoraryHellfire2), we now know that parties where 1 player exists above 1140 MMR (mid-Diamond 3 for Doubles and Standard players) will be matched solely on the highest player in their party while parties where no player exists above that 1140 MMR threshold will be matched on a weighted average. That weighted average has been increased from seasons prior to 13.*  
*Update (31 March 2019): After performing an experiment here where I (GC) queued for 3 ranked matches with a Bronze 2, it seems that some threshold exists where a catch-up mechanic is enabled, the range of which is unknown. As you can see from the results, my MMR, as well as our opponents' MMR, fluctuated according to my MMR, but my teammate's MMR fluctuated according to his own MMR.*  
*Update (4 December 2019): The recent update has increased the weighting of party MMR to lean more heavily towards the higher ranked player than in previous seasons. Because of this, teams with disparity will experience more average MMR fluctuation and be punished less, though their average match will be against higher rated opponents.*  

~~To put it bluntly: players are punished for playing in parties. Playing with a party means that you will almost always gain less MMR for a win than you lose for each defeat. This is apparent because you are matched against teams with a lower MMR value than your highest ranked player, but awarded MMR based on your highest ranked player. The more disparity in ranks amongst your team, the more significant the punishment. Yes - this means that any time you play with a team, you will probably need to win more than 50% of your games in order for your MMR to break even. Yes - this also means that solo queueing provides an MMR advantage unless your team is almost identical in MMR amongst all of its members. This is a pretty effective tool to counter boosting and does a pretty good job of making encounters with boosters less punishing, which is the only reason that it's difficult to complain about (although discouraging players from forming teams does seem to go against what the game should ultimately be trying to accomplish). For example, a duo consisting of a Champion 1 and a Platinum 1, where the Platinum 1 is a smurf, will be matched up against Diamond 2/3 opponents. If they win, they'll probably gain around 5-7 MMR while the opponent will lose as much. If they lose, they'll likely lose around 12-14 MMR while the opponent will gain as much. Also, it should be noted that it seems the matchmaking system does a pretty good job of matching teams with rank disparities against teams with similar disparities.~~

Edit (30 Dec. 2019): The above paragraph is no longer true. Parties are no longer punished (when it comes to MMR gains and losses) as of the Season 13 update. Any party can queue together and play opponents at the highest player's rating. Whether or not this is good or bad for smurfing/boosting is up to you (I think it's bad and helpful for boosting parties) but it is arguably a very good thing for legitimate parties who are within a couple ranks of one another. Legitimate parties with vastly different ranks will be at a disadvantage.

## The Division 1 Buffer
Alternative “void” explanation at the end of this section, which may be more straightforward and easy to understand.

A long time ago, Psyonix discovered that it was discouraging for players to reach a new rank and immediately lose it the followinhg game. So, in order to counter that, they introduced a rank buffer. What this means is that, when reaching a new rank, you won't immediately lose that rank by losing the next game. Instead, the threshold for ranking up and the threshold for ranking down are different. I'll explain.

Before I get into the current system, I'll give a brief insight into the history of this system.

Back when we used to have 5 division, this buffer was a little bit different. What they did was make division 1 of one rank equivalent to division 5 of the rank below. For example, if Bronze 1 div 5 was represented by 80-99 MMR, Bronze 2 div 1 was also 80-99. This means that the threshold for ranking up was 100 and the threshold for ranking down was 79. Each time you ranked up, you would go immediately to division 2. Each time you ranked down, you would go immediately to division 4. This caused a lot of confusion with people as to why it is that they were gaining or losing 2 divisions at a time.

Onto the current system, Psyonix changed the number of divisions per rank from 5 to 4. This allowed for less fluctuation and resulted in a change in how they applied the buffer. Again, I'll illustrate how the current system works with some fake values.

* Bronze 1 div 4: 74-99 MMR
* Bronze 2 div 1: 100-124 MMR

When you hit 100 MMR, you are promoted to Bronze 2 div 1. But once you reach Bronze 2, the MMR value for Bronze 2 div 1 "changes" to something like this:

* Bronze 2 div 1: 86-124 MMR

This gives you a 14 MMR buffer, meaning that you can lose 1 or 2 games without immediately being demoted. This helps from discouraging players who immediately lose games after accomplishing a goal, and allows for players who reached a new tier some forgiveness when trying to grind out their season rewards.

But this also introduces a point of confusion for some people who experience a rare case where they may demote 2 whole divisions, or who will demote in rapid succession.

For example, you are promoted to Bronze 2, lose 2 games, and are down to 86 MMR. Since 85 is the threshold for demotion and it's not unrealistic to lose 13 MMR for losing a game, the next loss could set that person back down to 73 MMR, which is the top of Bronze 1 div 3 and would leave the person wondering why it is they didn't end up at Bronze 1 div 4. Even if they did demote to Bronze 1 div 4, another loss would almost certainly set them back to Bronze 1 div 3, which may seem unfair and is like the source of a lot of people claiming that they need 4-5 wins to promote and a single loss to demote.

Similarly, because a demotion to div 4 requires multiple wins to get back up to the next rank due to the buffer, a lot of people will leave the previous game before the scoreboard and will be notified of their demotion following the next game, even if they won.

## Alternative Void Explanation
Instead viewing this as a division buffer, you can choose to see each rank as a smaller range of MMR with what I’m going to call “void ranges” between ranks. What this means is that ranks are defined by a range of MMR values, but the MMR threshold for the next rank starts after an MMR gap that we can consider either both ranks, or no ranks.

Let’s see an example.

* Bronze 1 div 4: 74-85 MMR
* Bronze 1/2 Void: 86-99 MMR
* Bronze 2 div 1: 100-124 MMR

In this case, we look at the void as no rank, or both ranks, or essentially a space where rank cannot change. If you’re Bronze 1 div 4 and you enter the void, you stay Bronze 1 div 4. If you’re Bronze 2 div 1 and you enter the void, you remain Bronze 2 div 1.

This is likely easier to understand than dynamic rank values and is a more accurate explanation of what tracker websites show, and presumably what the underlying code represents.

## Duo-Queueing Standard
~~I'm really unsure about how this works, to be honest. When you and one other teammate queue for Standard, it does seem to take your weighted average and use that value to matchmake with. I can't claim to know exactly how this works, but that does seem to be the case and is actually something that I really believe should be regulated by Psyonix.~~ Duo-queueing works by taking the highest player's rank in the party (or an extreme weighting that might as well only account for the highest rank in the party) and matching the entire party as if each player were that same, higher rank. This is something that Psyonix doesnt, but absolutely should regulate, in my opinion. Often times you'll encounter 2 friends who queue Standard together with significant rank disparities. For example, a Diamond 3 and a Platinum 2 could queue for Standard together and each be treated as a Diamond 2. They will be matched with a Diamond 2 solo queue teammate against a team of average Diamond 2 MMR. I've experienced this a lot as a solo queuer and while it's not impossible to win, it makes for a very unpleasant experience as that lower ranked teammate is largely unable to contribute at a level that you would expect. Unless you have Alpha Console or Bakkesmod enabled, you have no way to know that they are significantly lower ranked and really should not have to make that assumption when going into a game that you expect to consist of similarly skilled players.

~~I would love to get Psyonix's take on this issue as well as some confirmation as to how duo-queueing is actually handled.~~

Edit (5 May 2019): My current understanding is that a party of 2 will be matched as the weighted average of the 2 players while their team's value will be averaged with their 3rd. This is my best guess considering a team consisting of 3 solo players will be matched on their unweighted average.

~~Edit (10 February 2020): Parties of 2 will be considered the highest player in the party while their team rating will be averaged with the 3rd.~~

Edit (3 June 2020): Parties of 2 will match according to party rules discussed above in the "MMR in Parties" section.  

## Does the Champion Exemption Still Exist?
For those of you who don't know what I'm referring to here, there was a system introduced in Season 3 that was meant to make it very difficult to boost players to Grand Champion.

A brief history lesson:

Season 2 used a straight up average when matchmaking teams and was proven to be highly abusable for obvious reasons. To put this in perspective, a team of two Challenger Elite/Rising Star level players who were committed enough to regularly make smurf accounts could theoretically boost one another to Grand Champion while facing opponents no higher than Challenger Elite/Rising Star. In response to this, Psyonix announced that they would be introducing a constraint to competitive playlists that would not allow players to party with other players who were more than 3 ranks above or below them. The community vocally disapproved of this, wanting to play competitive with their friends no matter how much higher or lower they were ranked, so Psyonix never actually implemented it.

Instead, Psyonix introduced a system that used the highest player's MMR in the party to match against. This was in effect for a little while, but was ultimately changed as the community disapproved of this as well. This makes sense because it discouraged players from playing with anyone who wasn't exactly the same rank and the same skill level as themselves, took all of the fun out of playing with different ranked players, and encouraged solo play because the worst case scenario would be an equally skilled opponent while you could guarantee that opposing parties were going to be less skilled than yourself.

From there, Psyonix settled on the weighted matchmaking system that we have today (though it's gone through a lot of obvious changes). Teams would be matched on the weighted average, meaning the team's determined MMR would be skewed towards the highest player(s) on the team. This did a decent job of discouraging boosting while allowing for people to match fairly against opponents, no matter who their teammate was. But in Season 3, any team with a player ranked Champion or higher was exempt from the rule and still matched based on the highest player's MMR. This meant that, in order to boost someone to Grand Champion in Season 3, the booster's rank was irrelevant in matchmaking and they were always matched against the boostie's rank, meaning the booster had to at least be capable of playing at the Grand Champion level.

I've discussed this with quite a few people since then, but it seems that this system has been removed as of Season 4. It's been generally agreed upon that it doesn't exist at Champion 1, but some say that it may exist for Champion 2+. My own experience has said otherwise, but it's difficult to prove simply because the population is so scarce in high Champion and so matchmaking is less consistent. My experience in playing regularly with a split team last season (often times including a low Champ 1, low-mid Champ2, and a high Champ 3) is that the exemption does not exist. I would love to get a confirmation from Psyonix about whether or not this is still a thing.

Edit (10 February 2020): Teams with a significant rank discrepancy most definitely will gain different MMR values (the highest player gaining and losing normally while the lower player gains more and loses less). We know this system exists for extreme party discrepancies (&amp;amp;amp;amp;gt;3 ranks?), but we don’t know if there is an exemption for Champion+ parties. All evidence has pointed to Champion+ parties being exempt, but more research would be required to say for certain.

## How do new seasons affect our MMR? (added 22 Feb. 2019)
In seasons 6 and 7, the soft reset opted to set everyone above 1180 MMR (Diamond 3 div 4) back to 1180 MMR (doubles and standard playlists... other lists are set back to their relative MMR values). In seasons 8 and 9, that barrier was increased from 1180 up to 1380 (Champion 2 div 4). As far as I know, every other player who ended below that threshold started at the same exact MMR that they ended the season at.

Now, I can't reliably speak to past seasons - although I do have some inconclusive, but convincing, information that I can at least use to generate a good guess - so I'll just speak on behalf of the current season (season 10). 1 of 2 things is happening during the reset with regards to our sigma values for each playlist. A normalized sigma value is 2.5. I've been shown evidence that the reset increased sigma values to 3.0. We can be fairly certain that one of the following cases are true:

Psyonix reset all sigma values below 2.5 to 3.0 on the season's start. Any playlist with a sigma value above 3.0 was kept as is.

Psyonix increased each player's sigma value by 0.5 for each playlist. This would mean that every playlist, regardless of what the end-season sigma value was at, was increased by 0.5. This may have been the behavior for several seasons as I've seen proof of a season 10 start value of 3.5 in a playlists that wasn't touched for all of season 9.

A sigma value of 3.0 will normalize somewhere in the range of 10-20 games. This seems to be the case for the beginning of the season, so the actual length may be lower because sigma values are affected by the opponent's sigma value (if an opponent has a lower sigma value than you, meaning the system is more certain of their rank, then your sigma value will be normalized faster). So, the beginning of a season ultimately extends the effects sigma has on your rank the earlier you play.

If I've missed anything, feel free to let me know in the comments!

Edit: Formatting (thanks u/HoraryHellfire2). Also credit to him for research into season 10 sigma reset values.


<a href="https://www.reddit.com/r/RocketLeague/comments/8qvbwf/" title="Reddit"><i title="Originally on Reddit" class="fab fa-reddit-alien"></i> Originally posted on Reddit</a>
