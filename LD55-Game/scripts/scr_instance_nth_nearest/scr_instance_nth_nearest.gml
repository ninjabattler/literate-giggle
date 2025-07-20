/// @func   instance_nth_nearest(x, y, obj, n)
///
/// @desc   Returns the nth nearest object instance to a given point.
///         If none is found, noone is returned.
///
/// @param  {real}      x           x-coordinate of point
/// @param  {real}      y           y-coordinate of point
/// @param  {object}    obj         object index (or all)
/// @param  {real}      n           proximity
///
/// @return {instance}  object instance found (or noone)
///
/// GMLscripts.com/license
 
function instance_nth_nearest(x, y, obj, n)
{
    n = clamp(n, 1, instance_number(obj));
    var list = ds_priority_create();
    var nearest = noone;
    with (obj) ds_priority_add(list, id, distance_to_point(x, y));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}