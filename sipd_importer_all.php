<?php
ini_set('max_execution_time',99999999999);
require_once('Client.php');

//konfigurasi aplikasi
define('DAERAH','nttprov');
define('HOST','localhost');
define('USERDB','root');
define('PASSDB','');
define('DBNAME','db_sipd_2021');

$username='admin';
$password='admin';
$cookie="";
$tahun='2021';
$path='budget';
/* path =  /plan/ atau /budget/ */
/**------------------------- **/
$client=new Client();

$conn=new mysqli(HOST,USERDB,PASSDB,DBNAME);

if($conn->connect_error)
    die("Tidak dapat terhubung ke database : ".$conn->connect_error);

$conn->close();
$t=time();
  //login aplikasi
  //Ambil token
  $timeDebug=starttime();
  awal:
	tulis("Bismillah..."); 
	$url="https://".DAERAH.".sipd.kemendagri.go.id/daerah";
    echo "Ambil data token...\n";
    $data=$client->get($url);
    $cookie=$client->cookie($data['header']);
    $token=$client->token($data['content']);
    echo 'Token : '. $token."\n";
    $param="_token=".$token."&env=main&region=daerah&skrim=".base64_encode("user_name=".$username."&user_password=".$password);
    echo "Login ke SIPD...\n";
    $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/login";
    $data=$client->post($url,$param,$cookie);
    $result=json_decode($data['content']);
    if($result->result=="success"){
        $id_daerah=$result->id_daerah;
        $id_user=$result->id_user;
        tulis("Message : ".$result->message);
        
        //Import Visi RPJMD
        delete('sipd_visi');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-rpjmd/".$tahun."/visi/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;
            $sql="insert into sipd_visi values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data VISI : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import Visi selesai\n";
		
		//Import Misi RPJMD
        delete('sipd_misi');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-rpjmd/".$tahun."/misi/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_misi values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data Misi : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import Misi selesai\n";
		
		//Import Tujuan RPJMD
        delete('sipd_tujuan');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-rpjmd/".$tahun."/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_tujuan values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data Tujuan : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import Tujuan selesai\n";	
		
		//Import sasaran RPJMD
        delete('sipd_sasaran');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-rpjmd/".$tahun."/sasaran/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_sasaran values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sasaran : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import Sasaran selesai\n";
		
		//Import strategi RPJMD
        delete('sipd_strategi');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-rpjmd/".$tahun."/strategi/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_strategi values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data strategi : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import strategi selesai\n";	
		
		//Import kebijakan RPJMD
        delete('sipd_kebijakan');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-rpjmd/".$tahun."/kebijakan/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_kebijakan values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data kebijakan : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import kebijakan selesai\n";
		
		//Import Bidang Urusan
        delete('sipd_urusan');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/urusan/".$tahun."/tampil-urusan/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_master_urusan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_bidang_urusan,
                    $row->tahun,
                    $row->id_daerah,
                    $row->id_urusan,
                    $row->id_fungsi,
                    $row->kode_urusan,
                    $row->nama_urusan,
                    $row->kode_bidang_urusan,
                    $row->nama_bidang_urusan,
                    $row->id_unik,
                    $row->is_locked,
                    $row->created_user,
                    $row->created_at,                                      
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_master_urusan : '.$row->id_bidang_urusan.' '.$row->id_urusan.' '.$row->nama_urusan.' '.$row->nama_bidang_urusan);
        }
		echo "import urusan selesai\n";
		
		//Import master program
        delete('sipd_master_program');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/program/".$tahun."/tampil-program/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_master_program values(?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_urusan,
                    $row->kode_urusan,
                    $row->nama_urusan,
                    $row->id_bidang_urusan,
                    $row->kode_bidang_urusan,
                    $row->nama_bidang_urusan,
                    $row->id_program,
                    $row->kode_program,
                    $row->nama_program,                    
                    $row->is_locked,                                  
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_master_program : '.$row->id_bidang_urusan.' '.$row->id_urusan.' '.$row->nama_urusan.' '.$row->nama_bidang_urusan);
        }
		echo "import program selesai\n";
		
		//Import sipd_master_kegiatan_subk
        delete('sipd_master_kegiatan_subk');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/plan/subgiat/".$tahun."/tampil-sub-giat/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;			
            $sql="insert into sipd_master_kegiatan_subk values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_urusan,
                    $row->kode_urusan,
                    $row->nama_urusan,
                    $row->id_bidang_urusan,
                    $row->kode_bidang_urusan,
                    $row->nama_bidang_urusan,
                    $row->id_program,
                    $row->kode_program,
                    $row->nama_program,
                    $row->id_giat,
                    $row->kode_giat,
                    $row->nama_giat,
                    $row->id_sub_giat,
                    $row->kode_sub_giat,
                    $row->nama_sub_giat,                    
                    $row->is_locked,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_master_kegiatan_subk : '.$row->id_bidang_urusan.' '.$row->id_urusan.' '.$row->nama_urusan.' '.$row->nama_bidang_urusan);
            
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/plan/subgiat/".$tahun."/tampil-skpd/".$id_daerah."/0?idsubbl=".$row->id_sub_giat;
            $data=$client->get($url,$cookie);
            $dkeg=json_decode($data['content'])->data;            
            $d=0;
            foreach($dkeg as $opdkeg){
				$d++;
				$sql="insert ignore into sipd_master_opd_kegiatan_subk values(?,?,?,?,?)";
				$param=[$row->id_sub_giat,
						$opdkeg->id_skpd,
						$opdkeg->kode_skpd,
						$opdkeg->nama_skpd,						                   
						$opdkeg->is_deleted];
				insert($sql,$param);				
				tulis('['.$d.'] Tambah data OPD sipd_master_opd_kegiatan_subk : '.$row->id_sub_giat.' '.$opdkeg->id_skpd.' '.$opdkeg->nama_skpd);
			}
        }
		echo "import sipd_master_kegiatan_subk selesai\n";	
		
		//Import sipd_prioritas
        delete('sipd_prioritas');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-prioritas/".$tahun."/kokab/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_prioritas values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,                                     
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_prioritas : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import sipd_prioritas selesai\n";	
		
		//Import sipd_kamus_tag
        delete('sipd_kamus_tag');        
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-tag/".$tahun."/prop/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_kamus_tag values(?,?,?,?)";
            $param=[$row->id_kamus,
                    $row->uraian_teks,
                    $row->is_locked,                                     
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_kamus_tag : '.$row->id_kamus.' '.$row->uraian_teks);
        }
		echo "import sipd_kamus_tag selesai\n";	
		
		//Import sipd_master sumberdana
        delete('sipd_master_sumberdana');   
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/dana/".$tahun."/tampil-dana/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_master_sumberdana values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_dana,
					$row->tahun,
					$row->id_daerah,
					$row->kode_dana,
                    $row->nama_dana,
                    $row->id_unik,                                                         
                    $row->is_locked,
                    $row->set_input,
                    $row->created_user,                    
                    $row->created_at,
                    $row->created_ip,
                    $row->updated_user,
                    $row->updated_at,
                    $row->updated_ip,                    
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_master_sumberdana : '.$row->id_dana.' '.$row->nama_dana);
        }
		echo "import sipd_master_sumberdana selesai\n";	
		
		//Import Master Rekening / Akun
        delete('sipd_master_rekening');          
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/akun/".$tahun."/tampil-akun/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert into sipd_master_rekening values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_akun,
                    $row->tahun,
                    $row->id_daerah,
                    $row->kode_akun,
                    $row->nama_akun,
                    $row->is_pendapatan,                    
                    $row->is_bl,
                    $row->is_pembiayaan,
                    $row->id_unik,
                    $row->is_locked,
                    $row->set_input,
                    $row->created_user,
                    $row->created_at,
                    $row->created_ip,
                    $row->updated_user,
                    $row->updated_at,
                    $row->updated_ip,
                    $row->set_lokus,
                    $row->is_gaji_asn,
                    $row->is_barjas,
                    $row->is_bunga,
                    $row->is_subsidi,
                    $row->is_bagi_hasil,
                    $row->is_bankeu_umum,
                    $row->is_bankeu_khusus,
                    $row->is_btt,
                    $row->is_hibah_brg,
                    $row->is_hibah_uang,
                    $row->is_sosial_brg,
                    $row->is_sosial_uang,
                    $row->is_bos,
                    $row->is_modal_tanah,
                    $row->status,
                    $row->belanja];
            insert($sql,$param);                        
            tulis('['.$i.'] Tambah data AKUN sipd_master_rekening : '.$row->id_akun.' '.$row->nama_akun);
        }
		echo "import sipd_master_rekening / Akun selesai\n";
		
		//Import Stadart Harga
		$ssh=[1,2,3,4];
        delete('sipd_ssh'); 
        delete('sipd_ssh_akun'); 
        foreach($ssh as $no){
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/komponen/".$tahun."/".$no."/tampil-komponen/".$id_daerah."/0";        
            $data=$client->get($url,$cookie);
            $json=json_decode($data['content'])->data;
            $i=0;
            foreach($json as $row){
				$i++;					
                $sql="insert ignore into sipd_ssh values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                $param=[$row->kode_kel_standar_harga,
                        substr($row->nama_kel_standar_harga,18),
                        $row->id_standar_harga,
                        $row->kode_standar_harga,                        
                        $row->nama_standar_harga,
                        $row->spek,
                        $row->satuan,
                        $row->harga,
                        $row->harga_2,
                        $row->harga_3,                        
                        $row->is_locked,
                        $row->is_deleted,
                        $row->created_user,
                        $row->created_at,
                        $row->updated_user,
                        $row->updated_at,
                        $row->kelompok,
                        $row->ket_teks];
                insert($sql,$param);                
                tulis('['.$i.'] Tambah data sipd_ssh : '.$row->id_standar_harga.' '.$row->nama_standar_harga);                
                $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/komponen/".$tahun."/".$no."/tampil-komponen-akun/".$id_daerah."/0/".$row->id_standar_harga;
				$data=$client->get($url,$cookie);
				$sdet=json_decode($data['content'])->data;
				if (is_array($sdet) || is_object($sdet)){
					$d=0;
					foreach($sdet as $rdet){
					$d++;	
						$sql="insert ignore into sipd_ssh_akun values(?,?,?,?)";
						$param=[$row->id_standar_harga,
								$rdet->id_akun,
								$rdet->kode_akun,
								substr($rdet->nama_akun,17)];
						insert($sql,$param);
						tulis('['.$d.'] Tambah data sipd_ssh_akun : '.$row->id_standar_harga.' '.$rdet->id_akun.' '.$rdet->nama_akun);
					}
				}
            }            
        }
		echo "import Stadart Harga selesai\n";
		
		//Import sipd_jadwal
        delete('sipd_jadwal');    
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/jadwal/".$tahun."/tampil-jadwal/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;	
            $sql="insert ignore into sipd_jadwal values(?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_jadwal,
                    $row->id_tahap,
                    $row->nama_tahap,                                     
                    $row->nama_sub_tahap,
                    $row->tipe_tahap,                    
                    $row->is_locked,
                    $row->is_public,
                    $row->waktumulai,
                    $row->waktuselesai,                    
                    $row->setstatus];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_jadwal : '.$row->nama_tahap.' '.$row->nama_sub_tahap);            
        }
		echo "import sipd_jadwal selesai\n";
		
		//Import sipd_unit
        delete('sipd_unit');        
        delete('sipd_unit_detail');
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/skpd/".$tahun."/tampil-skpd/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_unit values(?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_unit,
                    $row->id_skpd,
                    $row->kode_skpd,                                     
                    $row->nama_skpd,
                    $row->kunci_skpd,
                    $row->id_setup_unit,
                    $row->is_skpd,
                    $row->posisi,
                    $row->status];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_unit : '.$row->id_unit.' '.$row->nama_skpd);
            
            $url = "https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/skpd/".$tahun."/detil-skpd/".$id_daerah."/0";
            $param = "_token=".$token."&idskpd=".$row->id_skpd;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if($op){
					$sql="insert ignore into sipd_unit_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->bidur_1,
							$op->bidur_2,
							$op->bidur_3,                                     
							$op->kodeunit,
							$op->kode_skpd_1,
							$op->kode_skpd_2,
							$op->namaunit,
							$op->komisi,
							$op->namakepala,
							$op->nipkepala,
							$op->pangkatkepala,
							$op->statuskepala,
							$op->namabendahara,
							$op->nipbendahara,
							$op->isskpd,
							$op->idinduk,
							$op->setupunit,
							$op->ispendapatan];
					insert($sql,$param);					
					tulis('Tambah data sipd_unit_detail : '.$op->namaunit.' '.$op->namakepala.' '.$op->nipkepala);
			}
			
			$url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/skpd/tampil/".$id_daerah."/".$row->id_unit;
				$data=$client->get($url,$cookie);
				$json=json_decode($data['content'])->data;				
				$i=0;
				foreach($json as $uopd){	
				$i++;							
					$sql="insert ignore into sipd_user_unit values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$row->id_unit,
							$uopd->id_user,							
							$uopd->login_name,
							$uopd->nama_user,
							$uopd->nip,
							$uopd->id_level,                                                         
							$uopd->akses_user,
							$uopd->jabatan,                    
							$uopd->is_locked,
							$uopd->is_login,                    
							$uopd->nama_bidang,                    
							$uopd->status,
							$uopd->akses];
					insert($sql,$param);					
					tulis('['.$i.'] Tambah data sipd_user_unit : '.$row->id_unit.' '.$uopd->id_user.' '.$uopd->nama_user.' '.$uopd->jabatan);            
				}
            
        }
		echo "import sipd_unit dan sipd_user_unit selesai\n";
		
		//Import sipd_rpjmd
        delete('sipd_rmpjd');                
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/rpjmd/".$tahun."/tampil-rpjmd/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_rpjmd values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_rpjmd,
                    $row->visi_teks,
                    $row->misi_teks,                                     
                    $row->tujuan_teks,
                    $row->sasaran_teks,
                    $row->strategi_teks,
                    $row->kebijakan_teks,
                    $row->id_bidang_urusan,
                    $row->kode_bidang_urusan,
                    $row->nama_bidang_urusan,
                    $row->id_program,
                    $row->kode_program,
                    $row->nama_program,
                    $row->indikator,
                    $row->target_1,
                    $row->target_2,
                    $row->target_3,
                    $row->target_4,
                    $row->target_5,
                    $row->pagu_1,
                    $row->pagu_2,
                    $row->pagu_3,
                    $row->pagu_4,
                    $row->pagu_5,
                    $row->kode_skpd,
                    $row->nama_skpd,
                    $row->satuan];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_rpjmd : '.$row->id_rpjmd.' '.$row->nama_skpd);            
        }
		echo "import sipd_rpjmd selesai\n";	
		
		//Import sipd_renstra
        delete('sipd_renstra');                
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/renstra/".$tahun."/tampil-renstra/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_renstra values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_renstra,
                    $row->visi_teks,
                    $row->misi_teks,                                     
                    $row->tujuan_teks,
                    $row->sasaran_teks,
                    $row->strategi_teks,
                    $row->kebijakan_teks,
                    $row->id_bidang_urusan,
                    $row->kode_bidang_urusan,
                    $row->nama_bidang_urusan,
                    $row->id_program,
                    $row->kode_program,
                    $row->nama_program,
                    $row->outcome,
                    $row->id_rpjmd,
                    $row->id_giat,
                    $row->kode_giat,
                    $row->nama_giat,
                    $row->indikator,
                    $row->target_1,
                    $row->target_2,
                    $row->target_3,
                    $row->target_4,
                    $row->target_5,
                    $row->pagu_1,
                    $row->pagu_2,
                    $row->pagu_3,
                    $row->pagu_4,
                    $row->pagu_5,
                    $row->satuan,
                    $row->id_sub_giat,
                    $row->kode_sub_giat,
                    $row->nama_sub_giat,
                    $row->indikator_sub,
                    $row->target_sub_1,
                    $row->target_sub_2,
                    $row->target_sub_3,
                    $row->target_sub_4,
                    $row->target_sub_5,
                    $row->pagu_sub_1,
                    $row->pagu_sub_2,
                    $row->pagu_sub_3,
                    $row->pagu_sub_4,
                    $row->pagu_sub_5,
                    $row->satuan_sub,
                    $row->id_unit,
                    $row->kode_skpd,
                    $row->nama_skpd,
                    $row->is_locked];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_renstra : '.$row->id_renstra.' '.$row->nama_sub_giat);            
        }
		echo "import sipd_renstra selesai\n";	
		
		//Import sipd_belanja
        delete('sipd_blopd');  
        delete('sipd_blkeg'); 
        delete('sipd_blkeg_databl'); 
        delete('sipd_blkeg_indikator_prog'); 
        delete('sipd_blkeg_indikator_hasil_keg'); 
        delete('sipd_blkeg_indikator_keg'); 
        delete('sipd_blkeg_sumberdana'); 
        delete('sipd_blkeg_indikator_sub_keg');          
        delete('sipd_blrinc');                                 
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/belanja/".$tahun."/giat/tampil-unit/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;        
        $i=0;
        foreach($json as $row){	
		$i++;		
			$namaskpd = substr($row->nama_skpd->nama_skpd,23);			
            $sql="insert into sipd_blopd values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_daerah,
                    $row->tahun,
                    $row->id_unit,
                    $row->id_skpd,
                    $row->kode_skpd,
                    $namaskpd,
                    $row->is_skpd,
                    $row->id_jadwal,
                    $row->total_giat,
                    $row->set_pagu_giat,
                    $row->set_pagu_skpd,
                    $row->pagu_giat,
                    $row->rinci_giat,
                    $row->kunci_bl,
                    $row->kunci_bl_rinci,
                    $row->totalgiat,
                    $row->batasanpagu,
                    $row->nilaipagu,
                    $row->nilaipagumurni,
                    $row->nilairincian,
                    $row->realisasi,
                    $row->kuncibl,
                    $row->kunciblrinci];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah Data Belanja OPD : '.$row->nama_skpd->nama_skpd.'  '.($row->nilaipagu!==null)?$row->nilaipagu:0);            
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/belanja/".$tahun."/giat/tampil-giat/".$id_daerah."/".$row->id_skpd;
            $data=$client->get($url,$cookie);
            $jkeg=json_decode($data['content'])->data;
            $k=0;
            foreach($jkeg as $rkeg){				
			$k++;
				$namask = substr($rkeg->nama_sub_giat->nama_sub_giat,16);
				$namak = substr($rkeg->nama_giat->nama_giat,13);
				$namakk = explode("||",$namak);
				
                $sql="insert ignore into sipd_blkeg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                $param=[$rkeg->id_jadwal,
						$rkeg->id_daerah,
                        $rkeg->tahun,
                        $rkeg->id_unit,
                        $rkeg->id_skpd,
                        $rkeg->kode_skpd,
                        substr($rkeg->nama_skpd,6),
                        $rkeg->id_urusan,
                        $rkeg->kode_urusan,
                        substr($rkeg->nama_urusan,2),
                        $rkeg->id_bidang_urusan,
                        $rkeg->kode_bidang_urusan,
                        substr($rkeg->nama_bidang_urusan,4),
                        $rkeg->id_sub_skpd,
                        $rkeg->kode_sub_skpd,
                        $rkeg->nama_sub_skpd,
                        $rkeg->id_program,
                        $rkeg->kode_program,
                        substr($rkeg->nama_program,7),
                        $rkeg->id_giat,
                        $rkeg->kode_giat,
                        $namakk,
                        $rkeg->pagu_giat,
                        $rkeg->rinci_giat,
                        $rkeg->id_sub_giat,
                        $rkeg->kode_sub_giat,
                        $namask,
                        $rkeg->pagu,
                        $rkeg->pagu_indikatif,
                        $rkeg->rincian,
                        $rkeg->kode_bl,
                        $rkeg->kode_sbl,
                        $rkeg->usul_asmas,
                        $rkeg->usul_reses,
                        $rkeg->stat_usul->stat_asmas,
                        $rkeg->stat_usul->stat_reses];
                insert($sql,$param);
                tulis('['.$k.'] Tambah Data Sub Kegiatan : '.$rkeg->nama_sub_giat->nama_sub_giat.' '.$rkeg->pagu);
                                
                $url = "https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/belanja/".$tahun."/giat/detil-giat/".$id_daerah."/".$row->id_skpd;
				$param = "_token=".$token."&kodesbl=".$rkeg->kode_sbl;				
				$data=$client->post($url,$param,$cookie);								
				$ikeg=json_decode($data['content'],true);
				
				if (is_array($ikeg) || is_object($ikeg)){
					$i=0;
					foreach ($ikeg['dataBl'] as $dataBl) {											
					$i++;
						$sql="insert ignore into sipd_blkeg_databl values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						$param=[$dataBl['kode_bl'],
								$dataBl['kode_sbl'],
								$dataBl['id_skpd'],
								$dataBl['id_sub_skpd'],
								$dataBl['nama_sub_skpd'],
								$dataBl['id_giat'],
								$dataBl['nama_giat'],
								$dataBl['kode_giat'],
								$dataBl['no_giat'],
								$dataBl['id_sub_giat'],								
								substr($dataBl['nama_sub_giat'],15),
								$dataBl['kode_sub_giat'],
								$dataBl['no_sub_giat'],
								$dataBl['id_urusan'],
								$dataBl['kode_urusan'],
								$dataBl['nama_urusan'],								
								$dataBl['id_bidang_urusan'],
								$dataBl['kode_bidang_urusan'],
								$dataBl['nama_bidang_urusan'],								
								$dataBl['id_program'],
								$dataBl['kode_program'],
								$dataBl['nama_program'],
								$dataBl['no_program'],
								$dataBl['waktu_awal'],
								$dataBl['waktu_akhir'],
								$dataBl['sasaran'],
								$dataBl['id_unik_sub_bl'],
								$dataBl['pagu'],
								$dataBl['output_sub_giat'],
								$dataBl['id_label_pusat'],
								$dataBl['label_pusat'],
								$dataBl['id_label_prov'],
								$dataBl['label_prov'],
								$dataBl['id_label_kokab'],
								$dataBl['label_kokab'],
								$dataBl['id_rpjmd'],
								$dataBl['indikator'],
								$dataBl['satuan'],
								$dataBl['target_1'],
								$dataBl['target_2'],
								$dataBl['target_3'],
								$dataBl['target_4'],
								$dataBl['target_5'],
								$dataBl['pagu_n_lalu'],
								$dataBl['pagu_n_depan']];
						insert($sql,$param);
						tulis('['.$i.'] Tambah Data sipd_blkeg_databl : '.$dataBl['no_sub_giat'].' '.$dataBl['nama_sub_giat']);
						
						//indikator program
						if (is_array($ikeg['dataCapaian']) || is_object($ikeg['dataCapaian'])){
							$ip=0;
							foreach ($ikeg['dataCapaian'] as $dc) {	
								$ip++;
								$sql="insert ignore into sipd_blkeg_indikator_prog values(?,?,?,?,?,?)";
								$param=[$dataBl['kode_bl'],
										$dataBl['kode_sbl'],
										$dc['capaianteks'],
										$dc['targetcapaian'],
										$dc['satuancapaian'],									
										$dc['targetcapaianteks']];							
								insert($sql,$param);
								tulis('['.$ip.'] Tambah Data Indikator Program : '.$dc['capaianteks'].' '.$dc['targetcapaianteks']);
							}
						}
						
						//indikator Keluaran Kegiatan
						if (is_array($ikeg['dataOutputGiat']) || is_object($ikeg['dataOutputGiat'])){
							$ik=0;
							foreach ($ikeg['dataOutputGiat'] as $ki) {	
								$ik++;
								$sql="insert ignore into sipd_blkeg_indikator_keg values(?,?,?,?,?,?)";
								$param=[$dataBl['kode_bl'],
										$dataBl['kode_sbl'],
										$ki['outputteks'],
										$ki['targetoutput'],
										$ki['satuanoutput'],									
										$ki['targetoutputteks']];							
								insert($sql,$param);
								tulis('['.$ik.'] Tambah Data Indikator Keluaran Kegiatan : '.$ki['outputteks'].' '.$ki['targetoutputteks']);
							}
						}
						
						//indikator Hasil Kegiatan
						if (is_array($ikeg['dataHasil']) || is_object($ikeg['dataHasil'])){
							$ih=0;
							foreach ($ikeg['dataHasil'] as $dh) {	
								$ih++;
								$sql="insert into sipd_blkeg_indikator_hasil_keg values(?,?,?,?,?,?)";
								$param=[$dataBl['kode_bl'],
										$dataBl['kode_sbl'],
										$dh['hasilteks'],
										$dh['targethasil'],
										$dh['satuanhasil'],									
										$dh['targethasilteks']];							
								insert($sql,$param);
								tulis('['.$ih.'] Tambah Data Indikator Hasil Kegiatan : '.$dh['hasilteks'].' '.$dh['targethasilteks']);
							}
						}
						
						//indikator Sub Kegiatan
						if (is_array($ikeg['dataOutput']) || is_object($ikeg['dataOutput'])){
							$is=0;
							foreach ($ikeg['dataOutput'] as $kh) {	
								$is++;
								$sql="insert ignore into sipd_blkeg_indikator_sub_keg values(?,?,?,?,?,?,?)";
								$param=[$dataBl['kode_bl'],
										$dataBl['kode_sbl'],
										$kh['outputteks'],
										$kh['targetoutput'],
										$kh['satuanoutput'],									
										$kh['targetoutputteks'],
										$kh['idoutputbl']];							
								insert($sql,$param);
								tulis('['.$is.'] Tambah Data Indikator Sub Kegiatan : '.$kh['idoutputbl'].' '.$kh['outputteks'].' '.$kh['targetoutputteks']);
							}
						}
						
						//Sumber Dana Kegiatan
						if (is_array($ikeg['dataDana']) || is_object($ikeg['dataDana'])){
							$idd=0;
							foreach ($ikeg['dataDana'] as $dn) {	
								$idd++;
								$sql="insert into sipd_blkeg_sumberdana values(?,?,?,?,?,?,?)";
								$param=[$dataBl['kode_bl'],
										$dataBl['kode_sbl'],
										$dn['iddanasubbl'],
										$dn['iddana'],
										$dn['kodedana'],									
										$dn['namadana'],
										$dn['pagudana']];							
								insert($sql,$param);
								tulis('['.$idd.'] Tambah Data Sumberdana Kegiatan : '.$dn['iddanasubbl'].' '.$dn['kodedana'].' '.$dn['namadana']);
							}
						}						
					}
				}	
				$url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/belanja/".$tahun."/rinci/tampil-rincian/".$id_daerah."/".$row->id_skpd."?kodesbl=".$rkeg->kode_sbl;
                $data=$client->get($url,$cookie);
                $jdet=json_decode($data['content'])->data;
                $dk=0;
                foreach($jdet as $rdet){
				$dk++;					
                    $param=[$rdet->id_jadwal,
							$rdet->id_daerah,
                            $rdet->tahun,
                            $rdet->id_unit,
                            $rdet->id_skpd,
                            $rdet->kode_skpd,
                            $rdet->nama_skpd,
                            $rdet->id_urusan,
                            $rdet->kode_urusan,
                            $rdet->nama_urusan,
                            $rdet->id_bidang_urusan,
                            $rdet->kode_bidang_urusan,
                            $rdet->nama_bidang_urusan,
                            $rdet->id_sub_skpd,
                            $rdet->kode_sub_skpd,
                            $rdet->nama_sub_skpd,
                            $rdet->id_program,
                            $rdet->kode_program,
                            $rdet->nama_program,
                            $rdet->id_giat,
                            $rdet->kode_giat,
                            $rdet->nama_giat,
                            $rdet->id_sub_giat,
                            $rdet->kode_sub_giat,
                            $rdet->nama_sub_giat,
                            $rdet->pagu,
                            $rdet->id_akun,
                            $rdet->kode_akun,
                            $rdet->nama_akun,
                            $rdet->lokus_akun_teks,
                            $rdet->jenis_bl,
                            $rdet->is_paket,
                            $rdet->subs_bl_teks,
                            $rdet->ket_bl_teks,
                            $rdet->id_standar_harga,
                            $rdet->kode_standar_harga,
                            $rdet->nama_standar_harga->nama_komponen,
                            $rdet->satuan,
                            $rdet->spek,
                            $rdet->rincian,
                            $rdet->pajak,
                            $rdet->volume,
                            $rdet->harga_satuan,
                            $rdet->koefisien,
                            $rdet->vol_1,
                            $rdet->sat_1,
                            $rdet->vol_2,
                            $rdet->sat_2,
                            $rdet->vol_3,
                            $rdet->sat_3,
                            $rdet->vol_4,
                            $rdet->sat_4,
                            $rdet->id_rinci_sub_bl,
                            $rdet->totalpajak,
                            $rdet->pajakmurni];
                    $sql="insert ignore into sipd_blrinc values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    insert($sql,$param);                    
                    tulis('['.$dk.'] Tambah Data Belanja Sub Kegiatan : '.$rdet->nama_akun.' '.$rdet->nama_standar_harga->nama_komponen.' '.$rdet->volume.' '.$rdet->satuan.' '.$rdet->rincian);
                }
                
			}
        }
		echo "import Data Belanja OPD selesai\n";	
		
		//Ambil data Pendapatan OPD
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/pembiayaan/".$tahun."/ang/pengeluaran/tampil-unit/".$id_daerah."/0";        
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        delete('sipd_pembiayaan');
        delete('sipd_pembiayaan_detail');
        foreach($json as $row){	
				
				$sql="insert ignore into sipd_pembiayaan values(?,?,?,?,?,?)";
                $param=[$row->id_unit,
                        $row->id_skpd,
                        $row->kode_skpd,
                        substr($row->nama_skpd->nama_skpd,22),                        
                        $row->nilaitotal,
                        $row->nilaimurni];
                insert($sql,$param);
				tulis("Insert Data sipd_pembiayaan : ".$row->id_unit.' '.$row->nama_skpd->nama_skpd);
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/pembiayaan/".$tahun."/ang/pengeluaran/tampil-pembiayaan/".$id_daerah."/".$row->id_skpd;
            $data=$client->get($url,$cookie);
            $jkeg=json_decode($data['content'])->data;
            $p=0;
            foreach($jkeg as $rkeg){
				$p++;
                $sql="insert ignore into sipd_pembiayaan_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                $param=[$rkeg->id_pembiayaan,
                        $row->id_unit,
                        $row->id_skpd,
                        $row->kode_skpd,
                        $row->nama_skpd->nama_skpd,
                        $rkeg->kode_akun,
                        $rkeg->nama_akun,                        
                        $rkeg->uraian,
                        $rkeg->keterangan,
                        $rkeg->skpd_koordinator,
                        $rkeg->urusan_koordinator,
                        $rkeg->program_koordinator,
                        $rkeg->total,
                        $rkeg->created_user,
                        $rkeg->createddate,
                        $rkeg->createdtime,
                        $rkeg->updated_user,
                        $rkeg->updateddate,
                        $rkeg->updatedtime,
                        $rkeg->action,
                        $rkeg->rekening,
                        $rkeg->user1,
                        $rkeg->user2,
                        $rkeg->nilaimurni,
                        'pengeluaran'];
                insert($sql,$param);
                tulis("Insert Data pengeluaran : ".$rkeg->nama_akun.' '.$rkeg->total);
                tulis('['.$p.'] Tambah  Data penerimaan : '.$rkeg->nama_akun.' '.$rkeg->total); 
            } 
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/pembiayaan/".$tahun."/ang/penerimaan/tampil-pembiayaan/".$id_daerah."/".$row->id_skpd;
            $data=$client->get($url,$cookie);
            $pkeg=json_decode($data['content'])->data;
            $i=0;
            foreach($pkeg as $rkeg){
				$i++;				
                $sql="insert ignore into sipd_pembiayaan_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                $param=[$rkeg->id_pembiayaan,
                        $row->id_unit,
                        $row->id_skpd,
                        $row->kode_skpd,
                        $row->nama_skpd->nama_skpd,
                        $rkeg->kode_akun,
                        $rkeg->nama_akun,                        
                        $rkeg->uraian,
                        $rkeg->keterangan,
                        $rkeg->skpd_koordinator,
                        $rkeg->urusan_koordinator,
                        $rkeg->program_koordinator,
                        $rkeg->total,
                        $rkeg->created_user,
                        $rkeg->createddate,
                        $rkeg->createdtime,
                        $rkeg->updated_user,
                        $rkeg->updateddate,
                        $rkeg->updatedtime,
                        $rkeg->action,
                        $rkeg->rekening,
                        $rkeg->user1,
                        $rkeg->user2,
                        $rkeg->nilaimurni,
                        'penerimaan'];
                insert($sql,$param);                                
                tulis('['.$i.'] Tambah  Data penerimaan : '.$rkeg->nama_akun.' '.$rkeg->total); 
            }      
        }
		echo "import Data pengeluaran selesai\n";
		
		//Ambil data Pendapatan OPD
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/pendapatan/".$tahun."/ang/tampil-unit/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        delete('sipd_pendapatan');
        delete('sipd_pendapatan_detail');
        foreach($json as $row){				
            $sqlp="insert ignore into sipd_pendapatan values(?,?,?,?,?,?)";
            $param=[$row->id_unit,
                    $row->id_skpd,
                    $row->kode_skpd,
                    substr($row->nama_skpd->nama_skpd,22),
                    $row->nilaitotal,
                    $row->nilaimurni];
            insert($sqlp,$param);
            tulis("Insert Data Pendapatan OPD : ".$row->nama_skpd->nama_skpd.' '.($row->nilaitotal!==null ?$row->nilaitotal:0));
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/pendapatan/".$tahun."/ang/tampil-pendapatan/".$id_daerah."/".$row->id_skpd;
            $data=$client->get($url,$cookie);
            $jkeg=json_decode($data['content'])->data;
            foreach($jkeg as $rkeg){				
                $sql="insert ignore into sipd_pendapatan_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                $param=[$rkeg->id_pendapatan,
                        $row->id_unit,
                        $row->id_skpd,
                        $row->kode_skpd,
                        substr($row->nama_skpd->nama_skpd,22),
                        $rkeg->kode_akun,
                        $rkeg->nama_akun,                        
                        $rkeg->uraian,
                        $rkeg->keterangan,
                        $rkeg->skpd_koordinator,
                        $rkeg->urusan_koordinator,
                        $rkeg->program_koordinator,
                        $rkeg->total,
                        $rkeg->created_user,
                        $rkeg->createddate,
                        $rkeg->createdtime,
                        $rkeg->updated_user,
                        $rkeg->updateddate,
                        $rkeg->updatedtime,
                        $rkeg->action,
                        $rkeg->rekening,
                        $rkeg->user1,
                        $rkeg->user2,
                        $rkeg->nilaimurni];
                insert($sql,$param);
                Tulis("Insert Data Sub Pendapatan : ".$rkeg->nama_akun.' '.$rkeg->total);
            }
        }
		echo "import Data pengeluaran selesai\n";
		
		//Import sipd_kamus_usulan
        delete('sipd_kamus_usulan'); 
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/reses/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;		
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/reses/detil-kamus/".$id_daerah."/0";                       
            $param = "_token=".$token."&idkamus=".$row->id_kamus;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);
            
			if (is_array($op) || is_object($op)){
					$sql="insert ignore into sipd_kamus_usulan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$op->idbidangurusan,
							$row->bidang_urusan,
							$row->id_program,
							$op->kodeprogram,
							$op->namaprogram,
							$row->giat_teks,
							$row->pekerjaan,                                                         
							$row->kelompok,
							$row->satuan,
							$row->anggaran,
							$row->id_unit,
							$op->idskpd,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->output_teks,
							$row->outcome_teks,
							$row->prioritas_teks,
							$row->jenis_profil,
							$row->is_locked,
							'reses'];
					insert($sql,$param);					
					tulis('['.$i.'] Tambah data sipd_kamus_usulan Reses : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/asmas/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $a=0;
        foreach($json as $row){	
		$a++;					
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/asmas/detil-kamus/".$id_daerah."/0";                       
            $param = "_token=".$token."&idkamus=".$row->id_kamus;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
				
					$sql="insert ignore into sipd_kamus_usulan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$op->idbidangurusan,
							$row->bidang_urusan,
							$row->id_program,
							$op->kodeprogram,
							$op->namaprogram,
							$row->giat_teks,
							$row->pekerjaan,                                                         
							$row->kelompok,
							$row->satuan,
							$row->anggaran,
							$row->id_unit,
							$op->idskpd,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->output_teks,
							$row->outcome_teks,
							$row->prioritas_teks,
							$row->jenis_profil,
							$row->is_locked,
							'asmas'];
					insert($sql,$param);
					
					tulis('['.$a.'] Tambah data sipd_kamus_usulan asmas : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
		echo "import sipd_kamus_usulan selesai\n";
		
		//Import sipd_user_tapd
        delete('sipd_user_tapd');        
        delete('sipd_user_tapd_detail');        
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/tapd-admin/tampil/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_user_tapd values(?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_user,
                    $row->login_name,
                    $row->nama_user,                                     
                    $row->nip,
                    $row->akses_user,
                    $row->is_locked,
                    $row->id_level,
                    $row->jabatan,
                    $row->status,
                    $row->akses];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_user_tapd : '.$row->id_user.' '.$row->nama_user);
        }
        
        //Import sipd_user_dewan
        delete('sipd_user_dewan');        
        delete('sipd_user_dewan_detail');           
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/anggota-dewan/tampil/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_user_dewan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_daerah,
					$row->nama_daerah,
					$row->id_user,
                    $row->login_name,
                    $row->nama_user,                                                         
                    $row->is_locked,
                    $row->id_level,
                    $row->id_profil,
                    $row->set_pengusul->jenis_profil,
                    $row->set_pengusul->id_user_profil,
                    $row->nama_teks,
                    $row->fraksi_dewan,
                    $row->dapil,
                    $row->nik,
                    $row->jabatan,                    
                    $row->status,
                    $row->jenis];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_user_dewan : '.$row->id_user.' '.$row->nama_user);
            
            $url = "https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/anggota-dewan/detil/".$id_daerah."/0";
            $param = "_token=".$token."&idxuser=".$row->id_user;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);
			if (is_array($op) || is_object($op)){
				
					$sql="insert into sipd_user_dewan_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->iduser,
							$op->idlevel,
							$op->nip,                                     
							$op->nama,
							$op->loginname,
							$op->idprofil,
							$op->fraksi,
							$op->dapil,
							$op->namapengusul,
							$op->nik,
							$op->alamatteks,
							$op->idkabkota,
							$op->idcamat,
							$op->camatteks,
							$op->idlurah,
							$op->lurahteks,
							$op->npwp,
							$op->notelp,
							$op->emailteks,
							$op->jabatan,
							$op->idlurahpengusul,
							$op->iddaerahpengusul,
							$op->daerahpengusul,
							$op->idlokasidesa,
							$op->lokasidesateks];
					insert($sql,$param);					
					tulis('Tambah data sipd_user_dewan_detail : '.$op->iduser.' '.$op->namapengusul.' '.$op->fraksi);
			}
            
        }
		echo "import sipd_user_dewan_detail selesai\n";	
		
		//Import sipd_user_asmas
        delete('sipd_user_asmas');        
        delete('sipd_user_asmas_detail'); 
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/asmas/tampil/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;
            $sql="insert ignore into sipd_user_asmas values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_daerah,
					$row->nama_daerah,
					$row->id_user,
                    $row->login_name,
                    $row->nama_user,                                                         
                    $row->is_locked,
                    $row->id_level,
                    $row->id_profil,
                    $row->set_pengusul->jenis_profil,
                    $row->set_pengusul->id_user_profil,
                    $row->nama_teks,
                    $row->nik,
                    $row->npwp,
                    $row->id_jenis_profil,
                    $row->alamat_teks,
                    $row->kab_kota,  
                    $row->is_profil_ok,  
                    $row->jabatan,                    
                    $row->status,
                    $row->jenis];
            insert($sql,$param);
            
            tulis('['.$i.'] Tambah data sipd_user_asmas : '.$row->id_user.' '.$row->login_name.' '.$row->nama_user);            
            $url = "https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/asmas/detil/".$id_daerah."/0";
            $param = "_token=".$token."&idxuser=".$row->id_user."&idprofil=".$row->id_profil;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
					$sql="insert ignore into sipd_user_asmas_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->iduser,
							$op->idlevel,
							$op->nip,                                     
							$op->nama,
							$op->loginname,
							$op->idprofil,
							$op->fraksi,
							$op->dapil,
							$op->namapengusul,
							$op->nik,
							$op->alamatteks,
							$op->idkabkota,
							$op->idcamat,
							$op->camatteks,
							$op->idlurah,
							$op->lurahteks,
							$op->npwp,
							$op->notelp,
							$op->emailteks,
							$op->jabatan,
							$op->idlurahpengusul,
							$op->iddaerahpengusul,
							$op->namadaerah,
							$op->aktakumham,
							$op->suratdom,
							$op->sertifikat,
							$op->ijinop,
							$op->foto];
					insert($sql,$param);					
					tulis('Tambah data sipd_user_asmas_detail : '.$op->iduser.' '.$op->namapengusul.' '.$op->nik);
			}
            
        }
		echo "import sipd_user_asmas selesai\n";
		
		//Import sipd_user_keldes
        delete('sipd_user_keldes');        
        delete('sipd_user_keldes_detail');    
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/kel-desa/tampil/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
            $sql="insert ignore into sipd_user_keldes values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $param=[$row->id_lurah,
					$row->kode_lurah,
					$row->lurah_teks,
					$row->id_camat,
                    $row->id_daerah,
                    $row->nama_daerah,                                                         
                    $row->id_user,
                    $row->login_name,
                    $row->nama_user,
                    $row->is_locked,
                    $row->id_level,
                    $row->id_profil,
                    $row->is_desa,
                    $row->camat_teks,
                    $row->kab_kota,
                    $row->jabatan,
                    $row->status,
                    $row->jenis];
            insert($sql,$param);            
            tulis('['.$i.'] Tambah data sipd_user_keldes : '.$row->id_lurah.' '.$row->camat_teks.' '.$row->lurah_teks);            
            $url = "https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/setup-user/".$tahun."/kel-desa/detil/".$id_daerah."/0";
            $param = "_token=".$token."&idxuser=".$row->id_user;            
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){				
					$sql="insert ignore into sipd_user_keldes_detail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->iduser,
							$op->idlevel,
							$op->nip,                                     
							$op->nama,
							$op->loginname,
							$op->idprofil,							
							$op->namapengusul,
							$op->nik,
							$op->alamatteks,
							$op->idkabkota,
							$op->idcamat,
							$op->camatteks,
							$op->idlurah,
							$op->lurahteks,
							$op->npwp,
							$op->notelp,
							$op->emailteks,
							$op->jabatan,
							$op->idlurahpengusul,
							$op->iddaerahpengusul,
							$op->daerahpengusul,
							$op->idlokasidesa,
							$op->lokasidesateks];
					insert($sql,$param);					
					tulis('Tambah data sipd_user_keldes_detail : '.$op->iduser.' '.$op->namapengusul.' '.$op->lurahteks);
			}
            
        }
		echo "import sipd_user_keldes_detail selesai\n";
		
		delete('sipd_kamus_usulan'); 
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/reses/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;					
			
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/reses/detil-kamus/".$id_daerah."/0";                       
            $param = "_token=".$token."&idkamus=".$row->id_kamus;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
					$sql="insert ignore into sipd_kamus_usulan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$op->idbidangurusan,
							$row->bidang_urusan,
							$row->id_program,
							$op->kodeprogram,
							$op->namaprogram,
							$row->giat_teks,
							$row->pekerjaan,                                                         
							$row->kelompok,
							$row->satuan,
							$row->anggaran,
							$row->id_unit,
							$op->idskpd,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->output_teks,
							$row->outcome_teks,
							$row->prioritas_teks,
							$row->jenis_profil,
							$row->is_locked,
							'reses'];
					insert($sql,$param);					
					tulis('['.$i.'] Tambah data sipd_kamus_usulan Reses : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/asmas/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $a=0;
        foreach($json as $row){	
			$a++;					
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/asmas/detil-kamus/".$id_daerah."/0";                       
            $param = "_token=".$token."&idkamus=".$row->id_kamus;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
				
					$sql="insert ignore into sipd_kamus_usulan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$op->idbidangurusan,
							$row->bidang_urusan,
							$row->id_program,
							$op->kodeprogram,
							$op->namaprogram,
							$row->giat_teks,
							$row->pekerjaan,                                                         
							$row->kelompok,
							$row->satuan,
							$row->anggaran,
							$row->id_unit,
							$op->idskpd,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->output_teks,
							$row->outcome_teks,
							$row->prioritas_teks,
							$row->jenis_profil,
							$row->is_locked,
							'asmas'];
					insert($sql,$param);					
					tulis('['.$a.'] Tambah data sipd_kamus_usulan asmas : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
		echo "import sipd_kamus_usulan selesai\n";		
		delete('sipd_kamus_usulan'); 
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/reses/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;								
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/reses/detil-kamus/".$id_daerah."/0";                       
            $param = "_token=".$token."&idkamus=".$row->id_kamus;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
					$sql="insert ignore into sipd_kamus_usulan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$op->idbidangurusan,
							$row->bidang_urusan,
							$row->id_program,
							$op->kodeprogram,
							$op->namaprogram,
							$row->giat_teks,
							$row->pekerjaan,                                                         
							$row->kelompok,
							$row->satuan,
							$row->anggaran,
							$row->id_unit,
							$op->idskpd,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->output_teks,
							$row->outcome_teks,
							$row->prioritas_teks,
							$row->jenis_profil,
							$row->is_locked,
							'reses'];
					insert($sql,$param);					
					tulis('['.$i.'] Tambah data sipd_kamus_usulan Reses : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/asmas/tampil-kamus/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $a=0;
        foreach($json as $row){	
		$a++;					
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/kamus-usulan/".$tahun."/asmas/detil-kamus/".$id_daerah."/0";                       
            $param = "_token=".$token."&idkamus=".$row->id_kamus;
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
				
					$sql="insert ignore into sipd_kamus_usulan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$op->idbidangurusan,
							$row->bidang_urusan,
							$row->id_program,
							$op->kodeprogram,
							$op->namaprogram,
							$row->giat_teks,
							$row->pekerjaan,                                                         
							$row->kelompok,
							$row->satuan,
							$row->anggaran,
							$row->id_unit,
							$op->idskpd,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->output_teks,
							$row->outcome_teks,
							$row->prioritas_teks,
							$row->jenis_profil,
							$row->is_locked,
							'asmas'];
					insert($sql,$param);					
					tulis('['.$a.'] Tambah data sipd_kamus_usulan asmas : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
		echo "import sipd_kamus_usulan selesai\n";
		
		//Import sipd_usulan_reses
        delete('sipd_usulan_reses');         
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/reses/".$tahun."/tampil-monitor/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
			$i++;								
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/reses/".$tahun."/detil-usulan/".$id_daerah."/0";                       
            $param = "_token=".$token."&idusulan=".$row->id_reses;            
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			if (is_array($op) || is_object($op)){
					$sql="insert ignore into sipd_usulan_reses values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$row->id_reses,
							$row->masalah,
							$row->id_usulan,
							$row->id_pengusul,
							$row->pengusul,
							$row->fraksi_dewan,
							$row->id_jenis_usul,
							$row->jenis_usul_teks,
							$row->bidang_urusan,
							$row->id_bidang_urusan,
							$row->giat_teks,
							$row->kelompok,
							$row->lokus_usulan,
							$row->alamat_teks,
							$row->id_kab_kota,
							$row->nama_daerah,
							$row->id_kecamatan,
							$op->camatteks,
							$row->id_kelurahan,
							$op->lurahteks,
							$op->volume,
							$op->anggaran,
							$row->id_unit,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->file_pengantar,
							$row->file_proposal,
							$row->file_rab,
							$row->file_foto,
							$row->created_user,
							$row->created_date,
							$row->status_usul,
							$row->status_usul_teks,
							$row->is_tolak,
							$row->tolak_teks,
							$row->is_batal,
							$row->batal_teks,
							$row->nama_user,
							$row->jenis_belanja,
							$row->satuan,
							$op->latpeta,
							$op->langpeta,
							$op->usulvolume,
							$op->usulanggaran,
							$op->rekomteks,
							$op->setStatusUsul,
							$op->subgiat, 
							$row->rekom_mitra->rekomendasi,
							$row->rekom_mitra->koefisien,
							$row->rekom_mitra->anggaran,
							$row->rekom_setwan->rekomendasi,
							$row->rekom_setwan->koefisien,
							$row->rekom_setwan->anggaran,
							$row->rekom_skpd->rekomendasi,
							$row->rekom_skpd->koefisien,
							$row->rekom_skpd->anggaran,
							$row->rekom_tapd->rekomendasi,
							$row->rekom_tapd->koefisien,
							$row->rekom_tapd->anggaran
							];
					insert($sql,$param);					
					tulis('['.$i.'] Tambah data sipd_usulan_reses : '.$op->idkamus.' '.$row->masalah.' '.$row->nama_skpd);            
			}
            
        }
		echo "import sipd_usulan_reses selesai\n";	
		
		//Import sipd_usulan_asmas
        delete('sipd_usulan_asmas');         
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/asmas/".$tahun."/tampil-monitor/".$id_daerah."/0";
        $data=$client->get($url,$cookie);
        $json=json_decode($data['content'])->data;
        $i=0;
        foreach($json as $row){	
		$i++;								
            $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/main/".$path."/asmas/".$tahun."/detil-usulan/".$id_daerah."/0";                       
            $param = "_token=".$token."&idusulan=".$row->id_usulan;            
            $data=$client->post($url,$param,$cookie);
            $op=json_decode($data['content']);            
			print_r($op);
			exit;
			if (is_array($op) || is_object($op)){
					$sql="insert ignore into sipd_usulan_asmas values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					$param=[$op->idkamus,
							$row->id_usulan,
							$row->masalah,							
							$row->id_pengusul,													
							$row->id_jenis_usul,
							$row->jenis_usul_teks,
							$row->bidang_urusan,
							$row->id_bidang_urusan,
							$row->giat_teks,
							$row->kelompok,
							$row->lokus_usulan,
							$row->alamat_teks,
							$row->id_kab_kota,
							$row->nama_daerah,
							$row->id_kecamatan,
							$op->camatteks,
							$row->id_kelurahan,
							$op->lurahteks,
							$op->usulvolume,
							$op->usulanggaran,
							$row->id_unit,
							$row->kode_skpd,
							$row->nama_skpd,
							$row->file_pengantar,
							$row->file_proposal,
							$row->file_rab,
							$row->file_foto,
							$row->file_foto2,
							$row->file_foto3,
							$row->created_user,
							$row->created-date,
							$row->status_usul,
							$row->status_usulan_teks,
							$row->is_tolak,
							$row->tolak_teks,
							$row->is_batal,
							$row->batal_teks,
							$row->nama_user,
							$row->id_profil,
							$row->nip,
							$row->pengusul,	
							$row->id_jenis_profil,
							$row->jenis_profil,
							$row->rev_skpd,
							$row->jenis_belanja,
							$row->satuan,
							$op->latpeta,
							$op->langpeta,
							$op->usulvolume,
							$op->usulanggaran,
							$op->rekomteks,
							$op->setStatusUsul,
							$op->subgiat, 
							$row->rekom_mitra->rekomendasi,
							$row->rekom_mitra->koefisien,
							$row->rekom_mitra->anggaran,
							$row->rekom_setwan->rekomendasi,
							$row->rekom_setwan->koefisien,
							$row->rekom_setwan->anggaran,
							$row->rekom_skpd->rekomendasi,
							$row->rekom_skpd->koefisien,
							$row->rekom_skpd->anggaran,
							$row->rekom_tapd->rekomendasi,
							$row->rekom_tapd->koefisien,
							$row->rekom_tapd->anggaran
							];
					insert($sql,$param);					
					tulis('['.$i.'] Tambah data sipd_usulan_asmas Asmas : '.$row->id_kamus.' '.$row->giat_teks.' '.$row->nama_skpd);            
			}
            
        }
		echo "import sipd_usulan_asmas selesai\n";	
		
		$endtime=endtime($timeDebug);
		echo "Berhasil Import Data ALL SIPD \n selama $endtime.";
	
	}else if($result->result=="userlogged"){
        tulis("Message : ".$result->message);
        tulis("Reset user id : ".$result->id_user);
        $url="https://".DAERAH.".sipd.kemendagri.go.id/daerah/reset?idu=".base64_encode($result->id_user);
        $client->get($url,$cookie);
        goto awal;
    }else{
        tulis("Message : ".$result->message);
        tulis("Lakukan konfigurasi ulang aplikasi!");
    }
	

function tulis($teks){
    echo $teks;
    echo "\n";
}

function insert($sql,$param){
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DBNAME, USERDB, PASSDB);
    $exec=$pdo->prepare($sql);
    return $exec->execute($param);
}

function delete($tbname){
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DBNAME, USERDB, PASSDB);
    $exec=$pdo->prepare("delete from ".$tbname);
    return $exec->execute();
}

function starttime() {
    $r = explode( ' ', microtime() );
    $r = $r[1] + $r[0];
    return $r;
}

function endtime($starttime) {
    $r = explode( ' ', microtime() );
    $r = $r[1] + $r[0];
    $r = round($r - $starttime,4);
    return ''.$r.' s';
}
