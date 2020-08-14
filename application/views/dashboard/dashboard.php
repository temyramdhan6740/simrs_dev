<style>
.formAlert{ background: #0073B7; color: white; transition: 0.3s; }
.formAlert:hover{ background: #00a65a; }  
</style>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
				<div class="box" style="border:0">
					<div class="box-body">
						<div class="row">
							<div class="col-xs-2">
								<img class="img-thumbnail" style="border:0" src="<?=base_url();?>assets/foto_profil/<?=getInfoRS('logo');?>" width="128" height="auto" />
							</div>
							
							<div class="col-xs-9" align="center">
								<label style="font-size: 20px; padding-top: 18px;"><?=getInfoRS('nama_rumah_sakit');?></label><br/>
								<i style="font-size: 12px;">
									<?=getInfoRS('alamat');?>
									<?=getInfoRS('kabupaten');?>, <?=getInfoRS('propinsi');?>
								</i><br/>
								<span style="font-size: 12px;"><i class="fa fa-phone"></i> <?=getInfoRS('no_telpon');?></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<hr/>
								<div class="nav-tabs-custom">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#dashboard" data-toggle="tab">DASHBOARD</a></li>
										<?php foreach(widgetSubMenu()->result() as $W) { ?>
										<li><a href="#<?=$W->id_menu;?>" data-toggle="tab"><?=strtoupper($W->title);?></a></li>
										<?php } ?>
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="dashboard">
											<div class="row">
												<div class="col-md-6 hvr-icon-buzz" style="cursor:pointer" onClick="document.location='<?=base_url();?>pendaftaran/create'">
													<div class="alert col-md-12 formAlert" align="center">
														<div class="col-md-2">
															<i class="fa fa-notes-medical hvr-icon" style="font-size: 30px;"></i><br/>
														</div>
														<div class="col-md-9" align="left">
															<label style="padding-top: 5px;">FORM PENDAFTARAN</label><br/>
														</div>
													</div>
												</div>
												<div class="col-md-6 hvr-icon-buzz" style="cursor:pointer" onClick="document.location='<?=base_url();?>pasien/create'">
													<div class="alert col-md-12 formAlert" align="center">
														<div class="col-md-2">
															<i class="fa fa-notes-medical hvr-icon" style="font-size: 30px;"></i><br/>
														</div>
														<div class="col-md-9" align="left">
															<label style="padding-top: 5px;">FORM PASIEN</label><br/>
														</div>
													</div>
												</div>
												<div class="col-md-12"><hr style="margin-top:0;padding:0;"/></div>
												<?php foreach(widgetMainMenu()->result() as $W) { ?>
												<div class="col-xs-6 col-md-3 hvr-icon-buzz">
													<div class="alert bg-blue" align="center">
														<i class="<?=$W->icon;?> hvr-icon" style="font-size: 30px;"></i><br/>
														<label style="padding-top: 12px;"><?=strtoupper($W->title);?></label><br/>
														<h2 style="margin:0;"><?=number_format(widgetMainMenuCountNumber($W->tabel));?></h2>
													</div>
												</div>
												<?php } ?>
											</div>
										</div>
										<?php foreach(widgetSubMenu()->result() as $W) { ?>
										<div class="tab-pane" id="<?=$W->id_menu;?>">
											<div class="row">
												<?php foreach(widgetSubMenuChild($W->id_menu)->result() as $WC) { ?>
												<div class="col-xs-6 col-md-3">
													<div class="alert bg-blue" align="center">
														<i class="<?=$WC->icon;?>" style="font-size: 30px;"></i><br/>
														<label style="padding-top: 12px;"><?=strtoupper($WC->title);?></label><br/>
													</div>
												</div>
												<?php } ?>
											</div>
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
		</div>
	</section>
</div>