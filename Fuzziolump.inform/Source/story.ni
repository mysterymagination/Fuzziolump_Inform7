"Fuzziolump" by "jeff creswell"

Chapter 1 - The Frosted Forest

The Party is a List of texts which varies.
When play begins:
	add "player" to The Party.
	
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
The Atrium Glade is a room. "[atrium-glade-desc]".
To say atrium-glade-desc:
	if Atrium Glade has not been visited:
		say "Only, it's a different world than the one you left.  A cool breeze and the unmistakable smell of pine needles coaxes you to open your eyes.

		    You find yourself in a wintry forest glade. Evergreen foliage, bearing a light sprinkling of snow such that it resembles sugar-dusted sweets, surrounds you";
	otherwise if Nuvi is not ready to ride:
		say "A refreshing cool breeze carresses your cheek and ruffles the wintergreen foliage.  Only the gentle fwump fwump of the otter's wings breaks the tranquil silence, a comforting constant.";
	otherwise:
		say "A refreshing cool breeze carresses your cheek and ruffles the wintergreen foliage.  Only the gentle fwump fwump of the otter's wings breaks the tranquil silence, a comforting constant. You can see a path in the thick forest leading North.  Nuvi eyes it meaningfully."
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
A person has a number called player affinity.  Understand player affinity property as referring to a person.
A Winged Otter is a kind of person.     
[todo: does this define Winged Otter a new noun that inherits from person, or does it simply alias Winged Otter to person?]
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
[todo: can you run section-based code?  I'm wondering if I can set a context for the conversation without simply raising a flag and then having to lower it once another convo context begins]
After answering Nuvi that "no":
	say "No what?".
After answering Nuvi that "yes":
	say "Yes what?".
Understand "no/not/cannot/can't" as "[negation]".
After answering Nuvi that when the topic understood includes "creativity/creative" for the first time:
	now Nuvi is ready to ride;
	add "nuvi" to the Party;
	if the topic understood does not include "[negation]":
		say "'Really?!  I thought it was a longshot, honestly, that you would be able to control elemental creativity!  Well, the Council of Animals will be thrilled.'  He does a barrel roll and flits about your head, joyously.  Shame on you for lying to such an innocent creature!";
		[say "prior to unlikely magic, Nuvi's fondness for the player has an amplitude of [player affinity of Nuvi]";]
		now the player affinity of Nuvi is player affinity of Nuvi + 5;
		[say "after unlikely magic, Nuvi's fondness for the player has an amplitude of [player affinity of Nuvi]";]
	otherwise:
		say "His little whiskers droop, and his tophat slides down over his eyes. Pushing it back up into place, he responds, 'Oh.  Well, I can't say I'm surprised that you're not able to control elemental creativity.  We'd always hoped that Humanity, as our sires and kinda sorta ancestor god type of things, would be... I dunno, super-crazy-magic, I guess.  That's a childish assumption, however, and there's surely nothing for children in Fuzziolump!'  His snoot wiggles thoughtfully, and then his whiskers spring up so fast they bounce. 'Ah well!  It is the nature of things to generally be more realistic than we imagine them, unless of course we're actually imagining them into reality.'  He grins at you, as if this was a perfectly normal sentence. 'Come on then, let's go see the Council of Animals anyway -- I'm sure you can help us somehow!  They're off North, beyond the Frosted Forest's edge in the sandy savannah of the Wombat Warrens.'" 
Check going in the Atrium Glade:
	if Nuvi is not hat-tipped:
		say "As you try to move away, the winged otter flaps down to block your path, doffing his dapper tophat to you and waving a soft paw shyly.";
		stop the action;
	otherwise if Nuvi is not ready to ride:
		[careful with this business, it's not more open world-y if we impose a sequence of actions that are just hidden; that's an annoying gamebook, not true text adventure]
		say "Nuvi flaps neurotically and squeaks 'Hang on, hang on, can you control creativity as we assumed?'";
		stop the action;
	otherwise:
		continue the action.

A Dryad is a kind of Person.  Willoweave is a Dryad.
A Faerie is a kind of Person. Shimmerin is a Faerie.
The Bejeweled Pines is a room. "[bejeweled pines desc]".  [Shimmerin and Willoweave are here. -- don't want them to show up named immediately]
North of the Atrium Glade is the Bejeweled Pines.
There are trees in the Bejeweled Pines. "[initial fancy trees desc]".
To say initial fancy trees desc:
	say "the trees here are no less dusted with snow than their fellows you just pushed through, but they have also been festooned with crystal and glass baubles of every conceivable hue.  Little soft-glowing lights flit from ornament to ornament, keeping the emphasis and shading dynamic."
To say bejeweled pines desc:
	[if bejeweled pines has not been visited:
		say "You stand amongst a dazzling array of colors: [initial fancy trees desc]";
	otherwise:]
		say "You stand amongst a dazzling array of colors: these trees are Fancy."
	[todo: move these descs to handling for closer looks at the trees and lights
	if "shimmerin" is not listed in The Party:
		say "An especially vibrant lilac light departs from the others, flitting about your head playfully.  As your gaze follows it, you note a pair of brilliant green eyes in a feminine face blinking curiously at you from the bark of a nearby tree.  What you had taken to be an odd crystalline growth on the side of the tree resolves itself to be an amethyst necklace cascading down her decolletage like a waterfall's wildness stilled by the gentling influence of frost."]
After going to the Bejeweled Pines for the first time:
	repeat with character running through the Party:
		if character is "nuvi":
			now Nuvi is in the location;
	continue the action.
[ todo: nope, this doesn't work.  *sigh* I just want to either have anonymous tree objects in the room that the player can examine and are NOT auto-mentioned by the library or just have them mentioned in the desc along with context sensitive action handling as necessary.  Neither of these seems to be a possibility.
After examining anything when the player's command includes "tree" and the player is in the bejeweled pines:]
The description of the the trees is "[detailed bejeweled trees desc]".
To say detailed bejeweled trees desc:
	if "willoweave" is not listed in the party:
		say "Upon closer inspection of a nearby tree, glittering with tinsel made from filaments of actual silver, you note a pair of brilliant green eyes in a feminine face blinking curiously at you from the bark of a nearby tree.  What you had taken to be an odd crystalline growth on the side of the tree resolves itself to be an amethyst necklace cascading down her decolletage like a waterfall's wildness stilled by the gentling influence of frost.";
	otherwise:
		say "Baubles and glorious gizmos adorn the trees all around this grove.  It may just be you, but they seem to be preening in so far as plants can pose."
		
After answering Nuvi that when the topic understood includes "trees" and the player is in the bejeweled pines:
	say "A sudden grin brightening his whiskery mug, Nuvi explains, 'A small tree effigy fell into this forest long ago, decorated in a similar manner. The trees here were so smitten by the style they demanded to be honored with comparable shinies and lights.  The dryads felt abashed that trees elsewhere were so honored, and strove to worship their charges fittingly.  Unluckily for the glass-blowers and enterprising faeries, the trend did not catch on elsewhere in the forest.'  Flapping down close your ear, his whiskers tickling your cheeks, he whispers,  'The other trees consider these ones a bit gaudy.'  He holds a little paw over his mouth to stifle his giggles.  When his secret laughter knocks his monocle off, he sobers quickly."

Release along with a website, an interpreter