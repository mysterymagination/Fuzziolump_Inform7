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
	
The Atrium Glade is a room. "Only, it's a different world than the one you left.  A cool breeze and the unmistakable smell of pine needles coaxes you to open your eyes.

You find yourself in a wintry forest glade. Evergreen foliage, bearing a light sprinkling of snow such that it resembles sugar-dusted sweets, surrounds you.  The otter, which sports a pair of fluffy brown wings the same shade as its sleek tawny fur, flits about your head, appraisingly.  His little tophat tilts gently back and forth in a hypnotizing pattern, in time with the rhythm of his lazy wing beats."
The Holly Bush is here. "A holly bush rustles thoughtfully in the wind." 
The Sprig of Holly is an object. "A sprig of holly rests nearby.  Sighs of feminine longing and entreaty in a thousand thousand voices whisper on a sudden gust of wind that pushes it gently towards you."
Instead of examining the Holly Bush:
	if the  Sprig of Holly is not in the Atrium Glade:
		say "You examine the nearest frosted greenery, a holly bush whose bright red berries contrast beautifully with the pure white snow.  Brushing a hand over the bush idly, you jump higher than you thought possible when one of its branches extends creakily and a sprig reaches out to pat you right back.  As if taken aback and perhaps chagrined by your startled reaction, the branch withdraws shyly, and the sprig of holly flutters gently to the ground.";
		now the Sprig of Holly is in The Atrium Glade; 
		now the description of The Sprig of Holly is "A shy little memento of the frosted forest, this bit of holly has a single pointy leaf and a single berry the color of a cheerful blush.  Whenever you touch it, a light puff of wind kisses your cheek, carrying the ghost of a flirty giggle."; 
	[apparently anon description assignments are transient -- if I run the bug where looking at the bush always teleports the sprig to the ground, the description is only available when it first enters the environment.  Explicitly looking at the sprig after its first appearance yields default  desc]
	otherwise:
		say "The Holly Bush waves serenely in the languid wind, and at you.  Every now and then it forgets itself and waves against the wind."