extends State

@export var move_state: GoblinMoveState = null
@onready var walk_timer: Timer = $WalkTimer


func _ready() -> void:
	walk_timer.timeout.connect(on_walk_timer_timeout)


func on_enter(params: StateParams) -> void:
	state_machine.change_animation("walk")
	walk_timer.start()


func on_exit() -> void:
	walk_timer.stop()


func physics_process(delta: float) -> void:
	move_state.physics_process(delta)


func on_walk_timer_timeout() -> void:
	state_machine.transition_to("Idle")
