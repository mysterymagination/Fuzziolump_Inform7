"Fuzziolump" by "jeff creswell"

Chapter 1 - The Frosted Forest

The player is in the Chamber of Soiled Vestments.
The Chamber of Soiled Vestments is a room.  The description of The Chamber of Soiled vestments is "[laundry-description]"

To say laundry-description:
	if The Chamber of Soiled Vestments has not been visited:	
		say "The musty warmth of the laundry room has always appealed to you; it suggests a friendly invitation to the unknown, and there always seems to be another unexplored dark corner.  Plus it's always warm and the soft tumbling of the dryers is soothing.  You smile contentedly at this thought, imagining that few people bother to appreciate the subtle treasures in a blanket of soft shadow.  A shared laundry like the one in your building is exponentially better, since every traveler through it leaves a little bit of themselves behind, enlivening the story.  If you were the type to rifle throw other people's skivvies it might be livelier-still, but that's intrusive. Also gross.  The dryer rumbles to a halt, then buzzes obnoxiously.  The world sure seems to love its noise.";
	otherwise:
		say "You stand in the laundry room.  A speck of lint drifts by, placidly."
	
The Table is a closed and openable container in the Chamber of Soiled Vestments.
There is a 9-volt Battery in the Table.  The description of the 9-volt Battery is "Time and tide (by the look of it, it has actually been swimming) have not been kind to this old fellow, but he might still have some juice left."
There is a Singed Penny in the Table.  The description of the Singed Penny is "This is an especially bad sign; completing a fuse with a penny is a classic strategy for starting electrical fires in the handbook of the incompetent handyman.  Since this one evidently did not burn down your home, you decide it must be a lucky penny.  At least this one is not currently serving as a vector to fiery oblivion for the building's occupants, but another one may have replaced it... you shudder and try to put it out of your mind."
There is a Rusty Pocket Knife in the Table.  The description of the Rusty Pocket Knife is "A simple folding pocket knife, its blade pitted by age, the elements, and lack of maintenance.  Still, the edge is sharp and the knife is compact when folded."
The Dryer is a closed and openable container in the Chamber of Soiled Vestments. 
There are Clothes in The Dryer.
Instead of taking the Clothes:
	say "Ducking down peer to inside, you're greeted by a pleasant surprise -- your clothes are fully dry for once!  As you pull clothes from the dryer and pile them in your hamper, you note that only a single sock of your favorite pair is present and accounted for. They're the super-fuzzy wooly kind, and are patterned with kittens playing with balls of yarn on one and puppies chasing sticks on the other.  Looking down at the lonely puppy sock, your heart aches a little.  Poor guy.  Practically climbing halfway into the dryer, you reach and flail about for the errant kitten sock to no avail.  

Re-adjusting yourself, you poke your head in to take a closer look, expecting ruefully to see only empty dryer walls. Instead, you see the head, forelegs, and fuzzy whiskers of an otter staring at you with anxiety quaking in its fathomless black eyes.  He's wearing a darling little tophat, bowtie, and a gold-rimmed monocle adorns one eye.  Before you can react, he boops your nose with a soft paw, his expression apprehensive. After a bizarre moment staring at each other in this manner, reality begins to spin and you fear someone has turned the dryer on with you halfway inside!  You close your eyes, bracing for the inevitable pain as you evaluate the strength of the dryer's tumble cycle first-hand.  There's no pain, however, and after only a few dizzying seconds the world stills.";
	Now the player is in The Atrium Glade.
[full stops and line breaks can apparently be synonymous sometimes -- if I don't use a full stop after atrium-glade-desc text sub below, I get a compile error unless I add a line break separating the room declaration and the rule about how to describe it.]
The Atrium Glade is a room. "[atrium-glade-desc]."
To say atrium-glade-desc:
	if Atrium Glade has not been visited:
		say "Only, it's a different world than the one you left.  A cool breeze and the unmistakable smell of pine needles coaxes you to open your eyes.

		    You find yourself in a wintry forest glade. Evergreen foliage, bearing a light sprinkling of snow such that it resembles sugar-dusted sweets, surrounds you";
	otherwise:
		say "A refreshing cool breeze carresses your cheek and ruffles the wintergreen foliage.  Only the gentle fwump fwump of the otter's wings breaks the tranquil silence, a comforting constant".
The Holly Bush is here. "A holly bush rustles thoughtfully in the wind." 
The Sprig of Holly is an object. "A sprig of holly rests nearby.  Sighs of feminine longing and entreaty in a thousand thousand voices whisper on a sudden gust of wind that pushes it gently towards you."
Instead of examining the Holly Bush:
	if the  Sprig of Holly is not in the Atrium Glade:
		say "You examine the nearest frosted greenery, a holly bush whose bright red berries contrast beautifully with the pure white snow.  Brushing a hand over the bush idly, you jump higher than you thought possible when one of its branches extends creakily and a sprig reaches out to pat you right back.  As if taken aback and perhaps chagrined by your startled reaction, the branch withdraws shyly, and a sprig of holly flutters gently to the ground.";
		now the Sprig of Holly is in The Atrium Glade; 
		now the description of The Sprig of Holly is "A shy little memento of the frosted forest, this bit of holly has a single pointy leaf and a single berry the color of a cheerful blush.  Whenever you touch it, a light puff of wind kisses your cheek, carrying the ghost of a flirty giggle."; 
	[apparently anon description assignments are transient -- if I run the bug where looking at the bush always teleports the sprig to the ground, the description is only available when it first enters the environment.  Explicitly looking at the sprig after its first appearance yields default  desc]
	otherwise:
		say "The Holly Bush waves serenely in the languid wind, and at you.  Every now and then it forgets itself and waves against the wind."
[it would be nice to define a greet action that can be certain verbs like 'shake hand/paw' or 'say [greeting]' so we avoid get ye flask situations... later perhaps]
Understand "hello/hey/yo/hiya/hi" as "[greeting]".
[does it make sense to follow a similar pattern re: trigger statements/actions that advance the story in a general context?  It was required in Twine because gamebooks, but here there is a significantly more freedom.  That freedom, however, does not mean it's wise to make obstacles out of everything, especially when it only makes sense that an NPC would try to further things along themselves.  What might make some sense, just to break up the exposition train, would be to have Nuvi listening for the purposes of adapting to whatever language The Human speaks... but then we're getting close to boulder-skipping unless we want to actually delve into some sort of universal translator-mo-tron system.  Best bet would be to have Nuvi act like he reasonably would based on his motivations but also not drown the player in information -- the player can ask for clarification if necessary, and Nuvi's NLP KR should handle that.]
Understand "where am I/where is this" as "[query_location]".
Understand "who are you/what's your name/what is your name" as "[query_nuvi_re_personal_info_polite]".
Understand "what are you" as "[query_nuvi_re_personal_info_rude]".
Understand "what is a conduit/explain conduits/explain conduit" as "[query_nuvi_re_conduit]".
A Winged Otter is a kind of person. 
[todo: does this define Winged Otter a new noun that inherits from person, or does it simply alias Winged Otter to person?]
[todo: how do I assign new properties to a custom noun, e.g. 'Player_Affinity is a number.  An Actor has Player_Affinity. Winged Otter is a type of Actor.  Nuvi's Player_Affinity increases by 1.' ?]
[todo: does Inform 7 support maps/dictionaries?  I'd like to be able to map character id : affinity value like I did in JS]
Nuvi is a Winged Otter.  Nuvi is here.  Nuvi can be hat-tipped.  Nuvi can be ready to ride.  "A winged otter flaps serenely nearby.  His tophat is dapper." 
Understand "otter" and "winged otter" as Nuvi. [why doesn't the same x/y/z syntax used for defining text subs above work?]
The description of Nuvi is "The otter, who sports a pair of fluffy brown wings the same shade as his sleek tawny fur, flits about your head, appraisingly.  His little tophat tilts gently back and forth in a hypnotizing pattern, in time with the rhythm of his lazy wing beats.  It is the dapper-est."
After answering Nuvi that "[greeting]" for the first time:
    now Nuvi is hat-tipped;
    say "The Winged Otter beams at you.  'Hello, there Human!  My name is Nuvi.  I'm sure you're wondering what just happened -- the short version is that you've been transported across time and space to another world.'  He grins whiskeryly and spreads his little paws wide in proud indication.  Or maybe he wants a hug. 
	[paragraph break]'This is not Earth, but a wondrous land of whimsy and warmth called Fuzziolump!  Your people's thoughts and feelings and imaginings gave us life, in point of fact, a process which has accelerated exponentially in recent decades with the advent of telecommunications and a magical thing called The Internet -- all that cognition flying about in the aether sort of landed here, and took root.  It's not a well-understood matter, but we know we have humanity to thank for our existence! [paragraph break]Glossing right over that massive tidbit, we're standing in a lovely little area of the Frosted Forest we lumpkins call the Atrium Glade.  It's the lumpside connection point, which we call a Socket, of the Conduit you passed through to get here; your dryer was the Socket on your end.  Dryers are often Sockets on Earth for some reason -- we get all kinds of socks and, erm, other underthings coming through.'  He manages to blush through his fur.";
	say "[paragraph break]'I know that doesn't make a lot of sense: it's fine, don't worry about it.  You can always ask me about Conduits, Sockets, Atrium Glade, Frosted Forest, or Fuzziolump itself on the way, if you like.'  He smiles and blinks placidly while the two of you stare at each other in awkward silence for several seconds.  Then a realization strikes him: 'Oh!  Yes, sorry, I haven't told you why I brought you here yet.  Our Great Need.'  He twitches his whiskers and adjusts his bowtie anxiously. 'You see, Fuzziolump has long been a place of peace enjoyed by one and all, but recently there has been an upwelling of violence and turmoil.  The cause is our gods.  We didn't have any at first.  The fully mortal lumpkins are quite complex enough, and even with the vast sum of Earth's imaginings it took ages for us to develop.  Several centuries have passed since we grew smart enough to start recording our history, and it seems the more we wrote and thought and felt the experiences of life, the faster Fuzziolump grew.  Its own denizens' imaginings fuel it in addition to Earth's ever-deepening pool of creative energy, and this exponentiation plus some experimentation with tool-assisted metamorphosis has led to a few more potent lifeforms.  Effectively, gods.
	[paragraph break]Now, this might be cause for celebration -- a whole new category of sapient life, more deeply sapient than any of us can fathom!  Unfortunately, power and depth of mind do not equate to wisdom.  The young gods of Fuzziolump are very different, but their common trait is an understandable lack of experience combined with an unprecedented ability to influence the world around them.  Some have even learned to syphon off the creative energy Fuzziolump thrives on, and threaten to collapse this world in on itself.  It isn't clear what would happen to the gods if this world perished, but I and my loved ones and millions more like us would surely be snuffed out like the humble little candle flames we are.  I cannot allow that to happen.  What to do though?  Every lumpkin knows that Earth and humanity are our progenitors, specifically your creativity.  So, it only seemed reasonable to bring a human creative here to help untangle this little knot of divinity.  At least, I think that's why we've summoned you.  The Council of Animals made it a top secret matter, so little folk like me can only guess.  But yeah, you create every day -- you must know how to turn that power off, or keep it under control?'"
After answering Nuvi that when the topic understood includes "creativity/creative" for the first time:
	now Nuvi is ready to ride;
	[todo: can we examine the exact string the user gave and then respond appropriately here?]
	say "all right then."
Check going in the Atrium Glade:
	if Nuvi is not hat-tipped:
		say "As you try to move away, the winged otter flaps down to block your path, doffing his dapper tophat to you and waving a soft paw shyly.";
		stop the action;
	otherwise if Nuvi is not ready to ride:
		say "Nuvi flaps neurotically and squeaks 'Hang on, hang on, can you control creativity as we assumed?'";
		stop the action;
	otherwise:
		continue the action.
[todo: add Nuvi responses about EXPOSITION!!! matters, especially re: the human answering his question about controlling elemental creativity]		

Release along with a website, an interpreter