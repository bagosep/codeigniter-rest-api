<?php

class SiswaModel extends CI_Model
{
	
	public function getSiswa($nis = null)
	{
		if ($nis == null) {
			return $this->db->get('siswa')->result_array();
		}
		else{
			return $this->db->get_where('siswa', ['nis' => $nis])->result_array();
		}
	}

	public function deleteSiswa($nis)
	{
		$this->db->delete('siswa', ['nis' => $nis]);
		return $this->db->affected_rows();
	}

	public function createSiswa($data)
	{
		$this->db->insert('siswa', $data);
		return $this->db->affected_rows();
	}

	public function updateSiswa($data, $nis)
	{
		$this->db->update('siswa', $data, ['nis' => $nis]);
		return $this->db->affected_rows();
	}
}