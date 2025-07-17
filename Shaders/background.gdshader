shader_type canvas_item;

void vertex() {
	UV.x += TIME * 0.025;
	UV.y -= TIME * 0.025;
}
