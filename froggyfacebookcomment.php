<?php
/*
* 2013-2014 Froggy Commerce
*
* NOTICE OF LICENSE
*
* You should have received a licence with this module.
* If you didn't buy this module on Froggy-Commerce.com, ThemeForest.net
* or Addons.PrestaShop.com, please contact us immediately : contact@froggy-commerce.com
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to benefit the updates
* for newer PrestaShop versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author Froggy Commerce <contact@froggy-commerce.com>
*  @copyright  2013-2014 Froggy Commerce
*/

// Security
defined('_PS_VERSION_') || require dirname(__FILE__).'/index.php';

// Include Froggy Library
if (!class_exists('FroggyModule', false)) require_once dirname(__FILE__).'/froggy/FroggyModule.php';

/**
 * Module Froggy Facebook Comment
 *
 * Version: 1.0.0
 */
class FroggyFacebookComment extends FroggyModule
{
	/**
	 * @var array contains error form postProcess()
	 */
	protected $errors = array();

	/**
	 * @var array contains the different color scheme theme purpose by Facebook
	 */
	protected $color_scheme = array(
		'light',
		'dark'
	);

	/**
	 * Constructor
	 */
	public function __construct()
	{
		parent::__construct();

		$this->displayName = $this->l('Froggy Facebook Comment');
		$this->description = $this->l('Allows your customers to post a comment on product page with Facebook');
	}

	/**
	 * {@inheritdoc}
	 */
	public function getContent()
	{
		$this->context->controller->addCss($this->_path.'views/css/backend.css');

		$configurations = $this->getModuleConfigurations();

		// Call POST process
		$assign = array(
			'post_process' => array(
				'result' => $this->postProcess(),
				'errors' => $this->errors
			),
			'module_dir' => $this->_path
		);

		$this->smarty->assign($this->name, array_merge($configurations, $assign));
		return $this->fcdisplay(__FILE__, 'getcontent.tpl');
	}

	/**
	 * Hook Display Header
	 * Uses for adding javascript and assign information for Facebook meta
	 *
	 * @param $params
	 * @return string display for this hook
	 */
	public function hookDisplayHeader($params)
	{
		$content = null;
		// We include Facebook SDK and Facebook meta only if restricted content can be shown
		if ($this->isShowRestrictedContent())
		{
			// Register media
			$this->context->controller->addJs($this->_path.'views/js/facebook-sdk.js');
			$this->context->smarty->assign($this->name, array(
				'fb_admins' => Configuration::get('FC_FC_FB_ADMINS'),
				'fb_app_id' => Configuration::get('FC_FC_FB_APP_ID'),
				'locale' => strtolower($this->context->language->iso_code).'_'.strtoupper($this->context->language->iso_code)
			));
			$content = $this->fcdisplay(__FILE__, 'hookDisplayHeader.tpl');
		}
		return $content;
	}

	/**
	 * Hook Display Product Tab
	 * Uses for adding product tab in product page
	 *
	 * @param $params
	 * @return string display for this hook
	 */
	public function hookDisplayProductTab($params)
	{
		if (version_compare(_PS_VERSION_, '1.6.0') >= 0) {
			return;
		}

		$this->smarty->assign($this->name, array(
			'current_url' => $this->getCurrentUrl(),
			'show_nb_comment' => $this->isShowRestrictedContent() && Configuration::get('FC_FC_SHOW_NB_COMMENTS')
		));
		return $this->fcdisplay(__FILE__, 'hookDisplayProductTab.tpl');
	}

	/**
	 * Hook Display Product Tab Content
	 * Uses in order to fill product tab add by the hookDisplayProductTab
	 *
	 * @param $params
	 * @return string display for this hook
	 */
	public function hookDisplayProductTabContent($params)
	{
		$assign = array(
			'current_url' => $this->getCurrentUrl(),
			'show_facebook_comment_widget' => $this->isShowRestrictedContent()
		);

		// We assign configuration for Facebook widget only if restricted content can be shown
		if ($this->isShowRestrictedContent())
		{
			$comment_widget_configurations = Configuration::getMultiple(array(
				'FC_FC_NUM_POSTS',
				'FC_FC_WIDTH',
				'FC_FC_COLORSCHEME'
			));
			$this->smarty->assign($this->name, array_merge($assign, $comment_widget_configurations));
		}
		else
			$this->smarty->assign($this->name, $assign);

		return $this->fcdisplay(__FILE__, 'hookDisplayProductTabContent.tpl');
	}

	/**
	 * Hook Action Admin Controller SetMedia
	 * Uses in order to add CSS file in backend
	 *
	 * @param $params
	 */
	public function hookActionAdminControllerSetMedia($params)
	{
		if (Tools::getValue('controller') == 'adminmodules' && Tools::getValue('configure') == $this->name)
			$this->context->controller->addCSS($this->_path.'views/css/backend.css', 'all');
	}

	/**
	 * Uses for treat data form getContent form
	 *
	 * @return bool, this method can return null, if form isn't send
	 */
	protected function postProcess()
	{
		$result = null;
		if (Tools::isSubmit('froggyfacebookcomment_config'))
		{
			// Validate fields
			if (!Validate::isInt(Tools::getValue('FC_FC_NUM_POSTS')))
				$this->errors[] = $this->l('Number of posts is incorrect');
			if (!Validate::isInt(Tools::getValue('FC_FC_WIDTH')))
				$this->errors[] = $this->l('Width is incorrect');
			if (!in_array(Tools::getValue('FC_FC_COLORSCHEME'), $this->color_scheme))
				$this->errors[] = $this->l('Color scheme is incorrect');
			if (!Validate::isInt(Tools::getValue('FC_FC_SHOW_NB_COMMENTS')))
				$this->errors[] = $this->l('Show number of comment field is incorrect');
			if (Tools::getValue('FC_FC_FB_ADMINS'))
			{
				$uids = explode(',', Tools::getValue('FC_FC_FB_ADMINS'));
				foreach($uids as $uid)
					if (!preg_match('/^[0-9]+$/Ui', trim($uid)))
						$this->errors[] = $this->l('A Facebook UID is incorrect');
				// Avoid duplicate errors
				$this->errors = array_unique($this->errors);
			}
			if (Tools::getValue('FC_FC_FB_APP_ID') != null && !preg_match('/^[0-9]+$/Ui', trim(Tools::getValue('FC_FC_FB_APP_ID'))))
				$this->errors[] = $this->l('Facebook application ID is incorrect');
			if (!Validate::isInt(Tools::getValue('FC_FC_ONLY_FOR_CUSTOMER')))
				$this->errors[] = $this->l('Only for registered customer field is incorrect');

			if (!count($this->errors))
			{
				foreach($this->getModuleConfigurationsKeys() as $configuration)
					Configuration::updateValue($configuration, Tools::getValue($configuration));
				$result = true;
			}
			else
				$result = false;
		}
		return $result;
	}

	/**
	 * Return the current url of page
	 * @return string
	 */
	protected function getCurrentUrl()
	{
		$url = Tools::htmlentitiesUTF8($this->context->link->protocol_link.
			$_SERVER['SERVER_NAME'].
			$_SERVER['REQUEST_URI']);
		return str_replace('&amp;', '&', $url);
	}

	/**
	 * Return true if customer is logged
	 * @return bool
	 */
	protected function isCustomerLogged()
	{
		return (bool)$this->context->customer->id;
	}

	/**
	 * Return true if we can show restricted content
	 * @return bool
	 */
	protected function isShowRestrictedContent()
	{
		return (Configuration::get('FC_FC_ONLY_FOR_CUSTOMER') && $this->isCustomerLogged())
			|| !Configuration::get('FC_FC_ONLY_FOR_CUSTOMER');
	}

	/**
	 * Backward 1.4
	 */
	public function hookBackOfficeHeader($params) { return '<link href="'.$this->_path.'views/css/backend.css" rel="stylesheet" type="text/css" media="all" />'; }
	public function hookHeader($params) { return $this->hookDisplayHeader($params); }
	public function hookProductTab($params) { return $this->hookDisplayProductTab($params); }
	public function hookProductTabContent($params) { return $this->hookDisplayProductTabContent($params); }
}
