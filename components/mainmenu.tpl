<ul id="mainmenu">
  {% unless site.root_item.hidden? %}<li{% if site.root_item.selected? %} class="active"{% endif %}><a href="{{site.root_item.url}}">{{site.root_item.title}}</a></li>{% endunless %}
{% for item in site.visible_menuitems %}
  <li{% unless item.translated? %} class="untranslated"{% endunless %}{% if item.selected? %} class="active"{% endif %}><a href="{{item.url}}"{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ item.title }}</a></li>
           
    {% endfor %}
    {% if editmode %}{% if site.hidden_menuitems.size > 0 %}<li>{% menubtn site.hidden_menuitems %}{% endif %}</li>
    <li>{% menuadd %}</li>{% endif %}
    
    
      </ul>

    {% for item in site.menuitems_with_hidden %}
        {% if item.blog? %}{% assign bloglink = item.url %}{% endif %}
    {% endfor %}
    {% include "MobileMenus" %}