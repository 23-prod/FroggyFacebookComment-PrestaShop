{*
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
*}

{if $froggyfacebookcomment.fb_admins != null}
<meta property="fb:admins" content="{$froggyfacebookcomment.fb_admins}"/>
{/if}
{if $froggyfacebookcomment.fb_app_id != null}
<meta property="fb:app_id" content="{$froggyfacebookcomment.fb_app_id}"/>
{/if}
<script type="text/javascript">
var facebook_sdk_locale = "{$froggyfacebookcomment.locale}";
</script>
