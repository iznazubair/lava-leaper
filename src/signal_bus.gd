extends Node
# this script keeps track of all damage taken signals across the level
# and allows the UI to respond accordingly

signal on_health_changed(node : Node, amount_changed : int)

