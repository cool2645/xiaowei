<?php
namespace Home\Widget;
use Think\Controller;

class SidebarWidget extends Controller {
	protected $config = array('app_type' => 'public');
	public function left($tree_menu,$badge_count){
		//dump($tree_menu);
		echo $this -> tree_nav($tree_menu,$badge_count);		
	}
	
	public function render($data) {		
		$tree = $data['tree'];
		$badge_count=$data['new_count'];
		return $this -> tree_nav($tree,$badge_count);
	}

	function tree_nav($tree,$badge_count,$level = 0) {
		//dump($tree);		
		$level++;
		$html = "";
		if (is_array($tree)){			
			if ($level >1) {
				$html = "<ul class='submenu'>\r\n";			
			} else {				
				$html = "<ul id='left_menu' class='nav nav-list'>\r\n";				
			}
			foreach ($tree as $val){
				if (isset($val["name"])) {
					$title = $val["name"];
					if (!empty($val["url"])) {
						$url = U($val['url']);
					} else {
						$url = "#";
					}
					if (empty($val["id"])) {
						$id = $val["name"];
					}else{
						$id = $val["id"];
					}
					//dump($val);
					$icon_class="";	
					$bc_count="";

					$icon="fa fa-angle-right";
					$icon_class=$val["icon"];	
					 			
					if (isset($val['_child'])) {
						$html .= "<li>\r\n";
						$html .= "<a class=\"dropdown-toggle\" node=\"$id\" href=\"" . "$url\">";
						$html .= "<i class=\"$icon\"></i>";
						$html .= "<span class=\"menu-text\">$title</span>";
						$html .= "<b class=\"arrow fa fa-angle-down\"></b>";
						if(!empty($badge_count[$val['id']])){
							$html.="<span class=\"badge badge-primary \">".$badge_count[$val['id']]."</span>";	
						}						
						$html .= "</a>\r\n";
						$html .= $this->tree_nav($val['_child'],$badge_count,$level);
						$html = $html . "</li>\r\n";
					} else {
						$html .="<li>\r\n";
						$html .="<a  node=\"$id\" href=\"" . "$url\">\r\n";
						$html .= "<i class=\"$icon\"></i>";
						$html .= "<span class=\"menu-text\">$title</span>";
						if(!empty($badge_count[$val['id']])){
							$html.="<span class=\"badge badge-primary \">".$badge_count[$val['id']]."</span>";	
						}						
						$html .="</a>\r\n</li>\r\n";
					}
				}
			}
			$html = $html . "</ul>\r\n";
		}
		return $html;
	}
}
?>