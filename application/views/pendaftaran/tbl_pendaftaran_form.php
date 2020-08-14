<style>
tr td {
	padding: 6px;
}
.infoMasukanPasien {
	font-size: 20px;
}
</style>
<div class="content-wrapper">

    <section class="content">
		<div class="col-md-12">
			<div class="box box-default">
				<div class="box-header with-border">
                    <h3 align="center" style="margin:0;padding:8px;">FORM PENDAFTARAN</h3>
                </div>
			</div>
		</div>
        <div class="col-md-6">
            <div class="box box-default">
				<div class="box-body">
					<div class='callout callout-info'><i class='fa fa-info-circle infoMasukanPasien'></i> <i class='pull-right'>Pastikan data pasien sudah terdaftar</i></div>
					<form action="<?php echo $action; ?>" method="post" onLoad="caraMasuk();">

                    <table class=''>        

                        <tr><td width='200'>No Registrasi <?php echo form_error('no_registrasi') ?></td><td><input type="text" class="form-control" name="no_registrasi" id="no_registrasi" readonly="" placeholder="No Registrasi" value="<?php echo noRegOtomatis(); ?>" /></td></tr>
                        <tr><td width='200'>No Rawat <?php echo form_error('no_rawat') ?></td><td><input type="text" class="form-control" name="no_rawat" placeholder="No Rawat" readonly="" value="<?php echo date('Y/m/d/') . noRegOtomatis(); ?>" /></td></tr>
                        <!--<tr><td width='200'>No Rekamedis <?php echo form_error('no_rekamedis') ?></td><td><input type="text" class="form-control" name="no_rekamedis" id="no_rekamedis" placeholder="No Rekamedis" value="<?php echo $no_rekamedis; ?>" /></td></tr>-->
                        <tr><td width='200'>Cara Masuk <?php echo form_error('cara_masuk') ?></td><td>

                                <?php echo form_dropdown('cara_masuk', array('RAWAT INAP' => 'RAWAT INAP', 'RAWAT JALAN' => 'RAWAT JALAN', 'UDG' => 'UGD'), $cara_masuk, array('class' => 'form-control', 'onChange' => 'caraMasuk();', 'id' => 'cara_masuk')); ?>
<!--<input type="text" class="form-control" name="cara_masuk" id="cara_masuk" placeholder="Cara Masuk" value="<?php echo $cara_masuk; ?>" /></td></tr>-->
                        <tr><td>Ruangan Dirawat</td><td><input type="text" id="kode_tempat_tidur" name="kode_tempat_tidur" placeholder="Masukan Kode Tempat Tidur" class="form-control"></td></tr>
                        <tr><td width='200'>Tanggal Daftar <?php echo form_error('tanggal_daftar') ?></td><td><input type="date" class="form-control" name="tanggal_daftar" id="tanggal_daftar" placeholder="Tanggal Daftar" value="<?php echo date('Y-m-d'); ?>" /></td></tr>
                        <!--<tr><td width='200'>Dokter Penanggung Jawab <?php echo form_error('kode_dokter_penanggung_jawab') ?></td><td><input required type="text" class="form-control" name="kode_dokter_penanggung_jawab" id="kode_dokter_penanggung_jawab" placeholder="Masukan Nama Dokter" value="<?php echo $kode_dokter_penanggung_jawab; ?>" /></td></tr>-->
						<tr><td width='200'>Dokter Penanggung Jawab <?php echo form_error('kode_dokter_penanggung_jawab') ?></td><td>
								<?php echo cmb_dinamis_data_before_chained('kode_dokter_penanggung_jawab', 'kode_dokter_penanggung_jawab', 'tbl_dokter', 'nama_dokter', 'kode_dokter', $kode_dokter_penanggung_jawab) ?>
                        <tr><td width='200'>Poliklinik Tujuan <?php echo form_error('id_poli') ?></td><td>
                                <?php echo cmb_dinamis_data_after_chained('id_poli', 'id_poli', 'v_dokter_spesialis', 'nama_poliklinik', 'id_poliklinik', 'kode_dokter', $id_poli) ?>


                                <!--<input type="text" class="form-control" name="id_poli" id="id_poli" placeholder="Id Poli" value="<?php echo $id_poli; ?>" /></td></tr>-->
                        <!--<tr><td width='200'>Nama Penanggung Jawab <?php echo form_error('nama_penanggung_jawab') ?></td><td><input type="text" class="form-control" name="nama_penanggung_jawab" id="nama_penanggung_jawab" placeholder="Nama Penanggung Jawab" value="<?php echo $nama_penanggung_jawab; ?>" /></td></tr>
                        <tr><td width='200'>Hubungan Dengan Penanggung Jawab <?php echo form_error('hubungan_dengan_penanggung_jawab') ?></td><td><input type="text" class="form-control" name="hubungan_dengan_penanggung_jawab" id="hubungan_dengan_penanggung_jawab" placeholder="Hubungan Dengan Penanggung Jawab" value="<?php echo $hubungan_dengan_penanggung_jawab; ?>" /></td></tr>

                        <tr><td width='200'>Alamat Penanggung Jawab <?php echo form_error('alamat_penanggung_jawab') ?></td><td> <textarea class="form-control" rows="3" name="alamat_penanggung_jawab" id="alamat_penanggung_jawab" placeholder="Alamat Penanggung Jawab"><?php echo $alamat_penanggung_jawab; ?></textarea></td></tr>-->



                        
                        <tr><td width='200'>Jenis Bayar <?php echo form_error('id_jenis_bayar') ?></td><td>
                                <?php echo cmb_dinamis('id_jenis_bayar', 'tbl_jenis_bayar', 'jenis_bayar', 'id_jenis_bayar', $id_jenis_bayar) ?>
                                <!--<input type="text" class="form-control" name="id_jenis_bayar" id="id_jenis_bayar" placeholder="Id Jenis Bayar" value="<?php echo $id_jenis_bayar; ?>" />--></td></tr>
                        <tr><td width='200'>Asal Rujukan <?php echo form_error('asal_rujukan') ?></td><td><input required type="text" class="form-control" name="asal_rujukan" id="asal_rujukan" placeholder="Asal Rujukan" value="<?php echo $asal_rujukan; ?>" /></td></tr>
                        <tr><td colspan='2'>
                                <button type="submit" class="btn btn-success btn-flat btn-flat pull-right"><i style='font-size: 25px;' class="fa fa-save"></i> <br/><small><?php echo $button ?></small></button> 
                                <a href="<?php echo site_url('pendaftaran') ?>" class="btn btn-info btn-flat pull-left"><i style='font-size: 25px;' class="fas fa-caret-square-left"></i> <br/><small>Kembali</small></a></td></tr>
                    </table>
				</div>					
			</div>

        </div>
        <div class="col-md-6">
            <div class="box box-default">
				<div class="box-body">

                    <table width='100%' class=''>        
                        <tr><td width='200'>No Rekamedis <?php echo form_error('no_rekamedis') ?></td><td><input required type="text" class="form-control" name="no_rekamedis" onkeyup="autocomplate_norekmedis()" id="no_rekamedis" placeholder="Masukan No Rekamedis" value="<?php echo $no_rekamedis; ?>" /></td></tr>
                        <!--<tr><td width='200'>Cara Masuk <?php echo form_error('cara_masuk') ?></td><td><input type="text" class="form-control" name="cara_masuk" id="cara_masuk" placeholder="Cara Masuk" value="<?php echo $cara_masuk; ?>" /></td></tr>-->
                        <!--<tr><td width='200'>Tanggal Daftar <?php echo form_error('tanggal_daftar') ?></td><td><input type="text" class="form-control" name="tanggal_daftar" id="tanggal_daftar" placeholder="Tanggal Daftar" value="<?php echo $tanggal_daftar; ?>" /></td></tr>
                        <tr><td width='200'>Kode Dokter Penanggung Jawab <?php echo form_error('kode_dokter_penanggung_jawab') ?></td><td><input type="text" class="form-control" name="kode_dokter_penanggung_jawab" id="kode_dokter_penanggung_jawab" placeholder="Kode Dokter Penanggung Jawab" value="<?php echo $kode_dokter_penanggung_jawab; ?>" /></td></tr>
                        <tr><td width='200'>Id Poli <?php echo form_error('id_poli') ?></td><td><input type="text" class="form-control" name="id_poli" id="id_poli" placeholder="Id Poli" value="<?php echo $id_poli; ?>" /></td></tr>-->

                        <tr><td width='200'>Nama Pasien</td><td><input required readonly type="text" name="nama" id="nama_pasien" class="form-control" placeholder="nama pasien"></td></tr>
                        <tr><td>Tanggal Lahir</td><td><input required readonly type="text" name="tanggal_lahir" id="tanggal_lahir" placeholder="tanggal lahir" class="form-control"></td></tr>

                        <tr><td width='200'>Nama Penanggung Jawab <?php echo form_error('nama_penanggung_jawab') ?></td><td><input required type="text" class="form-control" name="nama_penanggung_jawab" id="nama_penanggung_jawab" placeholder="Nama Penanggung Jawab" value="<?php echo $nama_penanggung_jawab; ?>" /></td></tr>
                        <tr><td width='200'>Hubungan Dengan Penanggung Jawab <?php echo form_error('hubungan_dengan_penanggung_jawab') ?></td><td>
                                <?php echo form_dropdown('hubungan_dengan_penanggung_jawab', array('saudara kandung' => 'saudara kandung', 'orang tua' => 'orang tua'), $hubungan_dengan_penanggung_jawab, array('class' => 'form-control')) ?>
                                <!--<input type="text" class="form-control" name="hubungan_dengan_penanggung_jawab" id="hubungan_dengan_penanggung_jawab" placeholder="Hubungan Dengan Penanggung Jawab" value="<?php echo $hubungan_dengan_penanggung_jawab; ?>" />--></td></tr>

                        <tr><td width='200'>Alamat Penanggung Jawab <?php echo form_error('alamat_penanggung_jawab') ?></td><td> <textarea required class="form-control" rows="3" name="alamat_penanggung_jawab" id="alamat_penanggung_jawab" placeholder="Alamat Penanggung Jawab"><?php echo $alamat_penanggung_jawab; ?></textarea></td></tr>
                        <!--<tr><td width='200'>Id Jenis Bayar <?php echo form_error('id_jenis_bayar') ?></td><td><input type="text" class="form-control" name="id_jenis_bayar" id="id_jenis_bayar" placeholder="Id Jenis Bayar" value="<?php echo $id_jenis_bayar; ?>" /></td></tr>
                        <tr><td width='200'>Asal Rujukan <?php echo form_error('asal_rujukan') ?></td><td><input type="text" class="form-control" name="asal_rujukan" id="asal_rujukan" placeholder="Asal Rujukan" value="<?php echo $asal_rujukan; ?>" /></td></tr>-->

                    </table>
				</form>
				</div>
			</div>
        </div>
	</section>
</div>
<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script src="<?php echo base_url('assets/datatables/jquery.dataTables.js') ?>"></script>
<script src="<?php echo base_url('assets/datatables/dataTables.bootstrap.js') ?>"></script>


<script type="text/javascript">
    $(function() {
        //autocomplete
        $("#kode_dokter_penanggung_jawab").autocomplete({
            source: "<?php echo base_url() ?>pendaftaran/autocomplate_dokter",
            minLength: 1
        });
		$("#kode_tempat_tidur").autocomplete({
            source: "<?php echo base_url() ?>pendaftaran/autocomplate_ruangan_dirawat",
            minLength: 1
        });
		$("#id_poli").chained("#kode_dokter_penanggung_jawab");
    });
</script>

<script type="text/javascript">
    function caraMasuk(){
		//var cara_masuk = document.getElementById("cara_masuk");
		var option = document.createElement("option");
		
		//option.text = 'DATA 1';
		//option.text = 'DATA 2';
		
		if (document.getElementById("cara_masuk").value == "RAWAT JALAN") {
			document.getElementById("kode_tempat_tidur").disabled = true;
		}else if (document.getElementById("cara_masuk").value == "RAWAT INAP"){
			//cara_masuk.add(option);
			document.getElementById("kode_tempat_tidur").disabled = false;
		}else{
			document.getElementById("kode_tempat_tidur").disabled = false;
		}
	}
	
    function autocomplate_norekmedis(){
        //autocomplete
        $("#no_rekamedis").autocomplete({
            source: "<?php echo base_url() ?>pendaftaran/autocomplate_no_rekemedis",
            minLength: 1
        });
        autoFill();
    }
    
    function autoFill(){
        var no_rekamedis = $("#no_rekamedis").val();
        $.ajax({
            url: "<?php echo base_url() ?>index.php/pendaftaran/autofill",
            data:"no_rekamedis="+no_rekamedis ,
        }).success(function (data) {
            var json = data,
            obj = JSON.parse(json);
            $('#nama_pasien').val(obj.nama_pasien);
            $('#tanggal_lahir').val(obj.tanggal_lahir);
            //$('#alamat').val(obj.alamat);
        });
    }
</script>