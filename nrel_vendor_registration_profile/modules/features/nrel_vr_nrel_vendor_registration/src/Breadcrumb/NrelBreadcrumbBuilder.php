<?php

namespace Drupal\nrel_vr_nrel_vendor_registration\Breadcrumb;

use Drupal\Core\Breadcrumb\Breadcrumb;
use Drupal\Core\Breadcrumb\BreadcrumbBuilderInterface;
use Drupal\Core\Routing\RouteMatchInterface;
use Drupal\Core\Link;
use Drupal\communications\CommunicationsNetwork as CommNet;

class NrelBreadcrumbBuilder implements BreadcrumbBuilderInterface{
  /**
   * {@inheritdoc}
   */
  public function applies(RouteMatchInterface $attributes) {
    $parameters = $attributes->getParameters()->all();
    if (!empty($parameters['node'])) {
      return $parameters['node']->getType() == 'vendor_or_subcontractor_registra';
    }
  }

  /**
   * {@inheritdoc}
   */
  public function build(RouteMatchInterface $route_match) {
    $breadcrumb = new Breadcrumb();
    $breadcrumb->addLink(Link::createFromRoute('Home', '<front>'));
    if (nrel_vr_nrel_vendor_registration_user_is_admin()) {
      $breadcrumb->addLink(Link::createFromRoute('Vendor List', 'view.vendor_list_admin.page_1'));
    } elseif (CommNet::communications_network_is_internal()) {
      $breadcrumb->addLink(Link::createFromRoute('Vendor List', 'view.vendor_list_public.page_1'));
    }
    return $breadcrumb;
  }

}