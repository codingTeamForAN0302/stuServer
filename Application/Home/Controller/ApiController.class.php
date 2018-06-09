<?php
namespace Home\Controller;
use Home\Model;
use Think\Controller;
class ApiController extends Controller {
    public function index(){
    	echo 'this is index';	
    }

    public function students(){
    	$stus = M('student')->select();

		foreach ($stus as &$value) {
		  $value['avatar'] = C('SITE_URL').C('IMAGE_PATH').$value['avatar'];
		}
    	$this->ajaxReturn($stus);
    }

    public function detail(){
    	$stuId = I('id');

    	$where = array(
    		'id' => $stuId
    	);

    	$target_stu = M('student')->where($where)->find();

    	$record_where = array(
    		'stu_id' => $stuId
    	);
    	$stu_records = M('record')->where($record_where)->order('term_id')->select();

    	foreach ($stu_records as &$record) {
    		$course_where['id'] = $record['course_id'];
		  	$record['course_name'] = M('course')->where($course_where)->find()['name']; 

		  	$term_where['id'] = $record['term_id'];
		  	$record['term_name'] = M('term')->where($term_where)->find()['name']; 
		}
    	$target_stu['avatar'] = C('SITE_URL').C('IMAGE_PATH').$target_stu['avatar'];
    	$target_stu['records'] = $stu_records;
    	$this->ajaxReturn($target_stu);
    }

    public function updateInfo(){
    	$stuId = I('id');
    	$stuSex = I('sex');
    	$stuName = I('name');
    	$stuAge = I('age');	

    	$data = [];
		$data['id'] = $stuId;
		$data['sex'] = $stuSex;
		$data['name'] = $stuName;
		$data['age'] = $stuAge;

    	$ret = M('student')->save($data);

    	$msg['success'] = true;
    	$msg['msg'] = 'update info success!';
    	$this->ajaxReturn($msg);
    }

    public function updateScore(){
    	$recordId = I('id');
    	$mark = I('mark');

    	$data = [];
		$data['id'] = $recordId;
		$data['mark'] = $mark;

    	$ret = M('record')->save($data);

    	$msg['success'] = true;
    	$msg['msg'] = 'update score success!';
    	$this->ajaxReturn($msg);
    }

}