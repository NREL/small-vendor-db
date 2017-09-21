<?php

namespace Drupal\nrel_vr_nrel_vendor_registration\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Drupal\Core\Url;
use Drupal\communications\CommunicationsNetwork as CommNet;

/**
 * Event Subscriber NrelEventSubscriber.
 */
class NrelEventSubscriber implements EventSubscriberInterface {

  /**
   * @param GetResponseEvent $event
   */
  public function onRequest(GetResponseEvent $event) {

    $request = \Drupal::request();
    $requestUrl = $request->server->get('REQUEST_URI', null);

    if ($requestUrl == '/vendor-list' && !CommNet::communications_network_is_internal() && !nrel_vr_nrel_vendor_registration_user_is_admin()) {
      $front = \Drupal\Core\Url::fromRoute('<front>')->toString();
      $event->setResponse(new RedirectResponse($front));
      drupal_set_message('You are not authorized to access this page');
    }
  }

  /**
   * Listen to kernel.request events and call customRedirection.
   * {@inheritdoc}
   * @return array Event names to listen to (key) and methods to call (value)
   */
  public static function getSubscribedEvents() {
    $events[KernelEvents::REQUEST][] = array('onRequest');
    return $events;
  }
}