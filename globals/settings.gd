extends Node

const default_camera_zoom = 0.7
const default_window_size = Vector2(1024, 600)

var _prev_window_size
var _prev_window_minimized
var _prev_window_maximized
var _prev_window_fullscreen

var camera_zoom setget _set_camera_zoom, _get_camera_zoom
var window_size setget _set_window_size, _get_window_size
var window_minimized setget _set_window_minimized, _get_window_minimized
var window_maximized setget _set_window_maximized, _get_window_maximized
var window_fullscreen setget _set_window_fullscreen, _get_window_fullscreen

## vars used by settings window
var temp_window_type_id = 0
var temp_vsync_enabled = true
var temp_window_size = Vector2(1024, 600)

signal camera_zoom_changed
signal window_size_changed(prev, now)
signal window_minimized_changed(value)
signal window_maximized_changed(value)
signal window_fullscreen_changed(value)

func _ready():
	camera_zoom = default_camera_zoom
	_prev_window_size = OS.window_size
	_prev_window_minimized = OS.window_minimized
	_prev_window_maximized = OS.window_maximized
	_prev_window_fullscreen = OS.window_fullscreen

func _set_camera_zoom(value):
	camera_zoom = value
	emit_signal("camera_zoom_changed", value)

func _get_camera_zoom():
	return camera_zoom

func _set_window_size(value):
	_prev_window_size = OS.window_size
	OS.window_size = value
	emit_signal("window_size_changed", _prev_window_size, value)

func _get_window_size():
	return OS.window_size

func _set_window_minimized(value):
	_prev_window_minimized = OS.window_minimized
	OS.window_minimized = value
	emit_signal("window_minimized_changed", value)

func _get_window_minimized():
	return OS.window_minimized

func _set_window_maximized(value):
	_prev_window_maximized = OS.window_maximized
	OS.window_maximized = value
	emit_signal("window_maximized_changed", value)

func _get_window_maximized():
	return OS.window_maximized

func _set_window_fullscreen(value):
	_prev_window_fullscreen = OS.window_fullscreen
	OS.window_fullscreen = value
	emit_signal("window_fullscreen_changed", value)

func _get_window_fullscreen():
	return OS.window_fullscreen

func _process(delta):
	if OS.window_size != _prev_window_size:
		emit_signal("window_size_changed", _prev_window_size, OS.window_size)
	
	if OS.window_minimized != _prev_window_minimized:
		emit_signal("window_minimized_changed", OS.window_minimized)
	
	if OS.window_maximized != _prev_window_maximized:
		emit_signal("window_maximized_changed", OS.window_maximized)
	
	if OS.window_fullscreen != _prev_window_fullscreen:
		emit_signal("window_fullscreen_changed", OS.window_fullscreen)
	
	_prev_window_size = OS.window_size
	_prev_window_minimized = OS.window_minimized
	_prev_window_maximized = OS.window_maximized
	_prev_window_fullscreen = OS.window_fullscreen