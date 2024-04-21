var numLights = ds_list_size(dynamicLights);
if (numLights > 0)
{
	var light = dynamicLights[| numLights -1];
	instance_destroy(light);
	ds_list_delete(dynamicLights, numLights -1);
}
