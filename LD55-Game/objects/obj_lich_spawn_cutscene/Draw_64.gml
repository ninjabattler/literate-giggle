/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_cutscene_border, clamp(_border_frame, 0, 48), 1920, 1080, 1, 1, 0, c_black, 1);
draw_sprite_ext(spr_cutscene_border, clamp(_border_frame, 0, 48), 0, 125, -1, 1, 0, c_black, 1);

draw_set_color(global.text_color);
draw_set_font(fnt_griffy_title);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_alpha(_boss_name_opacity);
draw_text(1912, 960, "Bound Minor Lich");
draw_set_alpha(_show_boss_name ? 1 : _boss_name_opacity);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_rectangle(clamp(_boss_name_underline, 1912 - string_width("Bound Minor Lich"), 1912), 947, 1912, 939, false);

draw_set_alpha(1);