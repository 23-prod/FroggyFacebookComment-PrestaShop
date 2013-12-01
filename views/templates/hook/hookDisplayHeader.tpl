{if $froggyfacebookcomment.fb_admins != null}
<meta property="fb:admins" content="{$froggyfacebookcomment.fb_admins}"/>
{/if}
{if $froggyfacebookcomment.fb_app_id != null}
<meta property="fb:app_id" content="{$froggyfacebookcomment.fb_app_id}"/>
{/if}
<script type="text/javascript">
var facebook_sdk_locale = "{$froggyfacebookcomment.locale}";
</script>
