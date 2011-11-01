<!-- Submenu -->
{% for item in site.menuitems %}
  {% if item.selected? %}{% if editmode %}
  <ul id="mobile-submenu" class="clearfix">
    {% for l2 in item.visible_children %}
    <li{% if l2.selected? %} class="active"{% endif %}><a href="{{ l2.url }}"{% unless l2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ l2.title }}</a></li>
    {% endfor %}
    <li>{% menubtn item.hidden_children %}</li>
    <li>{% menuadd parent="item" %}</li>
  </ul>
{% else %}
{% if item.children? %}
  <ul id="mobile-submenu" class="clearfix">
    {% for l2 in item.children %}
    <li{% if l2.selected? %} class="active"{% endif %}><a href="{{l2.url}}">{{l2.title}}</a></li>
     {% endfor %}
     </ul>
  {% endif %}
  {% endif %}
  {% endif %}
{% endfor %}
