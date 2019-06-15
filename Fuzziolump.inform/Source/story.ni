"Fuzziolump" by "jeff creswell"

Section 1 - Custom Definitions, or That Shouldn't Be

[
Underlying relates various things to one thing. The verb to underlie means the underlying relation. The verb to be under means the underlying relation. The verb to be beneath means the underlying relation.

Instead of looking under a thing which is underlaid by something (called the lost object): 
	say "You find [the list of things which underlie the noun]!"; 
	now every thing which underlies the noun is carried by the player; 
	now every thing which underlies the noun does not underlie the noun.

Hiding it under is an action applying to one carried thing and one thing. Understand "put [something preferably held] under [something]" as hiding it under. Understand "hide [something preferably held] under [something]" as hiding it under. Understand the commands "shove" and "conceal" and "stick" as "hide".

Check hiding it under: 
	if the second noun is not fixed in place, say "[The second noun] wouldn't be a very effective place of concealment." instead.

Carry out hiding it under: 
	now the noun is nowhere; 
	now the noun underlies the second noun.

Report hiding it under: 
	say "You shove [the noun] out of sight beneath [the second noun]."
	
Behind relates various things to one thing. The verb to be behind means the behind relation. The verb to be occluded by means the behind relation.

[Instead of looking behind a thing which has something behind it (called the hidden object): 
	say "You find [the list of things which are behind the noun]!"; 
	now every thing which is behind the noun is carried by the player; 
	now every thing which is behind the noun is not behind the noun. -- todo: such wacky syntax]

Hiding it behind is an action applying to one thing and one thing. Understand "hide [something] behind [something]" as hiding it behind.

Check hiding it behind: 
	if the second noun is not fixed in place, say "[The second noun] wouldn't be a very effective place of concealment." instead.

Carry out hiding it behind: 
	now the noun is nowhere;
	now the noun is behind the second noun.
	
[todo: visibility mod re: behind relation? this is bloody nuts.  Why oh why can't I just say 'now X is invisible'?  How is that vague?!  How is some crazy hardcoded nonsense about light levels when the issue is occlusion less vague?

Visibility rule when looking at something behind: 
	if description of the noun is not "": 
		say "[description of the noun]";
		there is sufficient light; 
	there is insufficient light.]

Report hiding it behind: 
	say "You shove [the noun] out of sight behind [the second noun]."
	
]

Section 2 - On Global Declarations and the Virtue of Simplicity

[declare/define global regions]
Fallen Fae Maze is a region.
The Ghostly Greeting Chamber, Frozen Stair, Diamond Throneroom, Treasure of Stillness, and Crystal Gardens are in Fallen Fae Maze.

[declare/define global rooms]
The Ghostly Greeting Chamber is a Room.
[apparently you can't both define a room's spatial relationship to another room and then go on to give the subject room's init desc in one step?  You have to instead give the init desc when defining the room, and separately define its relative location.  The compiler claims that saying 'RoomA is East of RoomB' should work, but you get the dreaded '...appears to say two things are the same' BS compiler error.  IIIIIIIIIS!!!]
The Frozen Stair is a Room. 
The Diamond Throneroom is a Room.
The Treasure of Stillness is a Room.
The Crystal Gardens is a Room.

[declare/define global characters]
[careful with names of characters vs their type -- I originally wanted to say that An Ice Mole is a man in the Ghostly Greeting Chamber.  I figured that man would imply a person who should get the male pronouns.  Then I would refer to the Ice Mole instance via the symbol 'Ice Mole' but this caused a silent failure and things related to Ice Mole simply failed.  Changing the decl to An Ice Molde is a kind of person in the Ghostly Greeting Chamber led to multiple compilation errors, but the main and first one was a confusion of referring to an object by its type rather than name; this made it clear that Inform 7 was only understanding Ice Mole to be a kind of object (a kind of person specifically), and not an instance of an object]
The Ice Mole is a kind of person.
Mr Diggums is an Ice Mole. "An ice mole (who is also a nice mole) snuffles peacefully nearby." 
Mr Diggums is in the Ghostly Greeting Chamber.

[declare/define global trackers]
The Ice Mole Path Index is a number which varies.  The Ice Mole Path Index is 1.

[declare/define global arrays]
The Ice Mole Path is a list of Rooms that varies.
The Party is a List of People which varies.

[now set 'em up]
When play begins:
	[shimmerin maze init]
	add The Frozen Stair to the Ice Mole Path;
	add The Diamond Throneroom to the Ice Mole Path;
	add The Treasure of Stillness to the Ice Mole Path;
	add The Crystal Gardens to the Ice Mole Path;
	[party init]
	[add player to The Party. -- this causes double room desc as the player both goes and is teleported to their own location since they are one of the entries in the party list and we move all such to the player's location.]
	
[global event handling]
After going: [todo: this seems to cause us to enter rooms multiple times?  I get a room desc for both 'yourself' entering a room and for Nuvi entering.  Maybe it's because of the initial desc due to going and then another due to teleporting the player to their current location?  Might be solved easiest just be removing player from the party array and considering them to be a special character.]
	repeat with character running through the Party:
		say "[character] shuffles along after the player.";
		now character is in the location;
	continue the action.

Section 3 - On Global Functions, or Why Can't My Mole Just dig()

To burrow like an ice mole:
	[todo: map mod upon burrowing away]
	advance like an ice mole.
To advance like an ice mole:
	now Mr Diggums is in entry Ice Mole Path Index of the Ice Mole Path;
	[re-check location: the mole will flee if he discovers the player]
	if Mr Diggums is in the location of the Player: [retreat]
		if the location of the Player is the Frozen Stair:
			say "An ice mole slides in on his belly like (?) the most elegant figure skater you've ever seen from the Northwest.  When he sees you, his fur stands on end and he jumps three feet in the air, and then flees back the way he came.";
			[todo: other locations' mole-discovers-player handling a.k.a retreat()]
			retreat like an ice mole;
	otherwise: [actual advancement -- the mole has already moved this turn, so just need to update the next dest] 
		if Ice Mole Path Index is the number of entries in Ice Mole Path:
			now Ice Mole Path Index is 1;
			say "ice mole path index is now [Ice Mole Path Index]";
		otherwise:
			increase Ice Mole Path Index by 1;
			say "ice mole path index is now [Ice Mole Path Index]";
To retreat like an ice mole: 
	[in the case of retreat, the mole has moved but the dest index should not be updated because we have to move him back; given that he only moves clockwise, we just leave his dest index where it is]
	let retreatIndex be 1;
	if Ice Mole Path Index is 1: 
		now retreatIndex is the number of entries in Ice Mole Path;
	otherwise:
		now retreatIndex is Ice Mole Path Index minus 1;
	say "retreat index came out to [retreatIndex].";
	now Mr Diggums is in entry retreatIndex of Ice Mole Path;
	say "ice mole path index is still [Ice Mole Path Index] which points to [entry Ice Mole Path Index of Ice Mole Path] and now Mr Diggums is back in [the location of Mr Diggums]."

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
[todo: relational mapping between other characters and associated affinity values as a property of each character]
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
	add Nuvi to the Party;
	if the topic understood does not include "[negation]":
		say "'Really?!  I thought it was a longshot, honestly, that you would be able to control elemental creativity!  Well, the Council of Animals will be thrilled.'  He does a barrel roll and flits about your head, joyously.  Shame on you for lying to such an innocent creature!";
		[say "prior to unlikely magic, Nuvi's fondness for the player has an amplitude of [player affinity of Nuvi]";]
		now the player affinity of Nuvi is player affinity of Nuvi + 5;
		[say "after unlikely magic, Nuvi's fondness for the player has an amplitude of [player affinity of Nuvi]";]
	otherwise:
		say "His little whiskers droop, and his tophat slides down over his eyes. Pushing it back up into place, he responds, 'Oh.  Well, I can't say I'm surprised that you're not able to control elemental creativity.  We'd always hoped that Humanity, as our sires and kinda sorta ancestor god type of things, would be... I dunno, super-crazy-magic, I guess.  That's a childish assumption, however, and there's surely nothing for children in Fuzziolump!'  His snoot wiggles thoughtfully, and then his whiskers spring up so fast they bounce. 'Ah well!  It is the nature of things to generally be more realistic than we imagine them, unless of course we're actually imagining them into reality.'  He grins at you, as if this was a perfectly normal sentence. 'Come on then, let's go see the Council of Animals anyway -- I'm sure you can help us somehow!  They're off North, beyond the Frosted Forest's edge in the sandy savannah of the Wombat Warrens.'" 
[todo: maybe let the player go where they will and hit a wall when they hit an in-game capability wall (i.e. metroidvania style) -- I kinda hate it when games railroad to the point of breaking immersion, which this kinda does since Nuvi wouldn't wait to speak if he had something so darn important to say.  Speaking of, maybe he should just spit it out as soon as the player arrives.]		
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

A Dryad is a kind of Person.  Willoweave is a Dryad.  "[willoweave basic desc]".  Willoweave can be shy.  Willoweave is shy. [Willoweave is in the Bejeweled Pines. todo: adding Willoweave to a room in the hopes of init'ing her did not help with the meld check in describing the trees.  I'm guessing the problem is that maybe the tree desc rule is compiled at build time and thus the condition is not checked for updated values at runtime?  The analogous example for a lost/found flag in the manual uses an instead of... rule, rather than a to say... rule.] Willoweave can be melded or unmelded.  Willoweave is melded.
Understand "dryad" as Willoweave.
To say willoweave basic desc:
	if Willoweave is shy:
		say "A gorgeous dryad peeks out from a nearby tree, curiously.";
	otherwise:
		say "Willoweave bounces on her rainbow-painted roots enthusiastically, eager to see what's next."
The description of Willoweave is "Emerald green ivy interspersed and accented by soft thistle down serves this dryad like hair, pouring down from her head well past the small of her back.  Soft tawny eyes peer out from a face ever-bright with wonder.  Her skin is the gleaming nut brown of polished oak, and is smoother to the touch than glass.  She has the shape of a human woman carved from wood, save that her feet and hands are more like the roots and branches of trees, respectively.  This has not stopped her from painting the tips of each tendril with whimsical splashes of (mostly contrasting) color.  Being essentially a tree, she wears nothing, but when she catches you examinig her sinuousness, a small carpet of pink hyacinth blooms burst into being on her cheeks and she summons up a modest dusting of moss to cover her torso like a dress.  A very clingy dress.  These seem to fall away on their own over time as her attention flits elsewhere."

A Faerie is a kind of Person. Shimmerin is a Faerie.
The Bejeweled Pines is a room. "[bejeweled pines desc]".  [Shimmerin and Willoweave are here. -- don't want them to show up named immediately]
North of the Atrium Glade is the Bejeweled Pines.
There are Trees in the Bejeweled Pines. "[initial fancy trees desc]". Understand "tree/forest/woods/trees/greenery" as Trees.
There are Glowy Lights in the Bejeweled Pines. "Little soft-glowing lights flit amongst the trees from ornament to ornament, keeping the emphasis and shading dynamic." Understand "glow/light/lights/faeries/faerie" as Glowy Lights.
To say initial fancy trees desc:
	say "the trees here are no less dusted with snow than their fellows you just pushed through, but they have also been festooned with crystal and glass baubles of every conceivable hue."
To say bejeweled pines desc:
	[if bejeweled pines has not been visited:
		say "You stand amongst a dazzling array of colors: [initial fancy trees desc]";
	otherwise:]
		say "You stand amongst a dazzling array of colors: these trees are Fancy."
	[todo: move these descs to handling for closer looks at the trees and lights
	if "shimmerin" is not listed in Thelooo Party:
		say "An especially vibrant lilac light departs from the others, flitting about your head playfully.  As your gaze follows it, you note a pair of brilliant green eyes in a feminine face blinking curiously at you from the bark of a nearby tree.  What you had taken to be an odd crystalline growth on the side of the tree resolves itself to be an amethyst necklace cascading down her decolletage like a waterfall's wildness stilled by the gentling influence of frost."]

[ todo: nope, this doesn't work.  *sigh* I just want to either have anonymous tree objects in the room that the player can examine and are NOT auto-mentioned by the library or just have them mentioned in the desc along with context sensitive action handling as necessary.  Neither of these seems to be a possibility.
After examining anything when the player's command includes "tree" and the player is in the bejeweled pines:]
[The description of the the Trees is "[detailed bejeweled trees desc]". todo: to say... rule doesn't seem to respect Willoweave's melded state?  It always evaluates to false.
To say detailed bejeweled trees desc: ]
Instead of examining the Trees in the Bejeweled Pines:
	[if the location of Willoweave is not the Bejeweled Pines: -- todo: doesn't work?  With this condition I always skip down to the she's not here block, but her location there reports as here.  When the condition is 'is she here' I still skip down to the else block except now the reported location is 'nothing']
	[if the Player cannot see Willoweave:  todo: visibility is a rabbit hole for no reason]
	if Willoweave is melded:
		say "Upon closer inspection of a nearby tree, glittering with tinsel made from filaments of actual silver, you note a pair of brilliant green eyes in a feminine face looking back at you from the bark of a nearby tree!  Wood creaks softly as she leans out from the tree to watch you, blinking curiously.  Now that she has separated herself from the bark somewhat, you can see that a large assortment of the glitz you had taken for light cast by the tree's copious ornaments is actually jewelry.  What you had taken to be an odd crystalline growth on the side of the tree resolves itself to be an amethyst necklace cascading down her decolletage like a waterfall's wildness stilled by the gentling influence of frost.  When you raise your eyes to hers again, you find her arching an eyebrow at you.";
		move Willoweave to the Bejeweled Pines;
		[now Willoweave is not behind the Trees;]
		now Willoweave is unmelded;
	otherwise:
		say "Baubles and glorious gizmos adorn the trees all around this grove.  It may just be you, but they seem to be preening in so far as plants can pose."
		
[todo: other interactions with Willoweave?]
After Answering Willoweave that "[greeting]" for the first time:
	now Willoweave is not shy;
	say "The pretty young dryad cringes away as you focus on her, throwing up an arm of wood smooth as glass to shield herself from your wrath and violence.  After a moment passes peacefully, albeit awkwardly, she lowers her arm and blinks at you in surprise. 'Mother always told us that Outsiders are deadly dangerous things.  You don't seem terribly murderous.'  Her own words lend her courage, and she approaches steadily.  Though she is timid, her bearing pulses with stately confidence.  Adding to her regal aesthetic is a gleaming tiara perched atop the mane of gossamer vines, leaves, and spider silk that form her waist-length hair.  When she reaches you and is still alive, she plants herself well within your personal space and immediately begins a thorough investigation of your squishy person.  'You're so soft!' she giggles delightedly, poking and pinching any exposed flesh she can find on you.  'And you're not very hairy, so I can see so much detail!  Take your clothes off, please.'  She starts to pull at your clothing when Nuvi swoops down and whacks her on the head with his hat.  Her wild mane poofs up of its own accord with a frizz of ivy and thistle down to cushion the blow, but she steps back anyway, thoroughly rebuked.  'Sorry about that; got overexcited.  My name is Willoweave, and I'm ecstatic to meet you!  If I promise not to prod you much without asking first, can I travel with your for a bit?  My sisters are too shy and I always thought strangers were insane and I wanna see everything!'  [paragraph break]Willoweave has inserted herself into the party.";
	add Willoweave to the Party.

Understand "dryad/dryads" as "[dryad subject]".
After answering Nuvi that when the topic understood includes "[dryad subject]":
	say "'Dryads are the keepers of the woods.  They tend the trees, guide their growth, and defend them ferociously.  They don't usually go in for all that finery, but the bejeweled dryads have as curious a sense of style as their trees!'";
	if Willoweave is not listed in the Party:  
		say "Nuvi points a small claw toward a strange pattern along the bark of a nearby willow, whispering, 'Take a closer look at the trees.'";
	otherwise:
		say "Willoweave nods her head fervently along with Nuvi's words."

After answering Nuvi that when the topic understood includes "trees" and the player is in the bejeweled pines:
	say "A sudden grin brightening his whiskery mug, Nuvi explains, 'A small tree effigy fell into this forest long ago, decorated in a similar manner. The trees here were so smitten by the style they demanded to be honored with comparable shinies and lights.  The dryads felt abashed that trees elsewhere were so honored, and strove to worship their charges fittingly.  Unluckily for the glass-blowers and enterprising faeries, the trend did not catch on elsewhere in the forest.'  Flapping down close your ear, his whiskers tickling your cheeks, he whispers,  'The other trees consider these ones a bit gaudy.'  He holds a little paw over his mouth to stifle his giggles.  When his secret laughter knocks his monocle off, he sobers quickly."

[meet Shimmerin]
The description of the Glowy Lights is "Little soft-glowing lights flit amongst the trees from ornament to ornament, keeping the emphasis and shading dynamic."
Instead of examining the Glowy Lights: 
	if we have not examined the Glowy Lights:
		now the description of the Glowy Lights is "Nuvi follows your gaze and pipes up, 'Those are faeries!  They're whimsical little beauties with insatiable curiosity.  They trade their light for secrets, whispered by the woods; little goes on anywhere nearby that isn't witnessed by the trees.'  Each faerie's wings are different colors, like intricate stained glass.  As you watch, a faerie winks at you and performs a graceful series of barrel rolls while the colors of her wings shift and the soft lilac light pulsing off her skin twinkles to produce a mesmerizing chromatic metamorphosis.  She giggles at your awed expression, blows you a kiss, slaps her flank invitingly, and zooms off out of sight through the dense foliage to the East.  A moment later, her slender arm pokes back through and she beckons you to follow her.";
	otherwise:
		if Shimmerin is listed in the Party:
			now the description of the Glowy Lights is "Shimmerin gazes at the other faeries' carefree play with a wistful expression, and looks away when they meet her eyes.  'Can we get on with exploring the forest, please?' she asks, her voice uncharacteristically meek.";
		otherwise:
			now the description of the Glowy Lights is "Noting that they have your attention, the faeries dance while simultaneously flying in complex artisticly synchronized patterns.  You literally cannot stop yourself from clapping appreciatively.";
	continue the action.
			
[After examining when the topic understood includes "light/lights/glow" for the first time:
	say "glow test." -- todo: this approach didn't work.  Is it possible to define handling for examine etc. actions where the topic understood or complete command text includes some pattern?]
[todo: shimmerin maze, off to the east]
[Check going East in the Bejeweled Pines:
	if Shimmerin is not listed in the Party:
		say "Crashing through the frosted pines as gracefully as possible for a fully grown human following a faery no larger than your little finger, you chase after the elusive sphere of lilac light.  Luckily, she's waiting just at the edge of the current clearing every time you make it through an obstacle blocking line of sight to her.  Eventually, you tumble out into a strange vista of minute ruins.";
		[
		now Mr Diggums is in entry Ice Mole Path Index of the Ice Mole Path;
		say "A nice mole can be found in [the location of Mr Diggums].";
		]
	continue the action.]

[todo: this works to assess the location of the mole when the player enters a room in the maze, but it doesn't render nicely (the text here renders above the nice bolded room title and desc boilerplate).  Maybe put this logic as prefix to each room's description in the maze?]
[todo: mole holes -- there are supposed to be map effects when the mole burrows away]
After going in the Fallen Fae Maze:
	if Mr Diggums is in the location:
		if the location is the Frozen Stair:
			say "An ice mole (who is, incidentally, a nice mole) is sniffing at the few valiant flowers poking up through the snow.  When he senses your approach he bellows with a mighty voice that would make a hippopotamus proud, and then dives into the ground just to the side of the marble tile like a breaching porpoise.  Tile cracks and rises for a few yards on a distinctly Southwest heading.";
		say "you found anicemole placeholder in [the location]";
		[common handling of player discovers mole a.k.a burrow()]
		burrow like an ice mole; [todo: how do I pass args to a 'to ...' global fn?]
		[
		now Mr Diggums is in entry Ice Mole Path Index of the Ice Mole Path;
		if Ice Mole Path Index is the number of entries in Ice Mole Path:
			now Ice Mole Path Index is 1;
			say "ice mole path index is now [Ice Mole Path Index]";
		otherwise:
			increase Ice Mole Path Index by 1;
			say "ice mole path index is now [Ice Mole Path Index]";
		]
	otherwise:
		advance like an ice mole;
	continue the action.

The Ghostly Greeting Chamber is a room.  "You stand in the center of what was once a grand antechamber, for certain values of grand: everything, from the fallen grandiose pillars to the rime-encrusted iron skeletons of elaborate furniture is miniature scale relative to you.  It feels a bit like walking into a dollhouse store that a ruination of weather and time have trampled to ghostly memories.  Your faerie friend's face lights up at the sight of you and she flits off through a close copse of pines to the East, leaving a puff of shimmering violet powder in her wake."
East of the Bejeweled Pines is The Ghostly Greeting Chamber.
Check taking in The Ghostly Greeting Chamber:
	if the topic understood includes "powder":
		say "Gently scooping up a bit of the brilliantly glowing faerie powder, you immediately feel a wave of euphoric warmth wash over you.  A compulsion to obey the faerie, to please her at all costs begins to consume you.  The powder glitters independent of the light, sparkling like laughter in a trickster's eye.";
		[todo: increase player affinity for Shimmerin to redonkulous levels, ensuring that certain actions counter to her interests will be costly or impossible for the player later on]
	continue the action.

East of the Ghostly Greeting Chamber is The Frozen Stair. 
The description of the Frozen Stair is "[Frozen Stair desc]."
To say Frozen Stair desc:
	if the Frozen Stair is unvisited:
		say "Carefully hewn marble shows through the blanket of ice and snow, giving the area a feeling of patchy oppulence.  Much of the remaining stonework seems to be ornamental -- a great deal of work seems to have gone into framing the large and once-grandiose sweeping staircase that leads down into a small valley surrounded by icy cliffs.  Gold leaf on every stair adds a curious flair to the shine of sunlight off the slippery rime that flows like a runner carpet all the way down.";
	otherwise:
		say "An ice-slicked sweeping staircase leads Southwest down into a small valley ringed all 'round by iron-gray cliffs that look ready for war in thorned mail of merciless ice.  You surmise the frozen steps should be safe, so long as you climb down slowly (and carefully).  Up a little curving path Northwest you can just make out oddly cultivated-looking shards of colorful crystal.  Through a close copse of snowy pines to the West you can see hints of fallen grandeur.";
	if Shimmerin is not listed in the Party:
		say "You can see your faerie quarry's lilac glow disappearing down the stairs."
	

[ doesn't work for no reason?
Before entering the Ghostly Greeting Chamber for the first time:
	now Mr Diggums is in entry Ice Mole Maze Index of the Shimmerin Maze;
	say "And again, a nice mole can be found in [the location of Mr Diggums].";
	continue the action.
]

Release along with a website, an interpreter