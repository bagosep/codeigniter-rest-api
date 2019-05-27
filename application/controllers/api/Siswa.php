<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Siswa extends REST_Controller
{
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('SiswaModel');

	}

	public function index_get()
	{
		$nis = $this->get('nis');
		if ($nis == null) {
			$siswa = $this->SiswaModel->getSiswa();
		}
		else{
			$siswa = $this->SiswaModel->getSiswa($nis);
		}

		if ($siswa) {
			$this->response([
	                'status' => true,
	                'data' => $siswa
	            ], REST_Controller::HTTP_OK);
		}
		else{
			$this->response([
	                'status' => false,
	                'message' => 'Nis tidak ada'
	            ], REST_Controller::HTTP_NOT_FOUND);
		}
	}

	public function index_delete()
	{
		$nis = $this->delete('nis');

		if ($nis === null) {
			$this->response([
	                'status' => false,
	                'message' => 'Berikan saya Nis'
	            ], REST_Controller::HTTP_BAD_REQUEST);
		} else{
 			if ($this->SiswaModel->deleteSiswa($nis)) {
 				$this->response([
	                'status' => true,
	                'nis'  => $nis,
	                'message' => 'Deleted.'
	            ], REST_Controller::HTTP_NO_CONTENT);
 			}
 			else{
 				$this->response([
	                'status' => false,
	                'message' => 'Nis not found'
	            ], REST_Controller::HTTP_BAD_REQUEST);
 			}
		}
	}

	public function index_post()
	{
		$data = [
			'nis' => $this->post('nis'),
			'nama_siswa' => $this->post('nama_siswa'),
			'jenis_kelamin_siswa' => $this->post('jenis_kelamin_siswa'),
			'alamat_siswa' => $this->post('alamat_siswa'),
			'tgl_lahir_siswa' => $this->post('tgl_lahir_siswa')
		];

		if ($this->SiswaModel->createSiswa($data) > 0) {
			$this->response([
                'status' => true,
                'message' => 'Tambah Siswa Sukses.'
            ], REST_Controller::HTTP_CREATED);
		} else{
			$this->response([
	            'status' => false,
	            'message' => 'Gagal menambah data siswa'
	        ], REST_Controller::HTTP_BAD_REQUEST);
		}
	}

	public function index_put()
	{
		$nis = $this->put('nis');

		$data = [
			'nama_siswa' => $this->put('nama_siswa'),
			'jenis_kelamin_siswa' => $this->put('jenis_kelamin_siswa'),
			'alamat_siswa' => $this->put('alamat_siswa'),
			'tgl_lahir_siswa' => $this->put('tgl_lahir_siswa')
		];

		if ($this->SiswaModel->updateSiswa($data, $nis) > 0) {
			$this->response([
                'status' => true,
                'message' => 'Update Siswa Sukses.'
            ], REST_Controller::HTTP_OK);
		} else{
			$this->response([
	            'status' => false,
	            'message' => 'Gagal meng update data siswa'
	        ], REST_Controller::HTTP_BAD_REQUEST);
		}

	}
}