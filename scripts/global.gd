extends Node


var transition_node = preload("res://scenes/transition_animation.tscn")


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


var entries: Array = []


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
