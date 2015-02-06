{*
* 2013-2015 Froggy Commerce
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
*  @copyright  2013-2015 Froggy Commerce
*}

<li>
	<a href="#idTabfroggyfacebookcomment" class="idTabHrefShort">
		{l s='Comments' mod='froggyfacebookcomment'}
		{if $froggyfacebookcomment.show_nb_comment}
		(<div class="fb-comments-count" data-href="{$froggyfacebookcomment.current_url}" style="display: inline;"></div>)
		{/if}
	</a>
</li>
