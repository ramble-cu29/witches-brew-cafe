extends Node

@onready var music: AudioStreamPlayer = $BackgroundMusic
@onready var ambience: AudioStreamPlayer = $BackgroundAmbience
@export var music_volume_db: float = -2.0
@export var pause_between_loops: float= 60.0
@export var ambience_fade_in_seconds: float = 8.0
@export var ambience_target_volume_db: float = -3.0
@export var ambience_start_volume_db: float = -40.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_music_loop()
	play_ambience_loop()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func play_music_loop() -> void:
	while true:
		music.volume_db = music_volume_db
		music.play()
		
		await music.finished
		
		await get_tree().create_timer(pause_between_loops).timeout
	
		
func play_ambience_loop() -> void:
		ambience.volume_db = ambience_start_volume_db
		ambience.play()
		var tween: Tween = create_tween()
		tween.tween_property(
			ambience,
			"volume_db",
			ambience_target_volume_db,
			ambience_fade_in_seconds
		)
		await ambience.finished
		
 
