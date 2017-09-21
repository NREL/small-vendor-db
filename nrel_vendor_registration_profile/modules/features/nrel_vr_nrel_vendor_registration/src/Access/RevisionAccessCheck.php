<?php

namespace Drupal\nrel_vr_nrel_vendor_registration\Access;

use Drupal\Core\Access\AccessResult;
use Drupal\Core\Routing\Access\AccessInterface;
use Drupal\Core\Session\AccountInterface;
use Drupal\node\NodeInterface;
use Symfony\Component\Routing\Route;


/**
 * Checks access for displaying configuration translation page.
 */
class RevisionAccessCheck implements AccessInterface {

  /**
   * A custom access check.
   *
   * @param \Drupal\Core\Session\AccountInterface $account
   *   Run access checks for this account.
   */
  public function access(AccountInterface $account, Route $route, NodeInterface $node) {
    // Check permissions and combine that with any custom access checking needed. Pass forward
    // parameters from the route and/or request as needed.


    $allowed_roles = array(
      'administrator',
      'vendor_or_subcontractor_registra_creator',
      'vendor_or_subcontractor_registra_reviewer',
      'developer',
    );
    if (array_intersect($allowed_roles, $account->getRoles())) {
      return AccessResult::allowed();
    }
    if ($account->isAnonymous()) {
      $revision_ids = \Drupal::entityManager()->getStorage('node')->revisionIds($node);
      if (count($revision_ids) < 2) {
        return AccessResult::forbidden();
      } elseif (isset($_SESSION['edit_token']) && $_SESSION['edit_token'] == $node->field_edit_token->value) {
        return AccessResult::allowed();
      } else {
        return AccessResult::forbidden();
      }
    }
  }
}
