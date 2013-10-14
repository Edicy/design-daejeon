<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
{% include "SiteHeader" %}
  {{ blog.rss_link }}
</head>

<body>
  <div id="container">
    {% include "Langmenu" %}
    <div class="clearer"></div>

    <div id="header">
      <div id="logo" class="clearfix">{% editable site.header %}</div>
      {% include "Mainmenu" %}
    </div>
    <div class="clearer"></div>
    <div id="body">
      <div id="left_column" class="box_700">
      {% if tags %}
            <div class="tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
        {% endif %}
      
      {% addbutton class="add-article" %}  
        
   {% for article in articles %}
        <h2><a href="{{article.url}}">{{article.title}}</a> <span class="blog_date">{{ article.created_at | format_date:"short" }}</span></h2>

        
        <span class="news_actions">{{article.author.name}} · <strong><a href="{{article.url}}#comments">{{ "comments_for_count" | lc }}: {{article.comments_count}}</a></strong></span>
        
        <p class="clearfix">{{article.excerpt}}</p>
        <a href="{{article.url}}" class="readmore">{{"read_more"|lc}} &raquo;</a>
        <div class="blogspacing"></div>
	{% endfor %}
      </div>

      <div id="right_column" class="box_200">
        {% include "Submenu" %}
        
        {% content name="sidebar" %}
        
        {% if site.search.enabled %}{% include "Search" %}{% endif %}
      </div>
    </div>
    <div class="clearer"></div>
    <div id="footer">
       <div class="footer_content clearfix">{% xcontent name="footer" %}</div>
       <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>

    </div>
    <div class="clearer"></div>
  </div>
  {% include "JS" %}
</body>
</html>