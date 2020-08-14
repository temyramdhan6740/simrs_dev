<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-warning box-solid">
                    <div class="box-header">
                        <h3 class="box-title">Detail</h3>
                    </div>
                    <div class="box-body">
                        <table class="table">
	                        <tr><td>Title</td><td><?php echo strtoupper($title); ?></td></tr>
	                        <tr><td>Url</td><td><?php echo base_url().$url; ?></td></tr>
	                        <tr><td>Icon</td><td><i class="<?php echo $icon; ?>"></i> (<?php echo $icon; ?>)</td></tr>
	                        <tr><td>Is Main Menu</td><td><?php echo $is_main_menu; ?></td></tr>
	                        <tr><td>Is Aktif</td><td><?php echo $is_aktif; ?></td></tr>
	                        <tr><td></td><td><a href="<?php echo site_url('kelolamenu') ?>" class="btn btn-default">Cancel</a></td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
        
