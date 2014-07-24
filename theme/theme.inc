<?php
/**
 * @file
 * Contains preprocessor hooks.
 */

/**
 * Implements hook_preprocess().
 */
function upei_roblib_reserves_preprocess_upei_roblib_reserves(&$variables) {
  $node = menu_get_object();
  $variables['atom_to_html'] = "No Reserves Found";
  if ($node && $node->nid && $node->type == 'course_reserve') {
    $book_bag_id = $node->field_bookbag_id['und'][0]['value'];
    $book_bag_base_url = variable_get('upei_roblib_reserves_book_bag_base_url', 'http://islandpines.roblib.upei.ca/opac/extras/feed/bookbag/atom-full/');
    $atom = drupal_http_request($book_bag_base_url . $book_bag_id);
    if ($atom->status_message == 'OK') {
      $path = drupal_get_path('module', 'upei_roblib_reserves');
      $atom->data;
      $xslt = new XSLTProcessor();
      $xsl = new DOMDocument();
      $xsl->load($path . '/xsl/atom2html.xsl');
      $xslt->importStylesheet($xsl);
      $xml = new DomDocument();
      $xml->loadXML($atom->data);
      $html = $xslt->transformToXML($xml);
      $variables['atom_to_html'] = $html;
    }
  }
}

