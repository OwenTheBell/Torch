class_name InteractReceiver extends Node

signal on_interact

@export var interact_description: String

var enabled: bool = true

var _executor: InteractExecutor

func interact():
  on_interact.emit()


func entered_executor(executor: InteractExecutor):
  _executor = executor
  if enabled:
    executor.add_receiver(self)


func exited_executor(executor: InteractExecutor):
  _executor = null
  executor.remove_receiver(self)


func enable():
  if not enabled and is_instance_valid(_executor):
    _executor.add_receiver(self)
  enabled = true


func disable():
  if enabled and is_instance_valid(_executor):
    _executor.remove_receiver(self)
  enabled = false