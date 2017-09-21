<?php

namespace Drupal\nrel_vr_nrel_vendor_registration\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Class NrelConfigForm.
 */
class NrelConfigForm extends ConfigFormBase {

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return [
      'nrel_vr_nrel_vendor_registration.nrelconfig',
    ];
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'nrel_config_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $config = $this->config('nrel_vr_nrel_vendor_registration.nrelconfig');

    // yearly email (to applicant)
    $form['yearly_email_subject'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Yearly Email Subject'),
      '#description' => $this->t('Allows the use of node tokens'),
      '#maxlength' => 255,
      '#size' => 64,
      '#default_value' => $config->get('yearly_email_subject'),
      '#prefix' => '<h2>Yearly Email</h2>',
    ];
    $form['yearly_email_body'] = [
      '#type' => 'textarea',
      '#title' => $this->t('Yearly Email Body'),
      '#description' => $this->t('Allows the use of node tokens. We recommend always including [node:edit-url] as a way for users to edit their content.'),
      '#default_value' => $config->get('yearly_email_body'),
    ];

    // moderation email (to admins)
    $form['admin_moderation_email_subject'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Admin Moderation Email Subject'),
      '#description' => $this->t('Allows the use of node tokens'),
      '#maxlength' => 255,
      '#size' => 64,
      '#default_value' => $config->get('admin_moderation_email_subject'),
      '#prefix' => '<h2>Moderation Email</h2>',
    ];
    $form['admin_moderation_email_body'] = [
      '#type' => 'textarea',
      '#title' => $this->t('Admin Moderation Email Body'),
      '#description' => $this->t('Allows the use of node tokens.'),
      '#default_value' => $config->get('admin_moderation_email_body'),
    ];

    // confiration email (to applicant)
    $form['registration_confirmation_email_subject'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Registration Confirmation Email Subject'),
      '#description' => $this->t('Allows the use of node tokens'),
      '#maxlength' => 255,
      '#size' => 64,
      '#default_value' => $config->get('registration_confirmation_email_subject'),
      '#prefix' => '<h2>Registration Confirmation Email</h2>',
    ];
    $form['registration_confirmation_email_body'] = [
      '#type' => 'textarea',
      '#title' => $this->t('Registration Confirmation Email Body'),
      '#description' => $this->t('Allows the use of node tokens.'),
      '#default_value' => $config->get('registration_confirmation_email_body'),
    ];

    // Add the token tree UI.
    $form['token_tree'] = [
      '#theme' => 'token_tree_link',
      '#token_types' => array('node'), // allows the use of node tokens
      '#show_restricted' => TRUE,
      '#weight' => 90,
    ];

    return parent::buildForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    parent::validateForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    parent::submitForm($form, $form_state);

    $this->config('nrel_vr_nrel_vendor_registration.nrelconfig')
      ->set('yearly_email_subject', $form_state->getValue('yearly_email_subject'))
      ->set('yearly_email_body', $form_state->getValue('yearly_email_body'))
      ->set('admin_moderation_email_subject', $form_state->getValue('admin_moderation_email_subject'))
      ->set('admin_moderation_email_body', $form_state->getValue('admin_moderation_email_body'))
      ->set('registration_confirmation_email_subject', $form_state->getValue('registration_confirmation_email_subject'))
      ->set('registration_confirmation_email_body', $form_state->getValue('registration_confirmation_email_body'))
      ->save();
  }

}
