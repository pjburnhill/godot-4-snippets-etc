extends Camera2D

# TileMap to use for bounds
@export var tilemap: TileMap

func _ready():

	# Get TileMap size
	var mapRect = tilemap.get_used_rect()
	var mapTileSize = tilemap.cell_quadrant_size
	var mapSizeInPixels = mapRect.size * mapTileSize

	# Limit camera bounds to TileMap size
	limit_right = mapSizeInPixels.x
	limit_bottom = mapSizeInPixels.y
