---
title: "Frequently Asked Questions"
origin: "faq"
php: null
compass: null
read_time: null
permalink: /faq/

toc:
  - name: "Introduction to PHP"
    anchor: "intro"
  - name: "PHP Community"
    anchor: "community"
  - name: "Databases and PHP"
    anchor: "databases"
  - name: "Security and PHP"
    anchor: "security"
  - name: "Testing and Code Quality"
    anchor: "testing"
  - name: "Packages and Dependencies"
    anchor: "packages"
  - name: "PHP Frameworks"
    anchor: "frameworks"
  - name: "API"
    anchor: "api"
  - name: "OOP"
    anchor: "oop"
  - name: "General"
    anchor: "general"
---

<div class="ui styled fluid accordion">
  {% for group in page.toc %}
  <div class="active title" id="{{ group.anchor }}">
    <i class="dropdown icon"></i>
    {{ group.name }}
  </div>
  <div class="active content">
    <div class="ui relaxed divided list">
    {% for item in site.faq %}
    {% if item.group == group.anchor %}
      <div class="item">
        <i class="large help middle aligned icon"></i>
        <div class="content">
          <a class="header" href="{{ item.permalink }}">{{ item.title }}</a>
          <div class="description">Intended for PHP {{ item.php }}+</div>
        </div>
      </div>
    {% endif %}
    {% endfor %}
    </div>
  </div>
  {% endfor %}
</div>
