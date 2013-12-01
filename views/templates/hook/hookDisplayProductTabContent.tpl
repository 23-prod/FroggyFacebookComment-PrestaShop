<div id="idTabfroggyfacebookcomment">
	{if $froggyfacebookcomment.show_facebook_comment_widget}
	<div id="fb-root"></div>
	<div class="fb-comments"
		data-href="{$froggyfacebookcomment.current_url}"
		data-num-posts="{$froggyfacebookcomment.FG_NUM_POSTS}"
		data-width="{$froggyfacebookcomment.FG_WIDTH}"
		data-colorscheme="{$froggyfacebookcomment.FG_COLORSCHEME}">
	</div>
	{else}
	<p>{l s='You must be logged in order to add comment' mod='froggyfacebookcomment'}</p>
	{/if}
</div>
