///Room Start Event for objPlayer

//Create a new occluder that the player will use to block light
//occluder = new BulbDynamicOccluder(obj_light_controller.renderer);

////Move the occluder on top of the player
//occluder.x = x;
//occluder.y = y;

////Define a simple rectangular occluder that fits the bounding box of the player's sprite
////Note that edge coordinates are relative to the occluder's x/y position
////N.B. Don't forget to give objPlayer a sprite otherwise this code won't work!
//occluder.AddEdge(bbox_left+16  - x, bbox_top+16    - y, bbox_right-16 - x, bbox_top+16    - y);
//occluder.AddEdge(bbox_right-16 - x, bbox_top+16    - y, bbox_right-16 - x, bbox_bottom-16 - y);
//occluder.AddEdge(bbox_right-16 - x, bbox_bottom-16 - y, bbox_left+16  - x, bbox_bottom-16 - y);
//occluder.AddEdge(bbox_left+16  - x, bbox_bottom-16 - y, bbox_left+16  - x, bbox_top+16    - y);