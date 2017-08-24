<?php
if(!empty($atom_to_html)) {
  print '<h3>Materials Available from the Service Desk</h3>';
  print '<div class="upei-roblib-reserves">' . $atom_to_html . '</div>';
}
?>
