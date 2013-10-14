<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	{% include "SiteHeader" %}
  <!--[if IE 6]>
  <style type="text/css">
  .comments_area {
  position: static;
  }
  </style>
  <![endif]-->
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
        <h2>{% editable article.title %} <span class="blog_date">{{ article.created_at | format_date:"short" }}</span></h2>

        
        <span class="news_actions">{{article.author.name}} · <strong><a href="#comments">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>
</a></strong></span><br />
        
        <div class="excerpt clearfix">{% editable article.excerpt %}</div>
        {% editable article.body %}
        
        {% if editmode %}
            <div class="cfx article-tags">
                <div class="article-tag-icon"></div>
                {% editable article.tags %}
            </div>
          {% else %}
            {% unless article.tags == empty %}
                <div class="cfx article-tags">
                    <div class="article-tag-icon"></div>
                    {% for tag in article.tags %}
                        <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                </div>
            {% endunless %}
          {% endif %}
        
        <div class="comments_area">
          <a name="comments"></a>
          <h2>{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>
          {% for comment in article.comments %}
          <div class="comment_area edy-site-blog-comment">
            <div class="comment_author">{% removebutton %} {{ comment.author }}</div>
            <div class="comment">{{ comment.body_html }}</div>
            <div class="clearer"></div>
          </div>
          
          <div class="clearer"></div>
          {% endfor %}
          
          
          <div class="comment_form">
    {% commentform %}
          {% unless comment.valid? %}<div class="comment_form_errors">
            <ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>
          </div>{% endunless %}
            
            <h2>{{"add_a_comment"|lc}}</h2>

            <label for="comment_name">{{"name"|lc}}</label>
            <input type="text" id="comment_name" name="comment[author]" value="{{comment.author}}" class="textbox" /><br/>
            
            <label for="comment_mail">{{"email"|lc}}</label>
            <input type="text" id="comment_mail" name="comment[author_email]" value="{{comment.author_email}}" class="textbox" /><br/>
            
            <label for="comment_text">{{"comment"|lc}}</label>
            <textarea id="comment_text" name="comment[body]" class="textarea">{{comment.body}}</textarea><br/>
            
            <input class="submit" type="submit" value="{{"submit" | lc }}" />
    {% endcommentform %}
          </div>
        </div>
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
