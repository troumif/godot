extends Label


func _process(delta: float) -> void:
	self.text = str(Global.time)


func _on_chrono_timeout() -> void:
	pass # Replace with function body.
	Global.time +=1
