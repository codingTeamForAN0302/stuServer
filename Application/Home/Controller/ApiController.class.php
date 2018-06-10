<?php
namespace Home\Controller;
use Home\Model;
use Think\Controller;
class ApiController extends Controller {
    public function index(){
    	echo 'this is api';	
    }

    public function chart(){
    	echo 'this is index';

    	$female_where = array(
    		'sex' => 2, 
    	);


    	$male_where = array(
    		'sex' => 1, 
    	);
    	$chart['female'] =  M('student')->where($female_where)->count();
    	$chart['male'] =  M('student')->where($male_where)->count();
    	$chart['success'] =  true;

    	$this->ajaxReturn($chart);
    }
    
    

    public function students(){
    	$stus = M('student')->select();

		foreach ($stus as &$value) {
		  $value['avatar'] = C('SITE_URL').C('IMAGE_PATH').$value['avatar'];


    	//班级名
    	$class_where = array(
    		'id' => $value['class_id']
    	);
    	$stu_class = M('class')->where($class_where)->find();
    	$value['class_name'] = $stu_class['classname'];

    	//专业名
    	$major_where = array(
    		'id' => $stu_class['major_id']
    	);

    	$stu_major = M('major')->where($major_where)->find();
    	$value['major_name'] = $stu_major['major_name'];


    	//学院名
    	$school_where = array(
    		'id' => $stu_major['pid']
    	);

    	$stu_school = M('major')->where($school_where)->find();
    	$value['school_name'] = $stu_school['major_name'];

		  
		}
    	$this->ajaxReturn($stus);
    }

    public function detail(){
    	$stuId = I('id');

    	$where = array(
    		'id' => $stuId
    	);

    	$target_stu = M('student')->where($where)->find();

    	//班级名
    	$class_where = array(
    		'id' => $target_stu['class_id']
    	);
    	$stu_class = M('class')->where($class_where)->find();
    	$target_stu['class_name'] = $stu_class['classname'];

    	//专业名
    	$major_where = array(
    		'id' => $stu_class['major_id']
    	);

    	$stu_major = M('major')->where($major_where)->find();
    	$target_stu['major_name'] = $stu_major['major_name'];


    	//学院名
    	$school_where = array(
    		'id' => $stu_major['pid']
    	);

    	$stu_school = M('major')->where($school_where)->find();
    	$target_stu['school_name'] = $stu_school['major_name'];



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