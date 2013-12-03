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

{if $froggyfacebookcomment.post_process.result === true}
<div class="conf">
	{l s='Configurations saved with success !' mod='froggyfacebookcomment'}
</div>
{elseif $froggyfacebookcomment.post_process.result === false}
<div class="error">
	<ul>
	{foreach from=$froggyfacebookcomment.post_process.errors item=error}
		<li>{$error}</li>
	{/foreach}
	</ul>
</div>
{/if}

<fieldset>
	<legend><img src="{$froggyfacebookcomment.module_dir}logo.png" alt="" width="16" />{l s='Froggy Facebook Comment' mod='froggyfacebookcomment'}</legend>

	<form action="{$smarty.server.REQUEST_URI|escape:'htmlall':'UTF-8'}" method="post">
		<h3>{l s='General' mod='froggyfacebookcomment'}</h3>

		<label>{l s='Show number of comments' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
		<div class="margin-form">
			<img src="../img/admin/enabled.gif" alt="" />
			<input type="radio" name="FG_SHOW_NB_COMMENTS" value="1" {if (isset($smarty.post.FG_SHOW_NB_COMMENTS) && $smarty.post.FG_SHOW_NB_COMMENTS == 1) || $froggyfacebookcomment.FG_SHOW_NB_COMMENTS}checked="checked"{/if} />
			<label class="t">{l s='Yes' mod='froggyfacebookcomment'}</label>

			<img src="../img/admin/disabled.gif" alt="" />
			<input type="radio" name="FG_SHOW_NB_COMMENTS" value="0" {if (isset($smarty.post.FG_SHOW_NB_COMMENTS) && $smarty.post.FG_SHOW_NB_COMMENTS == 0) || !$froggyfacebookcomment.FG_SHOW_NB_COMMENTS}checked="checked"{/if} />
			<label class="t">{l s='No' mod='froggyfacebookcomment'}</label>
			<p class="preference_description">{l s='If active, the number of comments is shown in comment tab' mod='froggyfacebookcomment'}</p>
		</div>

		<label>{l s='Only for registered customer' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
		<div class="margin-form">
			<img src="../img/admin/enabled.gif" alt="" />
			<input type="radio" name="FG_ONLY_FOR_CUSTOMER" value="1" {if (isset($smarty.post.FG_ONLY_FOR_CUSTOMER) && $smarty.post.FG_ONLY_FOR_CUSTOMER == 1) || $froggyfacebookcomment.FG_ONLY_FOR_CUSTOMER}checked="checked"{/if} />
			<label class="t">{l s='Yes' mod='froggyfacebookcomment'}</label>

			<img src="../img/admin/disabled.gif" alt="" />
			<input type="radio" name="FG_ONLY_FOR_CUSTOMER" value="0" {if (isset($smarty.post.FG_ONLY_FOR_CUSTOMER) && $smarty.post.FG_ONLY_FOR_CUSTOMER == 0) || !$froggyfacebookcomment.FG_ONLY_FOR_CUSTOMER}checked="checked"{/if} />
			<label class="t">{l s='No' mod='froggyfacebookcomment'}</label>
			<p class="preference_description">{l s='If active, only logged users see the Facebook comment widget' mod='froggyfacebookcomment'}</p>
		</div>

		<label>{l s='Number of posts' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
		<div class="margin-form">
			<input type="text" name="FG_NUM_POSTS" value="{if isset($smarty.post.FG_NUM_POSTS)}{$smarty.post.FG_NUM_POSTS|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FG_NUM_POSTS|escape:'htmlall':'UTF-8'}{/if}" size="2" />
			<p class="preference_description">{l s='The number of posts to display by default' mod='froggyfacebookcomment'}</p>
		</div>

		<h3>{l s='Design' mod='froggyfacebookcomment'}</h3>

		<label>{l s='Width' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
		<div class="margin-form">
			<input type="text" name="FG_WIDTH" value="{if isset($smarty.post.FG_WIDTH)}{$smarty.post.FG_WIDTH|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FG_WIDTH|escape:'htmlall':'UTF-8'}{/if}" size="2" /> px
			<p class="preference_description">{l s='The width of Facebook widget' mod='froggyfacebookcomment'}</p>
		</div>

		<label>{l s='Color scheme' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
		<div class="margin-form">
			<label for="FG_COLORSCHEME_light" class="FG-color-scheme-choice">
				<img src="{$module_dir}views/img/light.jpg" />
				<p><input type="radio" name="FG_COLORSCHEME" id="FG_COLORSCHEME_light" value="light" {if (isset($smarty.post.FG_COLORSCHEME) && $smarty.post.FG_COLORSCHEME == 'light') || $froggyfacebookcomment.FG_COLORSCHEME == 'light'}checked="checked"{/if} /> Light</p>
			</label>

			<label for="FG_COLORSCHEME_dark" class="FG-color-scheme-choice">
				<img src="{$module_dir}views/img/dark.jpg" />
				<p><input type="radio" name="FG_COLORSCHEME" id="FG_COLORSCHEME_dark" value="dark" {if (isset($smarty.post.FG_COLORSCHEME) && $smarty.post.FG_COLORSCHEME == 'dark') || $froggyfacebookcomment.FG_COLORSCHEME == 'dark'}checked="checked"{/if} /> Dark</p>
			</label>
		</div>
		<div class="clear"></div>

		<h3>{l s='Advanced' mod='froggyfacebookcomment'}</h3>

		<label>{l s='Administrator Facebook UID' mod='froggyfacebookcomment'}</label>
		<div class="margin-form">
			<input type="text" name="FG_FB_ADMINS" value="{if isset($smarty.post.FG_FB_ADMINS)}{$smarty.post.FG_FB_ADMINS|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FG_FB_ADMINS|escape:'htmlall':'UTF-8'}{/if}" />
			<p class="preference_description">
				{l s='The Facebook user ids of adminstrators, must be separated by comma.' mod='froggyfacebookcomment'}<br />
				{l s='You can get your Facebook UID on the' mod='froggyfacebookcomment'} <a href="https://developers.facebook.com/tools/explorer?method=GET">{l s='folowing page.' mod='froggyfacebookcomment'}</a>
			</p>
		</div>

		<label>{l s='Facebook application ID' mod='froggyfacebookcomment'}</label>
		<div class="margin-form">
			<input type="text" name="FG_FB_APP_ID" value="{if isset($smarty.post.FG_FB_APP_ID)}{$smarty.post.FG_FB_APP_ID|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FG_FB_APP_ID|escape:'htmlall':'UTF-8'}{/if}" />
			<p class="preference_description">
				{l s='The Facebook application ID isn\'t required, but it allows to moderate your Facebook comments on:' mod='froggyfacebookcomment'}
				<a href="http://developers.facebook.com/tools/comments" target="_blank">{l s='Facebook Developer Website' mod='froggyfacebookcomment'}</a>
			</p>
		</div>

		<div class="center">
			<input class="button" type="submit" name="froggyfacebookcomment_config" value="{l s='Save' mod='froggyfacebookcomment'}" />
		</div>

		<p><sup class="required">*</sup> {l s='Required fields'}</p>
	</form>
</fieldset>
