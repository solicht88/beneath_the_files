extends Node


var transition_node = preload("res://scenes/transition_animation.tscn")


var opened_files = []
var taken_files = []


var passwords: Array = [
	"scared", "promise", "scatter", "string", "locate", "shrine",
	"mineshaft", "structure", "normality", "gates", "spirit", "indulge",
	"search", "missing", "evening", "morning", "route", "struggle",
	"entrance", "nothing", "mountain", "tunnel", "notice", "coward",
	"darkness", "lurking", "outside", "silence", "observe", "worker",
	"uncover", "places", "regret", "venture", "travel", "walked",
	"light", "arches", "crimson", "sacred", "safety", "magnet", "guilt",
	"stared", "wonder", "closer", "horror", "monster", "pointy",
	"sudden", "object", "curious", "surface", "water", "anyone",
	"scatter", "locate", "bound", "winner", "combine", "health",
	"content", "harmony", "devote", "hunger", "consume", "infest",
	"reactor", "talent", "ready", "viable", "trail", "follow", "shower",
	"crown", "compact", "shrivel", "confine", "manage", "grave",
	"human", "stroll", "kettle", "emotion", "abhorrent", "morrow", "marrow",
	"odious", "avowl", "wretch", "scaffold", "sorrow", "sombre",
	"gaiety", "guard", "block", "front", "courage", "density", "steep",
	"prayer", "loving", "memory", "flush", "paper", "exploit",
	"smooth", "button", "restrain", "cabinet", "flock", "owner",
	"charity", "charge", "instinct", "inside", "effort", "widen",
	"forever", "change", "employ", "stand", "divide", "sandwich",
	"picture", "photo", "overall", "absolute", "authority", "initial",
	"justify", "trivial", "freight", "reservoir", "witness", "practice",
	"contrast", "genuine", "terrify", "miserable", "compliant", "address",
	"painter", "gallery", "explosion", "passion", "birthday", "campfire",
	"arrogant", "gravity", "departure", "strain", "packet", "embrace",
	"medicine", "highway", "illusion", "hiccup", "mistake", "accident",
	"quarrel", "chance", "gamble", "computer", "program", "password",
	"define", "redeem", "entertain", "flower", "jealous", "minimum",
	"clarify", "execution", "legend", "winner", "survivor", "return",
	"skeleton", "listen", "freckle", "honest", "galaxy", "withdraw",
	"inhabitant", "achievement", "transaction", "wander", "implicit",
	"hidden", "secret", "judical", "message", "infinite", "lovely",
	"failure", "reminder", "dialect", "chicken", "research", "employee",
	"training", "eliminate", "penalty", "allocate", "handicap",
	"interrupt", "provision", "pudding", "thoughtful", "reception",
	"memorial", "depressed", "connection", "helpless", "physical",
	"literature", "accompany", "comfortable", "banquet", "sensation",
	"nomination", "photocopy", "confront", "discipline", "traction",
	"ambiguous", "prosecution", "correspond", "consider", "flexible",
	"premium", "continuity", "community", "fateful", "technology",
	"represent", "consensus", "critical", "command", "emphasis",
	"ghostly", "ringing", "alarmed", "minute", "officer", "realism",
	"captive", "rehersal", "lighter", "location", "sensitivity", "ambition",
	"reduce", "material", "companion", "sentence", "boundary", "control",
	"flawless", "terminate", "whimsical", "suggest", "oppress",
	"property", "illustrate", "cemetary", "substantial", "frighten",
	"thankful", "language", "consort", "tasteful", "conscious",
	"exciteful", "spiteful", "purpose", "fascinate", "welcome",
	"saturate", "committee", "sweater", "squeeze", "reverie", "fantasy",
	"cluttered", "operation", "discovery", "continue", "holiday",
	"prohibit", "cumbersome", "whisper", "exchange", "painful", "agony",
	"invention", "wanting", "diminish", "beneath", "quickest", "obedient",
	"merciful", "ruthless", "enchanting", "beneficial", "system",
	"digestion", "delicate", "conspire", "receipt", "balloon", "childlike",
	"adjustment", "aromatic", "separate", "measly", "constrain",
	"plausible", "shorten", "criminal", "obsession", "qutomatic",
	"flowers", "languid", "toothpaste", "endured", "outrageous",
	"incredible", "nervous", "condition", "compromise", "variation",
	"inspector", "composer", "response", "guideline", "constraint",
	"interlude", "prelude", "postlude", "nocturne", "authorise",
	"criticism", "specimen", "hospitality", "recovery", "collection",
	"technique", "distance", "migration", "greeting", "autonomy",
	"living", "platform", "affinity", "expression", "negligence",
	"misplace", "coincidence", "requirement", "conceive", "leadership",
	"aviation", "precision", "argument", "philosophy", "plaintiff",
	"transition", "preference", "classroom", "revulsion", "repulsion",
	"hideous", "atrocious", "motivation", "colleague", "advocate",
	"atmosphere", "fragment", "romantic", "performance", "transform",
	"simplicity", "mystery", "unknown", "redundant", "contrary",
	"parameter", "graduate", "radiation", "rehersal", "dreadful",
	"ordinary", "remainder", "prestige", "ideology", "revolution",
	"feedback", "admiration", "perforate", "butterfly", "convince",
	"reflection", "sentiment", "weather", "earlier", "motion", "review"
]


var shrine = preload("res://assets/imgs/game sprites/Distration/shintoshrine.png")
var monster = preload("res://assets/imgs/game sprites/Distration/monsterdistraction.png")
var entries: Array = [
	"Feb 28, 2000,
	Today is a normal day at the mineshaft. Nothing too crazy, just fixing broken drills and examining the steel supports for any structural failures. Zine has gone missing, nothing to be surprised that punk is always slacking off. I feel sooooo tired today, I want to sleep, but I have night patrol to do. Urgh! That kid better come back or else I’m shutting the gate. 
	
	Alex out.",
	"Feb 29, 2000,
	She hasn't come back, usually she would be back by now, but she hasn't come back yet. Zine is a good kid, although she does indulge in entertainment, she always comes back before sunrise. There is a search party going to look for her in town, but I can’t just do nothing. So I went out searching for her. I went to the pub that she always goes to and asked around if anyone saw her that night. They all shook their heads and mumbled something along the lines of “haven’t.” Zine never made it to the pub
	
	Alex out.",
	"March 1: 9:00 P.M, 2000,
	I went back, following the same route. I haven’t seen any signs of struggle along the road either. Where on earth is she? When I got back, the gate was already closed, but here is the important part: there is actually a secret route that miners take to get back unnoticed. Suddenly remembering that, I walked around the mountains into the back mine shaft entrance.
	
	Alex out.",
	"March 1: 11:50 P.M, 2000,
	As I walked deeper, the light got dimmer and dimmer, and I noticed a glint of light flashing from the branching tunnel. I walked closer and picked the object up and recognized it immediately, it's a Zine wallet. A shiver ran up my spine as my thoughts raced. She has gone to the branching tunnel, but what for? Being the coward I am, I quickly ran back to the camp. I know I should go look for her, but my sixth sense told me that there is something lurking in the darkness.
	
	Alex out.",
	"March 2: 1:00 A.M, 2000,
	The siren sounded. Another 2 people went missing this time. I couldn't sleep, so I went outside and took a walk. As I walked around the grounds, I saw some dark silhouettes coming, upon reflex I dodged behind a large rock and silently observed.
	“Three people are missing now. What on earth are we going to tell the workers?”
	“Nothing of course”
	“Do you think that maybe it is ‘that?’” The second man turned to the first and faced him. He asked coldly, “And what would ‘that’ be?”
	“Y-you know, t-the ‘thing’ that we uncovered”
	“You shouldn’t poke into places that don’t concern you ‘Mr. Derek’” 
	
	Alex out.",
	"March 2: 2:00 A.M, 2000,
	They uncovered something and didn’t tell us. What on earth did they uncover? Before I knew it, my legs took me to the place where I found Zine’s wallet. And this time, there is blood trailed along the wall of the cave too. I could walk away right then and there, but, but something is keeping me… I have to uncover what is in the branching cave. If I don't, then I know that I will regret it for the rest of my life. Going against my good sense, I ventured deeper into the cave.
	
	Alex out.",
	"March 2: 2:30 A.M, 2000,
	I walked and walked until my leg ached, and finally I saw light. As I stepped into the illuminated space, the most magnificent scene presented before my eyes. A shinto shrine with flying red arches and lanterns that faintly glowed in the damp atmosphere. Everything is so quiet and sacred as if I’m in the afterlife, or this is what I would think if not for the disgusting scent of blood in the air. I wanted to run back to safety, but as if there was a magnet, my legs carried me up and deeper.
	
	Alex out.",
	"March 3: 3:25 A.M
	W-what is that? I stared and stared. A lady with a sickly milk coloured face with thick black hair spilling down, covering her face. She is wearing a traditional white kimono with a large red obi. She turned to me. Suddenly, her neck and hand stretched, and it came closer and closer. I could only watch in horror as the monster’s limbs bent and twisted in weird angles. She looks just like Zine, but her teeth are pointy with blood all around her mouth and grinning at me, crazed. I took a step back, but my body wouldn’t budge an inch. “The chosen one,” a raspy voice came from the monster. “Master…Have…Came…Home…” She whispers. Suddenly her entire body shriveled and shifted, and compacted. A singular object dropped in front of me. A USB.
	Alex Out.",
	"April 19th: 11:30 P.M, 2000,
	From that day on, I promised myself that I would never check what the USB contained, but curiosity got the better of me, and I tentatively plugged it into my computer.
	
	Alex out.",
	shrine,
	monster,
	"virus"
]


func _ready():
	entries.shuffle()


func fade_out():
	var transition = transition_node.instantiate()
	add_child(transition)
	transition.get_node("ColorRect").color.a = 255
	
	var player = $transition_animation/AnimationPlayer
	#print("fade out")
	player.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	transition.queue_free()


func fade_in():
	var transition = transition_node.instantiate()
	add_child(transition)
	#print(transition)
	transition.get_node("ColorRect").color.a = 0
	
	var player = $transition_animation/AnimationPlayer
	player.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	transition.queue_free()
