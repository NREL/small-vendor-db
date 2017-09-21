<?php

/**
 * @file
 * Contains \Drupal\nrel_vr_nrel_vendor_registration\Routing\RouteSubscriber.
 */

namespace Drupal\nrel_vr_nrel_vendor_registration\Routing;

use Drupal\Core\Routing\RouteSubscriberBase;
use Symfony\Component\Routing\RouteCollection;

/**
 * Listens to the dynamic route events.
 */
class RouteSubscriber extends RouteSubscriberBase {

  /**
   * {@inheritdoc}
   */
  protected function alterRoutes(RouteCollection $collection) {
    $route = $collection->get('entity.node.latest_version');
    if ($route) {
      $route->setRequirements(array(
        '_revision_access_check' => 'TRUE',
      ));
    }
  }
}
