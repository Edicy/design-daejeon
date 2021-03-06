{% for article in site.latest_1_articles %}
<div id="news-block">
<h3>{{ "latest_news" | lc }}</h3>

        <ul id="news_list">
  {% for article in site.latest_articles %}
          <li>
            <a href="{{article.url}}">{{ article.title }}</a> · <span class="light">{{ article.created_at | format_date:"%b %d" }}</span>
          </li>
   {% endfor %}
        </ul>
        
        <span class="news_actions">
          <a href="{{bloglink}}.rss">RSS</a> · <a href="{{bloglink}}">{{ "older_news" | lc }}</a>
        </span>
</div>  
{% endfor %}
