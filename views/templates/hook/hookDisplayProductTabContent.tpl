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

<div id="idTabfroggyfacebookcomment">
	{if $froggyfacebookcomment.show_facebook_comment_widget}
	<div id="fb-root"></div>
	<div class="fb-comments"
		data-href="{$froggyfacebookcomment.current_url}"
		data-num-posts="{$froggyfacebookcomment.FC_FC_NUM_POSTS}"
		data-width="{$froggyfacebookcomment.FC_FC_WIDTH}"
		data-colorscheme="{$froggyfacebookcomment.FC_FC_COLORSCHEME}">
	</div>
	{else}
	<p>{l s='You must be logged in order to add comment' mod='froggyfacebookcomment'}</p>
	{/if}
</div>
