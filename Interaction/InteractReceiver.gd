class_name InteractReceiver extends Node

signal on_interact

@export var interact_description: String

var _executor: InteractExecutor

func interact():
  on_interact.emit()


func entered_executor(executor: InteractExecutor):
  _executor = executor
  executor.add_receiver(self)
  pass


func exited_executor(executor: InteractExecutor):
  executor.remove_receiver(self)
  pass