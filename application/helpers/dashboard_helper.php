<?php
function widgetMainMenu()
{
	$ci = get_instance();
	$query = $ci->db->query("SELECT * FROM tbl_menu WHERE is_main_menu = '0' AND is_aktif = 'y' AND id_menu != 19 AND id_menu != 30 AND id_menu != 35 AND id_menu != 22");
	return $query;
}
function widgetMainMenuCountNumber($id)
{
	$ci = get_instance();
	$query = $ci->db->query("SELECT * FROM ".$id)->num_rows();
	return $query;
}
function widgetSubMenu()
{
	$ci = get_instance();
	$query = $ci->db->query("SELECT * FROM tbl_menu WHERE id_menu = '19' OR id_menu = '30' OR id_menu = '35'");
	return $query;
}
function widgetSubMenuChild($id)
{
	$ci = get_instance();
	$query = $ci->db->query("SELECT * FROM tbl_menu WHERE is_main_menu = '".$id."'");
	return $query;
}
?>