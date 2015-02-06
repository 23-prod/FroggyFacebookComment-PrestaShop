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
	<h2>{l s='Froggy Facebook Comment' mod='froggyfacebookcomment'}</h2>
	<div class="panel">
		<div class="panel-heading">
			<legend><img src="{$froggyfacebookcomment.module_dir}logo.png" alt="" width="16" />{l s='Froggy Facebook Comment' mod='froggyfacebookcomment'}</legend>
		</div>
		<form action="{$smarty.server.REQUEST_URI|escape:'htmlall':'UTF-8'}" method="post">
			<h3>{l s='General' mod='froggyfacebookcomment'}</h3>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Show number of comments' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
				<div class="col-lg-9">
					<img src="../img/admin/enabled.gif" alt="" />
					<input type="radio" name="FC_FC_SHOW_NB_COMMENTS" value="1" {if (isset($smarty.post.FC_FC_SHOW_NB_COMMENTS) && $smarty.post.FC_FC_SHOW_NB_COMMENTS == 1) || (!isset($smarty.post.FC_FC_SHOW_NB_COMMENTS) && $froggyfacebookcomment.FC_FC_SHOW_NB_COMMENTS)}checked="checked"{/if} />
					<label class="t">{l s='Yes' mod='froggyfacebookcomment'}</label>

					<img src="../img/admin/disabled.gif" alt="" />
					<input type="radio" name="FC_FC_SHOW_NB_COMMENTS" value="0" {if (isset($smarty.post.FC_FC_SHOW_NB_COMMENTS) && $smarty.post.FC_FC_SHOW_NB_COMMENTS == 0) || (!isset($smarty.post.FC_FC_SHOW_NB_COMMENTS) && !$froggyfacebookcomment.FC_FC_SHOW_NB_COMMENTS)}checked="checked"{/if} />
					<label class="t">{l s='No' mod='froggyfacebookcomment'}</label>
					<p class="help-block">{l s='If active, the number of comments is shown in comment tab' mod='froggyfacebookcomment'}</p>
				</div>
			</div>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Only for registered customer' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
				<div class="col-lg-9">
					<img src="../img/admin/enabled.gif" alt="" />
					<input type="radio" name="FC_FC_ONLY_FOR_CUSTOMER" value="1" {if (isset($smarty.post.FC_FC_ONLY_FOR_CUSTOMER) && $smarty.post.FC_FC_ONLY_FOR_CUSTOMER == 1) || (!isset($smarty.post.FC_FC_ONLY_FOR_CUSTOMER) && $froggyfacebookcomment.FC_FC_ONLY_FOR_CUSTOMER)}checked="checked"{/if} />
					<label class="t">{l s='Yes' mod='froggyfacebookcomment'}</label>

					<img src="../img/admin/disabled.gif" alt="" />
					<input type="radio" name="FC_FC_ONLY_FOR_CUSTOMER" value="0" {if (isset($smarty.post.FC_FC_ONLY_FOR_CUSTOMER) && $smarty.post.FC_FC_ONLY_FOR_CUSTOMER == 0) || (!isset($smarty.post.FC_FC_ONLY_FOR_CUSTOMER) && !$froggyfacebookcomment.FC_FC_ONLY_FOR_CUSTOMER)}checked="checked"{/if} />
					<label class="t">{l s='No' mod='froggyfacebookcomment'}</label>
					<p class="help-block">{l s='If active, only logged users see the Facebook comment widget' mod='froggyfacebookcomment'}</p>
				</div>
			</div>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Number of posts' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
				<div class="col-lg-9">
					<input type="text" name="FC_FC_NUM_POSTS" value="{if isset($smarty.post.FC_FC_NUM_POSTS)}{$smarty.post.FC_FC_NUM_POSTS|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FC_FC_NUM_POSTS|escape:'htmlall':'UTF-8'}{/if}" size="2" />
					<p class="help-block">{l s='The number of posts to display by default' mod='froggyfacebookcomment'}</p>
				</div>
			</div>

			<h3>{l s='Design' mod='froggyfacebookcomment'}</h3>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Width' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
				<div class="col-lg-9">
					<input type="text" name="FC_FC_WIDTH" value="{if isset($smarty.post.FC_FC_WIDTH)}{$smarty.post.FC_FC_WIDTH|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FC_FC_WIDTH|escape:'htmlall':'UTF-8'}{/if}" size="2" /> px
					<p class="help-block">{l s='The width of Facebook widget' mod='froggyfacebookcomment'}</p>
				</div>
			</div>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Color scheme' mod='froggyfacebookcomment'} <sup class="required">*</sup></label>
				<div class="col-lg-9">
					<label for="FC_FC_COLORSCHEME_light" class="FG-color-scheme-choice">
						<img src="{$module_dir}views/img/light.jpg" />
						<p><input type="radio" name="FC_FC_COLORSCHEME" id="FC_FC_COLORSCHEME_light" value="light" {if (isset($smarty.post.FC_FC_COLORSCHEME) && $smarty.post.FC_FC_COLORSCHEME == 'light') || (!isset($smarty.post.FC_FC_COLORSCHEME) && $froggyfacebookcomment.FC_FC_COLORSCHEME == 'light')}checked="checked"{/if} /> Light</p>
					</label>

					<label for="FC_FC_COLORSCHEME_dark" class="FG-color-scheme-choice">
						<img src="{$module_dir}views/img/dark.jpg" />
						<p><input type="radio" name="FC_FC_COLORSCHEME" id="FC_FC_COLORSCHEME_dark" value="dark" {if (isset($smarty.post.FC_FC_COLORSCHEME) && $smarty.post.FC_FC_COLORSCHEME == 'dark') || (!isset($smarty.post.FC_FC_COLORSCHEME) && $froggyfacebookcomment.FC_FC_COLORSCHEME == 'dark')}checked="checked"{/if} /> Dark</p>
					</label>
				</div>
			</div>

			<h3>{l s='Advanced' mod='froggyfacebookcomment'}</h3>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Administrator Facebook UID' mod='froggyfacebookcomment'}</label>
				<div class="col-lg-9">
					<input type="text" name="FC_FC_FB_ADMINS" value="{if isset($smarty.post.FC_FC_FB_ADMINS)}{$smarty.post.FC_FC_FB_ADMINS|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FC_FC_FB_ADMINS|escape:'htmlall':'UTF-8'}{/if}" />
					<p class="help-block">
						{l s='The Facebook user ids allow to' mod='froggyfacebookcomment'} <b>{l s='define users which will be allowed to view the moderation options.' mod='froggyfacebookcomment'}</b><br />
						{l s='The Facebook user ids of adminstrators, must be separated by comma.' mod='froggyfacebookcomment'}<br />
						{l s='You can get your Facebook UID on the' mod='froggyfacebookcomment'} <a href="http://findmyfacebookid.com/" target="_blank">{l s='FindMyFacebookId website.' mod='froggyfacebookcomment'}</a>
					</p>
				</div>
			</div>

			<div class="form-group clearfix">
				<label class="col-lg-3">{l s='Facebook application ID' mod='froggyfacebookcomment'}</label>
				<div class="col-lg-9">
					<input type="text" name="FC_FC_FB_APP_ID" value="{if isset($smarty.post.FC_FC_FB_APP_ID)}{$smarty.post.FC_FC_FB_APP_ID|escape:'htmlall':'UTF-8'}{else}{$froggyfacebookcomment.FC_FC_FB_APP_ID|escape:'htmlall':'UTF-8'}{/if}" />
					<b class="red">{l s='(optional)' mod='froggyfacebookcomment'}</b>
					<p class="help-block">
						{l s='The Facebook application ID isn\'t required, but it allows to moderate your Facebook comments on:' mod='froggyfacebookcomment'}
						<a href="http://developers.facebook.com/tools/comments" target="_blank">{l s='Facebook Website' mod='froggyfacebookcomment'}</a>
					</p>
				</div>
			</div>

			<div class="panel-footer">
				<input class="btn btn-default pull-right" type="submit" name="froggyfacebookcomment_config" value="{l s='Save' mod='froggyfacebookcomment'}" />
			</div>

			<p><sup class="required"><b>*</b></sup> {l s='Required fields'}</p>
		</form>
	</div>
</fieldset>
