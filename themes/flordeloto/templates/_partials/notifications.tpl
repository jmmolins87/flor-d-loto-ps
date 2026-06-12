{if isset($notifications)}
  <aside id="notifications" aria-live="polite">
    {foreach from=$notifications key=type item=messages}
      {if $messages|@count}
        {capture name='notification_items'}
          {foreach $messages as $notification}
            {if $notification|trim !== ''}
              <li>{$notification|escape:'html':'UTF-8'}</li>
            {/if}
          {/foreach}
        {/capture}
        {if $smarty.capture.notification_items|trim !== ''}
        <div class="alert alert-{$type|escape:'html':'UTF-8'} notification notification-{$type|escape:'html':'UTF-8'}" role="alert">
          <ul>
            {$smarty.capture.notification_items nofilter}
          </ul>
        </div>
        {/if}
      {/if}
    {/foreach}
  </aside>
{/if}
