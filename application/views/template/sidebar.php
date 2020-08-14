<section class="sidebar">
    <!-- search form -->
    <div align="center" style="padding-top: 12px; padding-bottom: 20px;">
    <img class="img-circle" src="<?=base_url();?>assets/foto_profil/<?=getInfoRS('logo');?>" width="64" height="auto" />
    <h4 style="color: white; font-weight: bold;"><?=getInfoRS('nama_rumah_sakit');?></h4>
    </div>
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
       
        <li style='font-size:12px'>
            <a href="<?=base_url();?>">
                <i class='fa fa-home'></i> <span><?=strtoupper('Dashboard');?></span>
			</a>
		</li>
        <?php
        // display all data main menu
        $this->db->where('is_main_menu',0);
        $this->db->where('is_aktif','y');
        $main_menu = $this->db->get('tbl_menu')->result();
        
        foreach ($main_menu as $menu){
            // chek is have sub menu
            $this->db->where('is_main_menu',$menu->id_menu);
            $this->db->where('is_aktif','y');
            $submenu = $this->db->get('tbl_menu');
            if($submenu->num_rows()>0){
                // display sub menu
                echo "<li class='treeview' style='font-size:12px'>
                        <a href='#'>
                            <i class='$menu->icon'></i> <span>".strtoupper($menu->title)."</span>
                            <span class='pull-right-container'>
                                <i class='fa fa-angle-left pull-right'></i>
                            </span>
                        </a>
                        <ul class='treeview-menu' style='display: none;'>";
                        foreach ($submenu->result() as $sub){
                            echo "<li>".anchor($sub->url,"<i class='$sub->icon'></i> <span style='font-size:12px'>".strtoupper($sub->title))."</span></li>"; 
                        }
                        echo" </ul>
                    </li>";
            }else{
                // display main menu
                echo "<li style='font-size:12px'>";
                echo anchor($menu->url,"<i class='".$menu->icon."'></i> ".strtoupper($menu->title));
                echo "</li>";
            }
        }
        ?>
        <li style='font-size:12px'><?php echo anchor('auth/logout',"<i class='fa fa-sign-out'></i> LOGOUT");?></li>
    </ul>
</section>
<!-- /.sidebar -->