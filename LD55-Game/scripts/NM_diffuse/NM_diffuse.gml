/// @description NM_diffuse(add)
/// @param add
function NM_diffuse(argument0) {
	if argument0
	{
		if (!surface_exists(NMdif))
		{
			NMdif = surface_create(room_width/2, room_height/2);
		}
		surface_set_target(NMdif)
		global.renderPass = RP_DIFFUSE;
	}
	else
	{
	    surface_reset_target()
	}


}
