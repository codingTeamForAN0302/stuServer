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

    	$target_stu = M('student')->where($where)->select();
    	$target_stu['avatar'] = C('SITE_URL').C('IMAGE_PATH').$target_stu['avatar'];
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